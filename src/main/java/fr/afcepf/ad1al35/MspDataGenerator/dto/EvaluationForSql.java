package fr.afcepf.ad1al35.MspDataGenerator.dto;

public class EvaluationForSql {

    private Long idEvaluation;
    private Evaluation evaluation;
    private Product product;
    private String username;

    public EvaluationForSql(Long idEvaluation, Evaluation evaluation, Product product, String username) {
        this.idEvaluation = idEvaluation;
        this.evaluation = evaluation;
        this.product = product;
        this.username = username;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
