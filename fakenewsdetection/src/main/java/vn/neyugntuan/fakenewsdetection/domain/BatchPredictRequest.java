package vn.neyugntuan.fakenewsdetection.domain;

import java.util.List;
import java.util.stream.Collectors;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public class BatchPredictRequest {
    @NotEmpty(message = "Danh sách texts không được rỗng")
    @Size(max = 64)
    private List<String> texts;

    public List<String> getTexts() {
        return texts.stream()
                .map(String::trim)
                .filter(t -> !t.isEmpty())
                .collect(Collectors.toList());
    }

    public void setTexts(List<String> texts) {
        this.texts = texts;
    }
}
