package org.kardia.webapp.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "prediction")
public class Prediction {
    @Id
    @GeneratedValue(strategy  = GenerationType.IDENTITY)
    private Long id;
    private Date date;
    private int age;
    private double ejectionFraction;
    private double creatinine;
    private double predictedScore;
    private boolean hasRisk;

    @ManyToOne(
            fetch = FetchType.EAGER
    )
    @JoinColumn(
            name = "user",
            referencedColumnName = "user_id",
            nullable = false
    )
    private User user;
}
