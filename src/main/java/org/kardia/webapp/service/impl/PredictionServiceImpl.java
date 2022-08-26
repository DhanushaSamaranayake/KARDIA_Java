package org.kardia.webapp.service.impl;

import lombok.RequiredArgsConstructor;
import org.kardia.webapp.model.Prediction;
import org.kardia.webapp.model.User;
import org.kardia.webapp.repo.PredictionRepository;
import org.kardia.webapp.service.*;
import org.kardia.webapp.view.EmailBody;
import org.kardia.webapp.view.PredictionInput;
import org.kardia.webapp.view.PredictionView;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
@RequiredArgsConstructor
public class PredictionServiceImpl implements PredictionService {
    private final String pattern = "MM/dd/yyyy HH:mm:ss";
    private final DateFormat df = new SimpleDateFormat(pattern);
    private final UserService userService;
    private final SecurityService securityService;
    private final PredictionRepository predictionRepository;
    private final EmailService emailService;
    private final SMSService smsService;

    @Override
    public boolean predict(PredictionInput predictionInput) {
        try {
            // create headers
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            Map<String, Object> map = new HashMap<>();
            map.put("Age", predictionInput.getAge());
            map.put("EF", predictionInput.getEF());
            map.put("Creatinine", predictionInput.getCreatinine());

            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(map, headers);

            RestTemplate restTemplate = new RestTemplate();
            String predictionAPI = "https://kardia-predict-model.herokuapp.com/predict";
            ResponseEntity<Double> result = restTemplate.postForEntity(predictionAPI, entity, Double.class);

            Prediction prediction = new Prediction();
            prediction.setAge(predictionInput.getAge());
            prediction.setDate(new Date());
            prediction.setPredictedScore(result.getBody());
            prediction.setCreatinine(predictionInput.getCreatinine());
            prediction.setEjectionFraction(predictionInput.getEF());
            prediction.setHasRisk(result.getBody() >= 0.5);
            User user = userService.getUserByEmail(securityService.findLoggedInUsername());
            prediction.setUser(user);
            predictionRepository.save(prediction);

            smsService.send(user.getContactNumber(), String.format("Hi, %s, we have received your payment." +
                    "\n Thank you for using our service\n" +
                    "- Team KARDIA - \n", user.getFirstName()));

            emailService.send(new EmailBody(user.getEmail(), "KARDIA Prediction Service", ""),
                    user.getLastName(), predictionInput, result.getBody());

            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public List<PredictionView> get() {
        User user = userService.getUserByEmail(securityService.findLoggedInUsername());
        List<Prediction> predictions = predictionRepository.findAllByUser(user);
        List<PredictionView> predictionViews = new ArrayList<>();
        for (Prediction prediction: predictions) {
            predictionViews.add(new PredictionView(df.format(prediction.getDate()),
                    prediction.getAge(),
                    prediction.getEjectionFraction(),
                    prediction.getCreatinine(),
                    prediction.getPredictedScore(),
                    prediction.isHasRisk() ? "Yes" : "No"));
        }
        return predictionViews;
    }
}
