package vn.neyugntuan.fakenewsdetection.domain;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class BatchPredictResponse {
    private boolean success = true;
    private List<PredictionResult> predictions;
    private int total;

    @JsonProperty("inference_time_ms")
    private double inference_time_ms;

    public BatchPredictResponse() {

    }

    public BatchPredictResponse(boolean success, List<PredictionResult> predictions, int total,
            double inference_time_ms) {
        this.success = success;
        this.predictions = predictions;
        this.total = total;
        this.inference_time_ms = inference_time_ms;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public List<PredictionResult> getPredictions() {
        return predictions;
    }

    public void setPredictions(List<PredictionResult> predictions) {
        this.predictions = predictions;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public double getInferenceTimeMs() {
        return inference_time_ms;
    }

    public void setInferenceTimeMs(double inference_time_ms) {
        this.inference_time_ms = inference_time_ms;
    }

}
