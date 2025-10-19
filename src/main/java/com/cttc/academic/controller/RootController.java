package com.cttc.academic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RootController {

    // This method catches the application's root (e.g., http://localhost:8095/)
    // and immediately redirects the browser to the /menu/home path.
    @GetMapping("/")
    public String redirectToHome() {
        return "redirect:/menu/home";
    }
}