package org.kardia.webapp.controller;

import lombok.RequiredArgsConstructor;
import org.kardia.webapp.service.PredictionService;
import org.kardia.webapp.view.PredictionInput;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class CheckKardiaAPIController {
    private final PredictionService predictionService;
    @GetMapping("/check-kardia")
    public ResponseEntity<Boolean> getPrediction(@RequestParam("Age") int Age, @RequestParam("EF") int EF,
                                                 @RequestParam("Creatinine") double Creatinine) {
        boolean isSuccess = predictionService.predict(new PredictionInput(Age, EF, Creatinine));
        return ResponseEntity.ok().contentType(MediaType.valueOf(MediaType.APPLICATION_JSON_VALUE))
                .body(isSuccess);
    }
}
