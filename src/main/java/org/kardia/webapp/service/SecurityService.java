package org.kardia.webapp.service;

public interface SecurityService {
    String findLoggedInUsername();
    void autoLogin(String email, String password);
}
