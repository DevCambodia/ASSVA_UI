package com.asva.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(){
		
		return "admin/index";
	}
	
		
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String user(){
		
		return "admin/user";
	}
	
	@RequestMapping(value = "/ads", method = RequestMethod.GET)
	public String ads(){
		
		return "admin/ads";
	}
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(){
		
		return "admin/product";
	}
	
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String category(){
		
		return "admin/category";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {

		    /* The user is logged in :) */
		    return "admin/index";
		}
		
		return "login";
	}
		
}
