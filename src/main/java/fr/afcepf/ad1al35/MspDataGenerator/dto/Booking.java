package fr.afcepf.ad1al35.MspDataGenerator.dto;

public class Booking {

	private String booking_date;
	private String check_in_date;
	private String check_out_date;
	private Boolean pets;
	private Boolean canceled;
	private Product product;
	private Integer guests_number;
	private Long totalToPay;
	private String userName;

	public Booking() {
	}

	public Booking(String booking_date, String check_in_date, String check_out_date, Boolean pets, Boolean canceled, Product product, Integer guests_number, Long totalToPay, String userName) {
		this.booking_date = booking_date;
		this.check_in_date = check_in_date;
		this.check_out_date = check_out_date;
		this.pets = pets;
		this.canceled = canceled;
		this.product = product;
		this.guests_number = guests_number;
		this.totalToPay = totalToPay;
		this.userName = userName;
	}

	public String getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(String booking_date) {
		this.booking_date = booking_date;
	}

	public String getCheck_in_date() {
		return check_in_date;
	}

	public void setCheck_in_date(String check_in_date) {
		this.check_in_date = check_in_date;
	}

	public String getCheck_out_date() {
		return check_out_date;
	}

	public void setCheck_out_date(String check_out_date) {
		this.check_out_date = check_out_date;
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

	public Integer getGuests_number() {
		return guests_number;
	}

	public void setGuests_number(Integer guests_number) {
		this.guests_number = guests_number;
	}

	public Long getTotalToPay() {
		return totalToPay;
	}

	public void setTotalToPay(Long totalToPay) {
		this.totalToPay = totalToPay;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
