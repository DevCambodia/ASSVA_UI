package com.asva.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@RequestMapping(value="/login")
	public String login(HttpServletRequest req){
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {

		    /* The user is logged in :) */
		    return "user/dashboard";
		}
		
		return "login";
	}
	
	@RequestMapping(value="/signup")
	public String signUp(){
		return "signup";
	}
	
	@RequestMapping(value="/logout")
	public String signOut(){
		return "login";
	}
	
	@RequestMapping("/user/dashboard")
	public String dashboard(){
		return "user/dashboard";
	}
	
	@RequestMapping(value="/user/product")
	public String product(){
		return "user/product";
	}
	
	@RequestMapping(value="/history")
	public String history(){
		return "history";
	}
	
	@RequestMapping(value="/profile")
	public String profile(){
		return "profile";
	}
}
