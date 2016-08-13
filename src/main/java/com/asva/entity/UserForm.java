package com.asva.entity;

import com.fasterxml.jackson.annotation.JsonProperty;

public class UserForm {
	
	public static class LoginForm{
		
		@JsonProperty("EMAIL")
		private String email;
		
		@JsonProperty("PASSWORD")
		private String password;

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		@Override
		public String toString() {
			return "LoginForm [email=" + email + ", password=" + password + "]";
		}
		
	}
}
