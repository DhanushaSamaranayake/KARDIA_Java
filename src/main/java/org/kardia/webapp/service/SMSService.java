package org.kardia.webapp.service;

public interface SMSService {
    void send(String contactNumber, String message);
}
