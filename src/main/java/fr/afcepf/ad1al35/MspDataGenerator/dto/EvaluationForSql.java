package fr.afcepf.ad1al35.MspDataGenerator.dto;

public class EvaluationForSql {

    private Long idEvaluation;
    private Evaluation evaluation;
    private Product product;
    private String userName;

    public EvaluationForSql(Long idEvaluation, Evaluation evaluation, Product product, String userName) {
        this.idEvaluation = idEvaluation;
        this.evaluation = evaluation;
        this.product = product;
        this.userName = userName;
    }

    public Long getIdEvaluation() {
        return idEvaluation;
    }

    public void setIdEvaluation(Long idEvaluation) {
        this.idEvaluation = idEvaluation;
    }

    public Evaluation getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(Evaluation evaluation) {
        this.evaluation = evaluation;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
