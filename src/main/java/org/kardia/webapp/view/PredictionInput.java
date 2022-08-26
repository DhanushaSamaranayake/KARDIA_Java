package org.kardia.webapp.view;

public class PredictionInput {
    private int Age;
    private int EF;
    private double Creatinine;

    public PredictionInput() {
    }

    public PredictionInput(int age, int EF, double creatinine) {
        Age = age;
        this.EF = EF;
        Creatinine = creatinine;
    }

    public int getAge() {
        return Age;
    }

    public void setAge(int age) {
        Age = age;
    }

    public int getEF() {
        return EF;
    }

    public void setEF(int EF) {
        this.EF = EF;
    }

    public double getCreatinine() {
        return Creatinine;
    }

    public void setCreatinine(double creatinine) {
        Creatinine = creatinine;
    }
}
