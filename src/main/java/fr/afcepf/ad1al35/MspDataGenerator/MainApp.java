package fr.afcepf.ad1al35.MspDataGenerator;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;
import fr.afcepf.ad1al35.MspDataGenerator.dto.Booking;
import fr.afcepf.ad1al35.MspDataGenerator.dto.Bookmark;
import fr.afcepf.ad1al35.MspDataGenerator.dto.Evaluation;
import fr.afcepf.ad1al35.MspDataGenerator.dto.EvaluationForSql;
import fr.afcepf.ad1al35.MspDataGenerator.dto.Product;
import fr.afcepf.ad1al35.MspDataGenerator.dto.User;
import fr.afcepf.ad1al35.MspDataGenerator.utils.ValueGenerator;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class MainApp {

	private static final LocalDate APP_EARLIEST_DATE = LocalDate.now().plusYears(-3);
	private static final int BOOKINGS_TO_GENERATE = 6000;
	private static final String DATA_RESOURCES_FOLDER = "src/main/resources/data/";
	private static final String DATA_TARGET_FOLDER = "target/data/";
	private static final double EVALUATIONS_LEFT_RATIO = 0.3;
	private static final double PRODUCTS_QUANTITY = 30;

	public static void main(String[] args) throws IOException {

		ObjectMapper mapper = new ObjectMapper();

		CollectionType javaType = mapper.getTypeFactory().constructCollectionType(List.class, Product.class);
		List<Product> products = mapper.readValue(new File(DATA_RESOURCES_FOLDER + "products.json"), javaType);

		/* ******************** importing users to include username in booking ******************** */
		javaType = mapper.getTypeFactory().constructCollectionType(List.class, User.class);
		List<User> users = mapper.readValue(new File(DATA_RESOURCES_FOLDER + "users.json"), javaType);
		removeDuplicatedUsernames(users);
		removeDuplicatedBookmarks(users);

		/* ******************** creating users json file ******************** */
		mapper.writeValue(new File(DATA_TARGET_FOLDER + "users-import.json"), users);
		System.out.println("*** users-out.json created ***\r\n");

		/* ******************** generating bookings list ******************** */
		List<Booking> bookings = buildBookings(products, users);
		removeCollidingBookings(bookings);

		/* ******************** generating evaluations and adding them to bookings ******************** */
		List<EvaluationForSql> evaluations = createEvaluations(bookings);

		/* *** creating msp-product-housing mysql import to load in db after starting msp-product-housing *** */
		createProductHousingSqlImport(evaluations);
		System.out.println("*** msp-product-housing-import.sql created ***");

		/* ******************** creating bookings json file ******************** */
		mapper.writeValue(new File(DATA_TARGET_FOLDER + "bookings-import.json"), bookings);
		System.out.println("*** bookings-out.json created ***");
	}

	public static void removeDuplicatedUsernames(List<User> users) {
		List<String> uniqueUsernames = new ArrayList<>();
		List<User> usersToRemove = new ArrayList<>();
		for (User u : users) {
			boolean isAlreadyInUniqueList = uniqueUsernames.contains(u.getUsername());
			if (!isAlreadyInUniqueList) uniqueUsernames.add(u.getUsername());
			else usersToRemove.add(u);
		}
		System.out.println("-USERS-");
		System.out.println(usersToRemove.size() + " duplicated users removed out of " + users.size() + " generated.");
		for (User u : usersToRemove) {
			users.remove(u);
		}
		System.out.println(users.size() + " users remaining.\r\n");
	}

	public static void removeDuplicatedBookmarks(List<User> users) {
		System.out.println("-BOOKMARKS-");
		int bookmarksRemoved = 0;
		int bookmarksTotal = 0;
		for (User u : users) {
			List<Long> idProducts = new ArrayList<>();
			List<Bookmark> bookmarkToRemove = new ArrayList<>();
			for (Bookmark b : u.getBookmarks()) {
				bookmarksTotal++;
				if (idProducts.contains(b.getIdProduct()) || b.getIdProduct() == 0 || b.getIdProduct() > PRODUCTS_QUANTITY) {
					bookmarkToRemove.add(b);
					bookmarksRemoved++;
				} else {
					idProducts.add(b.getIdProduct());
				}
			}
			for (Bookmark b : bookmarkToRemove) {
				u.getBookmarks().remove(b);
			}
		}
		System.out.println(bookmarksRemoved + " duplicated bookmarks removed from users out of " +
				bookmarksTotal + ".");
		System.out.println((bookmarksTotal - bookmarksRemoved) + " bookmarks remaining.\r\n");
	}

	public static List<Booking> buildBookings(List<Product> products, List<User> users) {
		System.out.println("Building bookings. This may take a while...\r\n");
		List<Booking> bookings = new ArrayList<>();
		for (int i = 0; i < BOOKINGS_TO_GENERATE; i++) {

			/* ******************** Init new booking/product combo ******************** */
			Random rand = new Random();

			Product randomProduct = products.get(rand.nextInt(products.size()));

			Booking booking = new Booking();
			booking.setProduct(randomProduct);

			int index = (int) Math.floor(Math.random() * users.size());
			if(index < 1 ) index = 1;
			booking.setUsername(users.get(index).getUsername());

			booking.setPets(false);
			booking.setCanceled(false);

			/* ******************** setting various dates ******************** */

			// Booking date is generated as a LocalDate to simplify process, then converted in LocalDateTime later
			LocalDate generatedBookingDate = ValueGenerator.generateRandomLocalDate(APP_EARLIEST_DATE, LocalDate.now());
			LocalDateTime generatedBookingDateTime = generatedBookingDate.atTime(
					ValueGenerator.generateRandomNumber(0,23),
					ValueGenerator.generateRandomNumber(0,59),
					ValueGenerator.generateRandomNumber(0,59)
			);
			booking.setBookingDate(generatedBookingDateTime.toString());

			// Check-in date is generated as a LocalDate with Booking date as a min and a 1 year later limit as a max
			LocalDate generatedCheckInDate =
					ValueGenerator.generateRandomLocalDate(generatedBookingDate, generatedBookingDate.plusYears(1));
			booking.setCheckInDate(generatedCheckInDate.toString());

			// Check-out date is generated as a LocalDate with Check-in date + 1 day as a min and a 21 days
			// later limit as a max
			LocalDate generatedCheckOutDate =
					generatedCheckInDate.plusDays(ValueGenerator.generateRandomWeightedDuration());
			booking.setCheckOutDate(generatedCheckOutDate.toString());

			/* ******************** setting guests number ******************** */
			Integer guestsNumber = ValueGenerator.generateRandomNumber(1, randomProduct.getMaxGuests());
			booking.setGuestsNumber(guestsNumber);

			/* ******************** setting total price ******************** */
			Long totalToPay =
					ValueGenerator.calculateTotalPrice(randomProduct.getDailyrate(), generatedCheckInDate,
							generatedCheckOutDate);
			booking.setTotalToPay(totalToPay);

			/* ******************** filling the list ******************** */
			bookings.add(booking);
		}
		return bookings;
	}

	public static void removeCollidingBookings(List<Booking> bookings) {
		List<Booking> bookingsToRemove = new ArrayList<>();
		for (Booking b : bookings) {
			for (Booking bRef : bookings) {
				boolean isTheSameProduct = b.getProduct().getIdProduct().equals(bRef.getProduct().getIdProduct());
				boolean isAlreadyInRemovedList = bookingsToRemove.contains(bRef);
				boolean isBetweenChechInAndCheckOut = false;
				boolean isBeforeCheckInAndAfterCheckOut = false;
				if ((b.getCheckInDate().compareTo(bRef.getCheckInDate()) > 0 &&
						b.getCheckInDate().compareTo(bRef.getCheckOutDate()) < 0)
						||
					(b.getCheckOutDate().compareTo(bRef.getCheckInDate()) > 0 &&
							b.getCheckOutDate().compareTo(bRef.getCheckOutDate()) < 0))
				{
					isBetweenChechInAndCheckOut = true;
				} else if (b.getCheckInDate().compareTo(bRef.getCheckInDate()) < 0 &&
						b.getCheckOutDate().compareTo(bRef.getCheckOutDate()) > 0)
				{
					isBeforeCheckInAndAfterCheckOut = true;
				}
				if (isTheSameProduct &&
						!isAlreadyInRemovedList &&
						(isBetweenChechInAndCheckOut || isBeforeCheckInAndAfterCheckOut) &&
						!bookingsToRemove.contains(b)) {
					bookingsToRemove.add(b);
				}
			}
		}
		System.out.println("-BOOKINGS-");
		System.out.println(
				bookingsToRemove.size() + " colliding bookings removed out of " + bookings.size() + " generated.");
		for (Booking b : bookingsToRemove) {
			bookings.remove(b);
		}
		System.out.println(bookings.size() + " bookings remaining.\r\n");
	}

	public static List<EvaluationForSql> createEvaluations(List<Booking> bookings) {
		String[] commentaries = populateCommentaries();
		List<EvaluationForSql> evaluations = new ArrayList<>();
		for (int i = 0; i < bookings.size(); i++) {
			Booking booking = bookings.get(i);
			boolean toBeOrNotToBe = Math.random() < EVALUATIONS_LEFT_RATIO;
			if (booking.getCheckOutDate().compareTo(LocalDate.now().toString()) < 0 && toBeOrNotToBe) {
				// This evaluation will go into the sql import (add escape characters in the commentary )
				Evaluation evaluationForSql = new Evaluation(
						booking.getCheckOutDate(),
						commentaries[i % commentaries.length].replace("'", "\\'"),
						ValueGenerator.generateRandomWeightedRating(),
						ValueGenerator.generateRandomWeightedRating(),
						ValueGenerator.generateRandomWeightedRating(),
						ValueGenerator.generateRandomWeightedRating()
				);
				evaluations.add(new EvaluationForSql(
						(long) evaluations.size() + 1, evaluationForSql, booking.getProduct(),
						booking.getUsername()));
				// That evaluation will end up in the bookings-out.json (no escape characters)
				Evaluation evaluationForJson = new Evaluation(
						booking.getCheckOutDate(),
						commentaries[i % commentaries.length],
						ValueGenerator.generateRandomWeightedRating(),
						ValueGenerator.generateRandomWeightedRating(),
						ValueGenerator.generateRandomWeightedRating(),
						ValueGenerator.generateRandomWeightedRating()
				);
				booking.setEvaluation(evaluationForJson);
			}
		}
		System.out.println("-EVALUATIONS-");
		System.out.println(evaluations.size() + " evaluations created.\r\n");
		return evaluations;
	}

	public static String[] populateCommentaries() {
		return new String[]{
				"C'était super !",
				"Assez génial !",
				"Super tendance !",
				"Etonnant...",
				"Un peu effrayant.",
				"Une décadence totale !",
				"Il y avait une drôle d'odeur.",
				"Un goût du luxe.",
				"Ahhhhh Paris...",
				"J'ai vu mieux.",
				"Trop cher pour ce que c'est.",
				"Une affaire !",
				"Quartier désagréable.",
				"Je suis envouté.",
				"Spacieux et spartiate",
				"Je reviendrai !",
				"Bof...",
				"Vue sympa.",
				"J'ai bien mangé",
				"Le voisin de gauche était bizarre.",
				"La voisine était jolie :)",
				"Service impeccable !",
				"Bonne communication.",
				"Un séjour agréable",
				"Une plongée dans le vraie vie.",
				"Pas mal.",
				"Déconcertant.",
				"Dans l'ensemble, j'ai adoré.",
				"Un bon choix.",
				"What a trip!",
				"I had a blast",
				"Top quality",
				"GREAT !",
				"I loved it.",
				"A bit expensive.",
				"Paris smells like dog poop.",
				"I can't go back my small flat now.",
				"Bueno !",
				"What a view !",
				"Living like a prince.",
				"Quality service",
				"I'll recommend it.",
				"What a plaisant surprise !",
				"A dream house in the city of lights.",
				"An exciting night life !",
				"Recommended.",
				"I'll come back.",
				"Second time I come, still pleased.",
				"Could have had and extra room.",
				"Strange noises coming from the toilets."
		};
	}

	public static void createProductHousingSqlImport(List<EvaluationForSql> evaluations) {
		try {
			File inputFilePart1 = new File(DATA_RESOURCES_FOLDER + "msp-product-housing-part-1.sql");
			File inputFilePart2 = new File(DATA_RESOURCES_FOLDER + "msp-product-housing-part-2.sql");
			File inputFilePart3 = new File(DATA_RESOURCES_FOLDER + "msp-product-housing-part-3.sql");
			List<File> inputFiles = new ArrayList<>();
			inputFiles.add(inputFilePart1);
			inputFiles.add(inputFilePart2);
			inputFiles.add(inputFilePart3);

			File outputFile = new File(DATA_TARGET_FOLDER + "msp-product-housing-import.sql");
			FileOutputStream outputStream = new FileOutputStream(outputFile);

			for (int i = 0; i < inputFiles.size(); i++) {
				FileInputStream inputStream = null;
				inputStream = new FileInputStream(inputFiles.get(i));

				byte[] buffer = new byte[1024];
				int length;
				while ((length = inputStream.read(buffer)) > 0) {
					outputStream.write(buffer, 0, length);
				}

				if (i == 0) {
					outputStream.write(
						(
							") ENGINE=InnoDB AUTO_INCREMENT=" +
							(evaluations.size() + 1) +
							" DEFAULT CHARSET=latin1;"
						).getBytes()
					);
				}
				else if (i == 1) {
					for (int j = 0; j < evaluations.size(); j++) {
						EvaluationForSql evaluation = evaluations.get(j);
						outputStream.write(
							(
								"(" +
								evaluation.getIdEvaluation() +
								", '" +
								evaluation.getEvaluation().getCommentary() +
								"', " +
								evaluation.getEvaluation().getCommunication() +
								", '" +
								evaluation.getEvaluation().getEvaluationDate() +
								" 00:00:00.000000', " +
								evaluation.getEvaluation().getLocation() +
								", " +
								evaluation.getEvaluation().getResidence() +
								", '" +
								evaluation.getUsername() +
								"', " +
								evaluation.getEvaluation().getValueForMoney() +
								", " +
								evaluation.getProduct().getIdProduct() +
								")"
							).getBytes()
						);
						if (j < evaluations.size() - 1) {
							outputStream.write((",\r\n").getBytes());
						} else {
							outputStream.write((";\r\n").getBytes());
						}
					}
				}
				inputStream.close();
			}
			outputStream.close();
		} catch(IOException e){
			e.printStackTrace();
		}
	}
}
