package fr.afcepf.ad1al35.MspDataGenerator.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class Product {

	@JsonProperty("id_product")
	private Long idProduct;
	private String title;
	private Integer size;
	@JsonProperty("max_guests")
	private Integer maxGuests;
	@JsonProperty("pets_authorized")
	private Boolean petsAuthorized;
	@JsonProperty("daily_rate")
	private Long dailyRate;
	private String address;
	@JsonProperty("address_complement")
	private String addressComplement;
	@JsonProperty("zip_code")
	private Integer zipCode;

	public Product() {
	}

	public Product(Long idProduct, String title, Integer size, Integer maxGuests, Boolean petsAuthorized, Long dailyRate, String address, String addressComplement, Integer zipCode) {
		this.idProduct = idProduct;
		this.title = title;
		this.size = size;
		this.maxGuests = maxGuests;
		this.petsAuthorized = petsAuthorized;
		this.dailyRate = dailyRate;
		this.address = address;
		this.addressComplement = addressComplement;
		this.zipCode = zipCode;
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

	public Long getDailyRate() {
		return dailyRate;
	}

	public void setDailyRate(Long dailyRate) {
		this.dailyRate = dailyRate;
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
}
