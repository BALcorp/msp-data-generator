package fr.afcepf.ad1al35.MspDataGenerator.dto;

public class Evaluation {

    private String commentary;
    private String evaluationDate;
    private Integer residence;
    private Integer location;
    private Integer valueForMoney;
    private Integer communication;
    private String userName;

    public Evaluation() {
    }

    public Evaluation(String commentary, String evaluationDate, Integer residence, Integer location, Integer valueForMoney, Integer communication, String userName) {
        this.commentary = commentary;
        this.evaluationDate = evaluationDate;
        this.residence = residence;
        this.location = location;
        this.valueForMoney = valueForMoney;
        this.communication = communication;
        this.userName = userName;
    }

    public String getCommentary() {
        return commentary;
    }

    public void setCommentary(String commentary) {
        this.commentary = commentary;
    }

    public String getEvaluationDate() {
        return evaluationDate;
    }

    public void setEvaluationDate(String evaluationDate) {
        this.evaluationDate = evaluationDate;
    }

    public Integer getResidence() {
        return residence;
    }

    public void setResidence(Integer residence) {
        this.residence = residence;
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

    public Integer getCommunication() {
        return communication;
    }

    public void setCommunication(Integer communication) {
        this.communication = communication;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
