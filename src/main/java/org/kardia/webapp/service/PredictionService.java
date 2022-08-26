package org.kardia.webapp.service;

import org.kardia.webapp.view.PredictionInput;
import org.kardia.webapp.view.PredictionView;

import java.util.List;

public interface PredictionService {
    boolean predict(PredictionInput predictionInput);
    List<PredictionView> get();
}
