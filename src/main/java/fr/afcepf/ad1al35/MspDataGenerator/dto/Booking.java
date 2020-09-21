package fr.afcepf.ad1al35.MspDataGenerator.dto;


import com.fasterxml.jackson.annotation.JsonProperty;

public class Booking {

	@JsonProperty("booking_date")
	private String bookingDate;
	@JsonProperty("check_in_date")
	private String checkInDate;
	@JsonProperty("check_out_date")
	private String checkOutDate;
	@JsonProperty("total_to_pay")
	private Long totalToPay;
	@JsonProperty("guests_number")
	private Integer guestsNumber;
	private Boolean pets;
	private Boolean canceled;
	private Product product;
	private String username;
	private  Evaluation evaluation;

	public Booking() {
	}

	public Booking(String bookingDate, String checkInDate, String checkOutDate, Long totalToPay, Integer guestsNumber, Boolean pets, Boolean canceled, Product product, String username, Evaluation evaluation) {
		this.bookingDate = bookingDate;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.totalToPay = totalToPay;
		this.guestsNumber = guestsNumber;
		this.pets = pets;
		this.canceled = canceled;
		this.product = product;
		this.username = username;
		this.evaluation = evaluation;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	public String getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(String checkInDate) {
		this.checkInDate = checkInDate;
	}

	public String getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(String checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public Long getTotalToPay() {
		return totalToPay;
	}

	public void setTotalToPay(Long totalToPay) {
		this.totalToPay = totalToPay;
	}

	public Integer getGuestsNumber() {
		return guestsNumber;
	}

	public void setGuestsNumber(Integer guestsNumber) {
		this.guestsNumber = guestsNumber;
	}

	public Boolean getPets() {
		return pets;
	}

	public void setPets(Boolean pets) {
		this.pets = pets;
	}

	public Boolean getCanceled() {
		return canceled;
	}

	public void setCanceled(Boolean canceled) {
		this.canceled = canceled;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Evaluation getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(Evaluation evaluation) {
		this.evaluation = evaluation;
	}
}
