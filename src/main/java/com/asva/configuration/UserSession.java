package com.asva.configuration;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.asva.entity.User;



public class UserSession {
	
	public static User getUserSession(){
		try{
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			return (User) authentication.getPrincipal();
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}
}
