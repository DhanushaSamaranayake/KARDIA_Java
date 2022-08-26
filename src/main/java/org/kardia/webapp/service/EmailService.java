package org.kardia.webapp.service;

import org.kardia.webapp.view.EmailBody;
import org.kardia.webapp.view.PredictionInput;

public interface EmailService {
    void send(EmailBody emailBody, String username, PredictionInput predictionInput, double score);
}
