package fr.afcepf.ad1al35.MspDataGenerator.dto;

import java.time.LocalDateTime;

public class Bookmark {

    private String addDate;
    private Long idProduct;

    public Bookmark() {
    }

    public Bookmark(String addDate, Long idProduct) {
        this.addDate = addDate;
        this.idProduct = idProduct;
    }

    public String getAddDate() {
        return addDate;
    }
    public void setAddDate(String addDate) {
        this.addDate = addDate;
    }
    public Long getIdProduct() {
        return idProduct;
    }
    public void setIdProduct(Long idProduct) {
        this.idProduct = idProduct;
    }
}
