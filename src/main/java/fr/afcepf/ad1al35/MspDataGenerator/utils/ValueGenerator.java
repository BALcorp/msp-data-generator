package fr.afcepf.ad1al35.MspDataGenerator.utils;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

public class ValueGenerator {

	public static final int MILLISECONDS_IN_A_DAY = 1000 * 60 * 60 * 24;

	public static Date generateRandomDate(Date dateMin, Date dateMax) {
		long randomPeriod = ThreadLocalRandom
				.current()
				.nextLong(dateMin.getTime(), dateMax.getTime());
		return new Date(randomPeriod);
	}

	public static LocalDate generateRandomLocalDate(LocalDate dateMin, LocalDate dateMax) {
		long randomPeriod = ThreadLocalRandom
				.current()
				.nextLong(dateMin.toEpochDay(), dateMax.toEpochDay());
		return LocalDate.ofEpochDay(randomPeriod);
	}

	public static Integer generateRandomWeightedDuration() {
		Random rand = new Random();
		List<Integer> possibleDuration = Arrays.asList(
				1,
				2, 2,
				3, 3, 3,
				4, 4, 4, 4, 4,
				5, 5, 5, 5, 5, 5, 5, 5,
				6, 6, 6, 6, 6, 6, 6, 6, 6 ,6, 6,
				7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
				8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
				9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9,
				10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
				11, 11, 11, 11, 11, 11, 11, 11, 11,
				12, 12, 12, 12, 12, 12, 12, 12,
				13, 13, 13, 13, 13, 13, 13,
				14, 14, 14, 14, 14, 14, 14,
				15, 15, 15, 15,
				16, 16,
				17,
				18,
				19,
				20,
				21);

		return possibleDuration.get(rand.nextInt(possibleDuration.size()));
	}

	public static Integer generateRandomWeightedRating() {
		Random rand = new Random();
		List<Integer> possibleRatings = Arrays.asList(
				1,
				2, 2,
				3, 3, 3,
				4, 4, 4, 4, 4, 4,
				5, 5, 5, 5, 5, 5
		);
		return possibleRatings.get(rand.nextInt(possibleRatings.size()));
	}
	
	public static Integer generateRandomNumber(int min, int max) {
		return (int) (Math.random() * (max - min) + min);
	}

	public static Long calculateTotalPrice(Long dailyPrice, LocalDate start, LocalDate end) {
//		long duration = ((end.getTime() - start.getTime()) / MILLISECONDS_IN_A_DAY) + 1;
		long duration = end.toEpochDay() - start.toEpochDay();
		return duration * dailyPrice;
	}
}
