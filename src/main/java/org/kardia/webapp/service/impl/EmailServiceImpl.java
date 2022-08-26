package org.kardia.webapp.service.impl;

import lombok.RequiredArgsConstructor;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.kardia.webapp.service.EmailService;
import org.kardia.webapp.view.EmailBody;
import org.kardia.webapp.view.PredictionInput;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import javax.mail.internet.InternetAddress;
import java.io.StringWriter;

@Service
@RequiredArgsConstructor
public class EmailServiceImpl implements EmailService {

    @Value("${host-email}")
    private String senderEmail;
    private final JavaMailSender javaMailSender;
    private final VelocityEngine velocityEngine;

    @Override
    public void send(EmailBody emailBody, String username, PredictionInput predictionInput, double score) {
        MimeMessagePreparator preparator = mimeMessage -> {
            MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
            message.setTo(emailBody.getTo());
            message.setFrom(new InternetAddress(senderEmail));

            VelocityContext velocityContext = new VelocityContext();
            velocityContext.put("age", predictionInput.getAge());
            velocityContext.put("ef", predictionInput.getEF());
            velocityContext.put("creatinine", predictionInput.getCreatinine());
            velocityContext.put("score", score);
            velocityContext.put("username", username);

            StringWriter stringWriter = new StringWriter();

            velocityEngine.mergeTemplate("velocity/email-template.vm", "UTF-8",
                    velocityContext, stringWriter);

            message.setSubject(emailBody.getSubject());
            message.setText(stringWriter.toString(), true);
        };

        try {
            javaMailSender.send(preparator);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
