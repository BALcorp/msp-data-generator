package fr.afcepf.ad1al35.MspDataGenerator.dto;

import java.util.List;

public class Product {

	private Long idProduct;
	private String title;
	private Integer size;
	private Integer maxGuests;
	private Boolean petsAuthorized;
	private Long dailyrate;
	private String address;
	private String addressComplement;
	private Integer zipCode;
	private List<Evaluation> evaluations;

	public Product() {
	}

	public Product(Long idProduct, String title, Integer size, Integer maxGuests, Boolean petsAuthorized, Long dailyrate, String address, String addressComplement, Integer zipCode, List<Evaluation> evaluations) {
		this.idProduct = idProduct;
		this.title = title;
		this.size = size;
		this.maxGuests = maxGuests;
		this.petsAuthorized = petsAuthorized;
		this.dailyrate = dailyrate;
		this.address = address;
		this.addressComplement = addressComplement;
		this.zipCode = zipCode;
		this.evaluations = evaluations;
	}

	public Long getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(Long idProduct) {
		this.idProduct = idProduct;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getMaxGuests() {
		return maxGuests;
	}

	public void setMaxGuests(Integer maxGuests) {
		this.maxGuests = maxGuests;
	}

	public Boolean getPetsAuthorized() {
		return petsAuthorized;
	}

	public void setPetsAuthorized(Boolean petsAuthorized) {
		this.petsAuthorized = petsAuthorized;
	}

	public Long getDailyrate() {
		return dailyrate;
	}

	public void setDailyrate(Long dailyrate) {
		this.dailyrate = dailyrate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressComplement() {
		return addressComplement;
	}

	public void setAddressComplement(String addressComplement) {
		this.addressComplement = addressComplement;
	}

	public Integer getZipCode() {
		return zipCode;
	}

	public void setZipCode(Integer zipCode) {
		this.zipCode = zipCode;
	}

	public List<Evaluation> getEvaluations() {
		return evaluations;
	}

	public void setEvaluations(List<Evaluation> evaluations) {
		this.evaluations = evaluations;
	}
}
