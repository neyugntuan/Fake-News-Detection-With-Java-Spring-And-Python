package vn.neyugntuan.fakenewsdetection.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

public class PredictionResult {
    private String text;
    private int label;

    @JsonProperty("label_name")
    private String label_name;
    private double confidence;
    private double probability;

    public PredictionResult() {

    }

    public PredictionResult(String text, int label, String label_name, double confidence, double probability) {
        this.text = text;
        this.label = label;
        this.label_name = label_name;
        this.confidence = confidence;
        this.probability = probability;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getLabel() {
        return label;
    }

    public void setLabel(int label) {
        this.label = label;
    }

    public String getLabelName() {
        return label_name;
    }

    public void setLabelName(String label_name) {
        this.label_name = label_name;
    }

    public double getConfidence() {
        return confidence;
    }

    public void setConfidence(double confidence) {
        this.confidence = confidence;
    }

    public double getProbability() {
        return probability;
    }

    public void setProbability(double probability) {
        this.probability = probability;
    }

}
