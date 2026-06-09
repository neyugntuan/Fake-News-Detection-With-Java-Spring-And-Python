package vn.neyugntuan.fakenewsdetection.controller;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.neyugntuan.fakenewsdetection.domain.BatchPredictResponse;
import vn.neyugntuan.fakenewsdetection.domain.PredictionEntity;
import vn.neyugntuan.fakenewsdetection.domain.PredictionResult;
import vn.neyugntuan.fakenewsdetection.service.PredictServiceBatch;
import vn.neyugntuan.fakenewsdetection.service.PredictServiceSingle;
import vn.neyugntuan.fakenewsdetection.service.TextPreprocessingService;

@Controller
public class BiLSTMControllerBatch {

    private final PredictServiceBatch predictServiceBatch;

    private final PredictServiceSingle predictServiceSingle;

    public BiLSTMControllerBatch(TextPreprocessingService textPreprocessingService,
            PredictServiceBatch predictServiceBatch, PredictServiceSingle predictServiceSingle) {
        this.predictServiceBatch = predictServiceBatch;
        this.predictServiceSingle = predictServiceSingle;
    }

    @GetMapping("/predict-batch")
    public String Home2(Model model) {
        model.addAttribute("api_online", true);
        return "client/batch";
    }

    @PostMapping("/predict-batch")
    public String predictBatch(@RequestParam("texts") String raw,
            Model model) {
        // tách nhiều dòng
        List<String> texts = Arrays.stream(raw.split("\\r?\\n"))
                .map(String::trim)
                .filter(t -> !t.isEmpty())
                .limit(64)
                .collect(Collectors.toList());

        if (texts.isEmpty()) {
            model.addAttribute("error", "Vui lòng nhập ít nhất 1 dòng hợp lệ!");
            model.addAttribute("raw", String.join("\n", texts));
            return "client/batch";
        }

        BatchPredictResponse res = predictServiceBatch.predict(texts);

        for (PredictionResult p : res.getPredictions()) {
            PredictionEntity e = new PredictionEntity();
            e.setText(p.getText());
            e.setLabel(p.getLabel());
            e.setLabelName(p.getLabelName());
            e.setProbability(p.getProbability());
            e.setConfidence(p.getConfidence());
            this.predictServiceSingle.handleSavePredict(e);
        }

        // đẩy data ra view
        model.addAttribute("results", res.getPredictions());
        model.addAttribute("raw", raw); // giữ lại input
        model.addAttribute("time", res.getInferenceTimeMs());

        return "client/batch";
    }

    @GetMapping("/test-batch")
    public BatchPredictResponse testBatch() {

        return predictServiceBatch.predict(
                Arrays.asList(
                        "Công ty A phá sản",
                        "Chính phủ công bố chính sách mới"));

    }
}
