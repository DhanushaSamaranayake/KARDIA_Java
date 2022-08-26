package org.kardia.webapp.controller;

import org.kardia.webapp.model.User;
import org.kardia.webapp.service.UserService;
import org.kardia.webapp.helper.UserValidator;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class AuthController {
    private final UserService userService;
    private final UserValidator userValidator;

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("regForm", new User());
        return "register";
    }

    // registration of user
    @PostMapping("/register")
    public String processingRegistrationForm(@ModelAttribute("regForm") User regForm, BindingResult
            bindingResult, Model model) {
        userValidator.validate(regForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "register";
        }
        userService.saveUser(regForm);
        model.addAttribute("regForm", new User());
        model.addAttribute("message", "You account has been registered successfully!");
        return "register";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Your username and password is invalid.");
        }

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }
}
