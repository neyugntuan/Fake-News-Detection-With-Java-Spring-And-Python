package vn.neyugntuan.fakenewsdetection.service;

import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import vn.neyugntuan.fakenewsdetection.domain.BatchPredictRequest;
import vn.neyugntuan.fakenewsdetection.domain.BatchPredictResponse;

@Service
public class PredictServiceBatch {

    private final String FASTAPI_URL = "http://127.0.0.1:8000/predict/batch";

    private final RestTemplate restTemplate;

    public PredictServiceBatch() {
        this.restTemplate = new RestTemplate();
    }

    public BatchPredictResponse predict(List<String> texts) {

        BatchPredictRequest request = new BatchPredictRequest();
        request.setTexts(texts);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<BatchPredictRequest> entity = new HttpEntity<>(request, headers);

        ResponseEntity<BatchPredictResponse> response = restTemplate.exchange(
                FASTAPI_URL,
                HttpMethod.POST,
                entity,
                BatchPredictResponse.class);

        return response.getBody();
    }

}
