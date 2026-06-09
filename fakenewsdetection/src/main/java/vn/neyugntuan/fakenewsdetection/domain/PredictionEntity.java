package vn.neyugntuan.fakenewsdetection.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "predictions")
public class PredictionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Nội dung text gốc
    @Column(columnDefinition = "TEXT", nullable = false)
    private String text;

    // 0 = Real, 1 = Fake
    @Column(nullable = false)
    private Integer label;

    @Column(length = 10)
    @JsonProperty("label_name")
    private String label_name;

    // xác suất Fake
    @Column(nullable = false)
    private Double probability;

    // độ tin cậy
    @Column(nullable = false)
    private Double confidence;

    // thời gian inference (ms)
    // private Double inference_time_ms;

    // CONTRUCTOR

    public PredictionEntity() {

    }

    public PredictionEntity(Long id, String text, Integer label, String label_name, Double probability,
            Double confidence) {
        this.id = id;
        this.text = text;
        this.label = label;
        this.label_name = label_name;
        this.probability = probability;
        this.confidence = confidence;
        // this.inference_time_ms = inference_time_ms;
    }

    // ========================
    // GETTER SETTER
    // ========================

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getLabel() {
        return label;
    }

    public void setLabel(Integer label) {
        this.label = label;
    }

    public String getLabelName() {
        return label_name;
    }

    public void setLabelName(String label_name) {
        this.label_name = label_name;
    }

    public Double getProbability() {
        return probability;
    }

    public void setProbability(Double probability) {
        this.probability = probability;
    }

    public Double getConfidence() {
        return confidence;
    }

    public void setConfidence(Double confidence) {
        this.confidence = confidence;
    }

    // public Double getInferenceTimeMs() {
    // return inference_time_ms;
    // }

    // public void setInferenceTimeMs(Double inference_time_ms) {
    // this.inference_time_ms = inference_time_ms;
    // }

}
