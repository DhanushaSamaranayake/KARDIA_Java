package org.kardia.webapp.repo;

import org.kardia.webapp.model.Prediction;
import org.kardia.webapp.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PredictionRepository extends JpaRepository<Prediction, Long> {
    List<Prediction> findAllByUser(User user);
}
