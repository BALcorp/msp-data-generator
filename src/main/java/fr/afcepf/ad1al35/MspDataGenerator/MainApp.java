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

	public static void main(String[] args) throws IOException {

		ObjectMapper mapper = new ObjectMapper();

		CollectionType javaType = mapper.getTypeFactory().constructCollectionType(List.class, Product.class);
		List<Product> products = mapper.readValue(new File(DATA_RESOURCES_FOLDER + "products-in.json"), javaType);

		/* ******************** importing users to include username in booking ******************** */
		javaType = mapper.getTypeFactory().constructCollectionType(List.class, User.class);
		List<User> users = mapper.readValue(new File(DATA_RESOURCES_FOLDER + "users-in.json"), javaType);
		removeDuplicatedUserNames(users);
		removeDuplicatedBookmarks(users);

		/* ******************** creating users json file ******************** */
		mapper.writeValue(new File(DATA_TARGET_FOLDER + "users-out.json"), users);

		/* ******************** generating bookings list ******************** */
		List<Booking> bookings = buildBookings(products, users);
		removeCollidingBookings(bookings);

		/* ******************** generating evaluations and adding them to bookings ******************** */
		List<EvaluationForSql> evaluations = createEvaluations(bookings);

		/* *** creating msp-product-housing mysql import to load in db after starting msp-product-housing *** */
		createProductHousingSqlImport(evaluations);

		/* ******************** creating bookings json file ******************** */
		mapper.writeValue(new File(DATA_TARGET_FOLDER + "bookings-out.json"), bookings);
	}

	public static void removeDuplicatedUserNames(List<User> users) {
		List<String> uniqueUserNames = new ArrayList<>();
		List<User> usersToRemove = new ArrayList<>();
		for (User u : users) {
			boolean isAlreadyInUniqueList = uniqueUserNames.contains(u.getUsername());
			if (!isAlreadyInUniqueList) uniqueUserNames.add(u.getUsername());
			else usersToRemove.add(u);
		}
		System.out.println("-USERS-");
		System.out.println(usersToRemove.size() + " duplicate users removed out of " + users.size() + " generated.");
		for (User u : usersToRemove) {
			users.remove(u);
		}
		System.out.println(users.size() + " users remaining.\r\n");
	}

	public static void removeDuplicatedBookmarks(List<User> users) {
		System.out.println("-BOOKMARKS-");
		for (User u : users) {
			List<Long> idProducts = new ArrayList<>();
			List<Bookmark> bookmarkToRemove = new ArrayList<>();
			for (Bookmark b : u.getBookmarks()) {
				if (idProducts.contains(b.getIdProduct()) || b.getIdProduct() == 0 || b.getIdProduct() > 30) {
					bookmarkToRemove.add(b);
				} else {
					idProducts.add(b.getIdProduct());
				}
			}
			System.out.println(bookmarkToRemove.size() + " duplicated boomarks removed for " + u.getUsername());
			for (Bookmark b : bookmarkToRemove) {
				u.getBookmarks().remove(b);
			}
		}
		System.out.println(" ");
	}

	public static List<Booking> buildBookings(List<Product> products, List<User> users) {
		System.out.println("Building bookings...\r\n");
		List<Booking> bookings = new ArrayList<>();
		for (int i = 0; i < BOOKINGS_TO_GENERATE; i++) {

			/* ******************** Init new booking/product combo ******************** */
			Random rand = new Random();

			Product randomProduct = products.get(rand.nextInt(products.size()));

			Booking booking = new Booking();
			booking.setProduct(randomProduct);

			int index = (int) Math.floor(Math.random() * users.size());
			if(index < 1 ) index = 1;
			booking.setUserName(users.get(index).getUsername());

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
			booking.setBooking_date(generatedBookingDateTime.toString());

				// Check-in date is generated as a LocalDate with Booking date as a min and a 1 year later limit as a max
			LocalDate generatedCheckInDate = ValueGenerator.generateRandomLocalDate(generatedBookingDate, generatedBookingDate.plusYears(1));
			booking.setCheck_in_date(generatedCheckInDate.toString());

				// Check-out date is generated as a LocalDate with Check-in date + 1 day as a min and a 21 days later limit as a max
			LocalDate generatedCheckOutDate = generatedCheckInDate.plusDays(ValueGenerator.generateRandomWeightedDuration());
			booking.setCheck_out_date(generatedCheckOutDate.toString());

			/* ******************** setting guests number ******************** */
			Integer guestsNumber = ValueGenerator.generateRandomNumber(1, randomProduct.getMaxGuests());
			booking.setGuests_number(guestsNumber);

			/* ******************** setting total price ******************** */
			Long totalToPay = ValueGenerator.calculateTotalPrice(randomProduct.getDailyrate(), generatedCheckInDate, generatedCheckOutDate);
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
				if ((b.getCheck_in_date().compareTo(bRef.getCheck_in_date()) > 0 &&
						b.getCheck_in_date().compareTo(bRef.getCheck_out_date()) < 0)
						||
					(b.getCheck_out_date().compareTo(bRef.getCheck_in_date()) > 0 &&
							b.getCheck_out_date().compareTo(bRef.getCheck_out_date()) < 0))
				{
					isBetweenChechInAndCheckOut = true;
				} else if (b.getCheck_in_date().compareTo(bRef.getCheck_in_date()) < 0 &&
						b.getCheck_out_date().compareTo(bRef.getCheck_out_date()) > 0)
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
		System.out.println(bookingsToRemove.size() + " colliding bookings removed out of " + bookings.size() + " generated.");
		for (Booking b : bookingsToRemove) {
			bookings.remove(b);
		}
		System.out.println(bookings.size() + " bookings remaining.\r\n");
	}

	public static List<EvaluationForSql> createEvaluations(List<Booking> bookings) {
		List<String> commentaries = populateCommentaries();
		List<EvaluationForSql> evaluations = new ArrayList<>();
		for (int i = 0; i < bookings.size(); i++) {
			Booking booking = bookings.get(i);
			if (booking.getCheck_out_date().compareTo(LocalDate.now().toString()) < 0) {
				// This evaluation will go into the sql import (leave the commentary escape characters)
				Evaluation evaluationForSql = new Evaluation(
						booking.getCheck_out_date(),
						commentaries.get(i % commentaries.size()),
						ValueGenerator.generateRandomWeightedRating(),
						ValueGenerator.generateRandomWeightedRating(),
						ValueGenerator.generateRandomWeightedRating(),
						ValueGenerator.generateRandomWeightedRating()
				);
				evaluations.add(new EvaluationForSql((long) evaluations.size() + 1, evaluationForSql, booking.getProduct(), booking.getUserName()));
				// That evaluation will end up in the bookings-out.json (remove the commentary escape characters)
				Evaluation evaluationForJson = new Evaluation(
						booking.getCheck_out_date(),
						commentaries.get(i % commentaries.size()).replace("\\'", "'"),
						ValueGenerator.generateRandomWeightedRating(),
						ValueGenerator.generateRandomWeightedRating(),
						ValueGenerator.generateRandomWeightedRating(),
						ValueGenerator.generateRandomWeightedRating()
				);
				booking.setEvaluation(evaluationForJson);
			}
		}
		System.out.println("-EVALUATIONS-");
		System.out.println(evaluations.size() + " evaluations created.");
		return evaluations;
	}

	public static List<String> populateCommentaries() {
		List<String> commentaries = new ArrayList<>();
		commentaries.add("J\\'ai passé un super moment dans un cadre exceptionnel.");
		commentaries.add("J\\'ai adoré l\\'emplacement de l\\'appartement. Grâce à vous, j\\'ai vraiment découvert Paris.");
		commentaries.add("Une expérience absolument éblouissante. Un vrai goût du luxe assumé.");
		return commentaries;
	}

	public static void createProductHousingSqlImport(List<EvaluationForSql> evaluations) {
		try {
			File inputFilePart1 = new File(DATA_RESOURCES_FOLDER + "msp-product-housing-db-import-in-part-1.sql");
			File inputFilePart2 = new File(DATA_RESOURCES_FOLDER + "msp-product-housing-db-import-in-part-2.sql");
			File inputFilePart3 = new File(DATA_RESOURCES_FOLDER + "msp-product-housing-db-import-in-part-3.sql");
			List<File> inputFiles = new ArrayList<>();
			inputFiles.add(inputFilePart1);
			inputFiles.add(inputFilePart2);
			inputFiles.add(inputFilePart3);

			File outputFile = new File(DATA_TARGET_FOLDER + "msp-product-housing-db-import-out.sql");
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
								evaluation.getUserName() +
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
