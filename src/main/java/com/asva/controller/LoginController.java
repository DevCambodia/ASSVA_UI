package com.asva.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import com.asva.entity.ResponseRecord;
import com.asva.entity.Role;
import com.asva.entity.User;
import com.asva.entity.UserForm;

@RestController
public class LoginController {

	@Autowired
	private HttpHeaders header;
	
	@Autowired	
	private RestTemplate restTemplate;
	
	//private String loginURL = "http://localhost:8080/api/user/login";
	private String loginURL = "http://api.assva.com/api/user/login";
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loginaction", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> loginUser(@RequestBody UserForm.LoginForm userForm){
		
		//System.out.println("USERFORM==>" + userForm);
		
		HttpEntity<UserForm.LoginForm> request = new HttpEntity<UserForm.LoginForm>(userForm, header);
		
		@SuppressWarnings("rawtypes")
		ResponseEntity<ResponseRecord> response = restTemplate.exchange(loginURL, HttpMethod.POST, request, ResponseRecord.class);
		LinkedHashMap<String, Object> map = (LinkedHashMap<String, Object>) response.getBody().getData();

		Map<String, Object> m = new HashMap<>();
		
		if(map==null){
			m.put("MESSAGE", "Email or password incorrect! Please try again!");
			m.put("CODE", "9001");
			return new ResponseEntity<Map<String,Object>>(m, HttpStatus.OK);
		}
		
		User u = new User();
		u.setId((Integer)map.get("ID"));
		u.setEmail((String)map.get("EMAIL"));
		u.setFirstName((String)map.get("FIRSTNAME"));
		u.setLastName((String)map.get("LAST_NAME"));
		u.setGender((String)map.get("GENDER"));
		Role r = new Role();
		r.setId((Integer)((LinkedHashMap<String, Object>)map.get("ROLE")).get("ID"));
		r.setName((String)((LinkedHashMap<String, Object>)map.get("ROLE")).get("NAME"));
		u.setRole(r);	
		
		UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(u, u.getPassword(), u.getAuthorities());
		auth.setDetails(u);
		
		SecurityContextHolder.getContext().setAuthentication(auth);
		//Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		String base_url = "http://localhost:8080/ASSVAUI";
		//String base_url = "http://assva.com";
		m.put("CODE", "9000");
		m.put("MESSAGE", "Login Successfully!");
		m.put("ROLE", u.getRole().getName());
		if(	u.getRole().getName().equalsIgnoreCase("Admin")){
			m.put("REDIRECT_URL", base_url + "/admin/dashboard");
		}else if(u.getRole().getName().equalsIgnoreCase("Ads")){
			m.put("REDIRECT_URL", base_url + "/admin/ads");
		}else if(u.getRole().getName().equalsIgnoreCase("Editor")){
			m.put("REDIRECT_URL", base_url + "/admin/product");
		}
		else if(u.getRole().getName().equalsIgnoreCase("Member")){
			m.put("REDIRECT_URL", base_url + "/user/dashboard");
		}
		return new ResponseEntity<Map<String,Object>>(m, HttpStatus.OK);
	}	
}