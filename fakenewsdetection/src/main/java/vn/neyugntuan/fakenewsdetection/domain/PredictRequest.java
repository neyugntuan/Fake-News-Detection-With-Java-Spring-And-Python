package vn.neyugntuan.fakenewsdetection.domain;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class PredictRequest {
    @NotBlank(message = "Text không được rỗng")
    @Size(max = 50000, message = "Text quá dài")
    private String text;

    public String getText() {
        return text.trim();
    }

    public void setText(String text) {
        this.text = text;
    }
}
