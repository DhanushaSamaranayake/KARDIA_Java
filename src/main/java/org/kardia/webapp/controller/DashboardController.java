package org.kardia.webapp.controller;

import org.kardia.webapp.model.User;
import org.kardia.webapp.service.FileStorageService;
import org.kardia.webapp.service.PredictionService;
import org.kardia.webapp.service.SecurityService;
import org.kardia.webapp.service.UserService;
import org.kardia.webapp.helper.UserProfileUpdateValidator;
import lombok.RequiredArgsConstructor;
import org.kardia.webapp.view.PredictionView;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class DashboardController {
    private final SecurityService securityService;
    private final UserService userService;
    private final UserProfileUpdateValidator userProfileUpdateValidator;
    private final FileStorageService fileStorageService;
    private final PredictionService predictionService;

    @GetMapping(value = {"/", "/home"})
    public String homePage() {
        return "home";
    }

    @GetMapping("/dashboard")
    public String predictPage(Model model) {
        List<PredictionView> list = predictionService.get();
        model.addAttribute("predictions", list);
        return "dashboard";
    }

    @GetMapping("/user-profile")
    public String userProfilePage(Model model) {
        User user = userService.getUserByEmail(securityService.findLoggedInUsername());
        model.addAttribute("userProfile", user);
        return "user-profile";
    }

    @PostMapping("/user-profile")
    public String userProfile(@ModelAttribute("userProfile") User userProfile, BindingResult bindingResult,
                              Model model) {
        userProfileUpdateValidator.validate(userProfile, bindingResult);
        if (bindingResult.hasErrors()) {
            return "user-profile";
        }
        userService.updateUser(userProfile);
        model.addAttribute("message", "Your profile has been updated successfully!");
        User user = userService.getUserByEmail(securityService.findLoggedInUsername());
        model.addAttribute("userProfile", user);
        return "user-profile";
    }

    @PostMapping("/change-profile-picture")
    public String changeProfilePicture(@RequestParam("file") MultipartFile file, Model model) {
        fileStorageService.storeProfile(file, securityService.findLoggedInUsername());
        User user = userService.getUserByEmail(securityService.findLoggedInUsername());
        model.addAttribute("userProfile", user);
        model.addAttribute("message", "Your profile has been updated successfully!");
        return "user-profile";
    }
}
