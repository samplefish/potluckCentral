package com.samplefish.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class AppController {
	
	@GetMapping
	public ModelAndView showHome() {
		return new ModelAndView("home");
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
	
	
	
	
}
