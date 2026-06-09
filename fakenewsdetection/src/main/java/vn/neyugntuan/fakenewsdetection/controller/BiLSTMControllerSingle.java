package vn.neyugntuan.fakenewsdetection.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.neyugntuan.fakenewsdetection.domain.PredictResponse;
import vn.neyugntuan.fakenewsdetection.domain.PredictionEntity;
import vn.neyugntuan.fakenewsdetection.service.PredictServiceSingle;
import vn.neyugntuan.fakenewsdetection.service.TextPreprocessingService;

@Controller
public class BiLSTMControllerSingle {

    private final TextPreprocessingService textPreprocessingService;

    private final PredictServiceSingle predictService;

    public BiLSTMControllerSingle(TextPreprocessingService textPreprocessingService,
            PredictServiceSingle predictService) {
        this.textPreprocessingService = textPreprocessingService;
        this.predictService = predictService;
    }

    @GetMapping("/")
    public String testForm(Model model) {
        model.addAttribute("api_online", true);
        return "client/single";
    }

    @PostMapping("/predict")
    public String predict(@RequestParam("text") String text,
            Model model) {
        text = this.textPreprocessingService.cleanText(text);

        if (text.isEmpty()) {
            model.addAttribute("error", "Vui lòng nhập ít nhất 1 dòng hợp lệ!");
            model.addAttribute("raw", String.join("\n", text));
            return "client/single";
        }

        PredictResponse result = this.predictService.predict(text);
        if (result != null) {
            // nếu gọi API thành công thì gán text cho biến
            PredictionEntity SaveEntity = new PredictionEntity(null, text, result.getPrediction().getLabel(),
                    result.getPrediction().getLabelName(), result.getPrediction().getProbability(),
                    result.getPrediction().getConfidence());

            // save request
            this.predictService.handleSavePredict(SaveEntity);
        }

        // lấy dữ liệu
        int label = result.getPrediction().getLabel();
        double confidence = result.getPrediction().getConfidence();
        double fakeProb = result.getPrediction().getProbability();
        double ms = result.getInferenceTimeMs();

        // Đưa dữ liệu ra view
        model.addAttribute("text", text);
        model.addAttribute("label", label);
        model.addAttribute("confidence", (int) (confidence * 100));
        model.addAttribute("fakeProb", (int) (fakeProb * 100));
        model.addAttribute("isFake", label == 1);
        model.addAttribute("time", ms);

        return "client/single";
    }

    @GetMapping("/admin/dash-board")
    public String fetchALLPredict(Model model) {
        List<PredictionEntity> list = this.predictService.handleFetchAllPredict();
        model.addAttribute("list", list);
        return "admin/dash-board/management";
    }

    @GetMapping("/admin/dash-board/{id}")
    public String userDetail(@PathVariable("id") Long id, Model model,
            RedirectAttributes ra) {
        Optional<PredictionEntity> opt = predictService.getPredictById(id);
        if (opt.isEmpty()) {
            ra.addFlashAttribute("error", "Predict with id=" + id + " not found");
            return "redirect:/dash-board";
        }
        model.addAttribute("predict", opt.get());
        return "admin/dash-board/detail";
    }

    @GetMapping("/admin/dash-board/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        PredictionEntity predict = new PredictionEntity();
        predict.setId(id);
        model.addAttribute("newPredict", predict);
        return "admin/dash-board/delete";
    }

    @PostMapping("/admin/dash-board/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newPredict") PredictionEntity predict) {
        this.predictService.handleDeletePredict(predict.getId());
        return "redirect:/admin/dash-board";
    }

}
