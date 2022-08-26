package org.kardia.webapp.controller;

import lombok.RequiredArgsConstructor;
import org.kardia.webapp.helper.PredictionInputValidator;
import org.kardia.webapp.service.PredictionService;
import org.kardia.webapp.view.PredictionInput;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequiredArgsConstructor
@Controller
public class CheckKardiaController {

    private final PredictionInputValidator predictionInputValidator;
    private final PredictionService predictionService;

    @GetMapping(value = {"/check-kardia"})
    public String index(Model model) {
        model.addAttribute("predictionInput", new PredictionInput());
        return "check-kardia";
    }

    @RequestMapping("/success")
    public String success() {
        return "success";
    }

    @RequestMapping("/failed")
    public String failed() {
        return "failed";
    }
}
