package org.kardia.webapp.service;

import org.kardia.webapp.model.User;

public interface UserService {
    void saveUser(User user);

    User getUserByEmail(String email);

    void updateUser(User user);
}
