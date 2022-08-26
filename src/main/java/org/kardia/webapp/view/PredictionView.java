package org.kardia.webapp.view;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PredictionView {
    private String date;
    private int age;
    private double ejectionFraction;
    private double creatinine;
    private double predictedScore;
    private String hasRisk;

    public PredictionView(String date, int age, double ejectionFraction, double creatinine, double predictedScore,
                          String hasRisk) {
        this.date = date;
        this.age = age;
        this.ejectionFraction = ejectionFraction;
        this.creatinine = creatinine;
        this.predictedScore = predictedScore;
        this.hasRisk = hasRisk;
    }
}
