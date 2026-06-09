package vn.neyugntuan.fakenewsdetection.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import vn.neyugntuan.fakenewsdetection.domain.PredictResponse;
import vn.neyugntuan.fakenewsdetection.domain.PredictionEntity;
import vn.neyugntuan.fakenewsdetection.repository.PredictRepository;

@Service
public class PredictServiceSingle {

    private final String FASTAPI_URL = "http://127.0.0.1:8000/predict";

    private final RestTemplate restTemplate;

    private final PredictRepository predictRepository;

    public PredictServiceSingle(PredictRepository predictRepository) {
        this.restTemplate = new RestTemplate();
        this.predictRepository = predictRepository;
    }

    public PredictResponse predict(String text) {

        // Dùng map nếu có xuống dòng Jackson sẽ tự tạo JSON hợp lệ:
        Map<String, String> body = new HashMap<>();
        body.put("text", text);
        // String body = "{ \"text\": \"" + text + "\" }";

        // Headers
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // Request entity
        HttpEntity<Map<String, String>> entity = new HttpEntity<>(body, headers);

        // Gọi FastAPI
        ResponseEntity<PredictResponse> response = restTemplate.postForEntity(
                FASTAPI_URL,
                entity,
                PredictResponse.class);

        return response.getBody();
    }

    public void handleSavePredict(PredictionEntity predictRequest) {
        this.predictRepository.save(predictRequest);
    }

    public List<PredictionEntity> handleFetchAllPredict() {
        return this.predictRepository.findAll();
    }

    public Optional<PredictionEntity> getPredictById(long id) {
        return this.predictRepository.findById(id);
    }

    public void handleDeletePredict(long id) {
        this.predictRepository.deleteById(id);
    }

}
