package org.kardia.webapp.helper;

import lombok.RequiredArgsConstructor;
import org.kardia.webapp.view.PredictionInput;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
@RequiredArgsConstructor
public class PredictionInputValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return false;
    }
    @Override
    public void validate(Object obj, Errors errors) {
        PredictionInput input = (PredictionInput) obj;

        if (input.getAge() == 0)
            errors.rejectValue("Age", "CannotZero");

        if (input.getEF() == 0)
            errors.rejectValue("EF", "CannotZero");

        if (input.getCreatinine() == 0.0)
            errors.rejectValue("Creatinine", "CannotZero");
    }
}
