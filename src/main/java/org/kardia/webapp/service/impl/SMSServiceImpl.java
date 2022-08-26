package org.kardia.webapp.service.impl;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import org.kardia.webapp.service.SMSService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class SMSServiceImpl implements SMSService {

    @Value("${ACCOUNT_SID}")
    private String ACCOUNT_SID;
    @Value("${AUTH_TOKEN}")
    private String AUTH_TOKEN;
    @Value("${ACCOUNT_NUMBER}")
    private String ACCOUNT_NUMBER;
    private final String countryCode = "+94";

    @Override
    public void send(String contactNumber, String message) {
//        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
//        Message msg = Message.creator(new PhoneNumber(countryCode + contactNumber),
//                ACCOUNT_NUMBER , message).create();
//        System.out.println("INFO: message send id - " + msg.getSid());
    }
}
