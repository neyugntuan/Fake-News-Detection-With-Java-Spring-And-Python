package vn.neyugntuan.fakenewsdetection.domain;

public class PredictResponse {
    private boolean success = true;
    private PredictionResult prediction;
    private double inference_time_ms;

    public PredictResponse(boolean success, PredictionResult prediction, double inference_time_ms) {
        this.success = success;
        this.prediction = prediction;
        this.inference_time_ms = inference_time_ms;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public PredictionResult getPrediction() {
        return prediction;
    }

    public void setPrediction(PredictionResult prediction) {
        this.prediction = prediction;
    }

    public double getInferenceTimeMs() {
        return inference_time_ms;
    }

    public void setInferenceTimeMs(double inference_time_ms) {
        this.inference_time_ms = inference_time_ms;
    }

    @Override
    public String toString() {
        return "PredictResponse [success=" + success + ", prediction=" + prediction + ", inference_time_ms="
                + inference_time_ms + "]";
    }

}
