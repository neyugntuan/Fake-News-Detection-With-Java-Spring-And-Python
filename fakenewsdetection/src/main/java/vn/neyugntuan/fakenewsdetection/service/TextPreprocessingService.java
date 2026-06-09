package vn.neyugntuan.fakenewsdetection.service;

import org.springframework.stereotype.Service;

@Service
public class TextPreprocessingService {

    // Regex giống Python
    public String cleanText(String text) {
        if (text == null) {
            return "";
        }

        // 1. Chuẩn hóa các kiểu xuống dòng thành khoảng trắng
        text = text.replaceAll("\\r\\n|\\r|\\n", " ");

        // 2. Chuẩn hóa nhiều khoảng trắng thành 1
        text = text.replaceAll("\\s+", " ").trim();

        return text;
    }
}