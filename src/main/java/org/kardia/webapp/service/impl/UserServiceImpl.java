package org.kardia.webapp.service.impl;

import org.kardia.webapp.model.Role;
import org.kardia.webapp.model.User;
import org.kardia.webapp.repo.RoleRepository;
import org.kardia.webapp.repo.UserRepository;
import org.kardia.webapp.service.UserService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    // adding new normal user
    @Override
    public void saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        HashSet<Role> roles = new HashSet<>();
        Optional<Role> roleOptional = roleRepository.findByName("USER");
        roleOptional.ifPresent(roles::add);
        user.setRoles(roles);
        userRepository.save(user);
    }

    @Override
    public User getUserByEmail(String email) {
        return userRepository.findUserByEmail(email).orElse(new User());
    }

    @Override
    public void updateUser(User user) {
        User existsUser = userRepository.findUserByEmail(user.getEmail()).orElse(null);
        if (existsUser != null) {
            existsUser.setFirstName(user.getFirstName());
            existsUser.setLastName(user.getLastName());
            existsUser.setEmail(user.getEmail());
            existsUser.setAddress(user.getAddress());
            existsUser.setContactNumber(user.getContactNumber());

            HashSet<Role> roles = new HashSet<>();
            Optional<Role> roleOptional = roleRepository.findByName("USER");
            roleOptional.ifPresent(roles::add);
            existsUser.setRoles(roles);

            userRepository.save(existsUser);
        }
    }
}
