package fr.afcepf.ad1al35.MspDataGenerator.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Evaluation {

    @JsonProperty("evaluation_date")
    private String evaluationDate;
    private String commentary;
    private Integer communication;
    private Integer location;
    @JsonProperty("value_for_money")
    private Integer valueForMoney;
    private Integer residence;

    public Evaluation() {
    }

    public Evaluation(String evaluationDate, String commentary, Integer communication, Integer location, Integer valueForMoney, Integer residence) {
        this.evaluationDate = evaluationDate;
        this.commentary = commentary;
        this.communication = communication;
        this.location = location;
        this.valueForMoney = valueForMoney;
        this.residence = residence;
    }

    public String getEvaluationDate() {
        return evaluationDate;
    }

    public void setEvaluationDate(String evaluationDate) {
        this.evaluationDate = evaluationDate;
    }

    public String getCommentary() {
        return commentary;
    }

    public void setCommentary(String commentary) {
        this.commentary = commentary;
    }

    public Integer getCommunication() {
        return communication;
    }

    public void setCommunication(Integer communication) {
        this.communication = communication;
    }

    public Integer getLocation() {
        return location;
    }

    public void setLocation(Integer location) {
        this.location = location;
    }

    public Integer getValueForMoney() {
        return valueForMoney;
    }

    public void setValueForMoney(Integer valueForMoney) {
        this.valueForMoney = valueForMoney;
    }

    public Integer getResidence() {
        return residence;
    }

    public void setResidence(Integer residence) {
        this.residence = residence;
    }
}
