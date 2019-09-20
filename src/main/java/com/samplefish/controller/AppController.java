package com.samplefish.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AppController {
	
	@GetMapping("/")
	public String showHome() {
		return "home";
	}
	
	//add request mapping for /leaders
	@GetMapping("/users")
	public String showUsers() {
		return "users";
	}
	
	//add request mapping for /carries
	@GetMapping("/admin")
	public String showAdmins() {
		return "admin";
	}
	
	//TODO: my profile
	
	
}
