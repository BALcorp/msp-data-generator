package fr.afcepf.ad1al35.MspDataGenerator;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;
import fr.afcepf.ad1al35.MspDataGenerator.dto.Booking;
import fr.afcepf.ad1al35.MspDataGenerator.dto.Bookmark;
import fr.afcepf.ad1al35.MspDataGenerator.dto.Product;
import fr.afcepf.ad1al35.MspDataGenerator.dto.User;
import fr.afcepf.ad1al35.MspDataGenerator.utils.ValueGenerator;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class MainApp {

	private static final LocalDate APP_EARLIEST_DATE = LocalDate.now().plusYears(-3);
	private static final int BOOKINGS_TO_GENERATE = 6000;

	public static void main(String[] args) throws IOException {

		ObjectMapper mapper = new ObjectMapper();

		CollectionType javaType = mapper.getTypeFactory().constructCollectionType(List.class, Product.class);
		List<Product> products = mapper.readValue(new File("src/main/resources/products-in.json"), javaType);

		/* ******************** importing users to include username in booking ******************** */
		javaType = mapper.getTypeFactory().constructCollectionType(List.class, User.class);
		List<User> users = mapper.readValue(new File("src/main/resources/users-in.json"), javaType);
		removeDuplicatedUserNames(users);
		removeDuplicatedBookmarks(users);
		mapper.writeValue(new File("src/main/resources/users-out.json"), users);

		/* ******************** generating bookings list ******************** */
		List<Booking> bookings = buildBookings(products, users);
		removeCollidingBookings(bookings);

		/* ******************** creating json file ******************** */
		mapper.writeValue(new File("src/main/resources/bookings-out.json"), bookings);
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
		List<Booking> bookings = new ArrayList<>();

		System.out.println("Building bookings...\r\n");
		for (int i = 0; i < BOOKINGS_TO_GENERATE; i++) {

			/* ******************** Init new booking/product combo ******************** */

			Random rand = new Random();

			Product randomProduct = products.get(rand.nextInt(products.size()));

			Booking booking = new Booking();
			booking.setProduct(randomProduct);
//			booking.setProduct(products.get(0)); // For testing purposes

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
//			booking.setCheck_in_date(LocalDate.of(2020, 1, 10 + i * 4).toString()); // For testing purposes


				// Check-out date is generated as a LocalDate with Check-in date + 1 day as a min and a 21 days later limit as a max

			LocalDate generatedCheckOutDate = generatedCheckInDate.plusDays(ValueGenerator.generateRandomWeightedDuration());
			booking.setCheck_out_date(generatedCheckOutDate.toString());
//			booking.setCheck_out_date(LocalDate.of(2020, 1, 15 + i * 4).toString()); // For testing purposes

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
		System.out.println(bookings.size() + " bookings remaining.");
	}
}
