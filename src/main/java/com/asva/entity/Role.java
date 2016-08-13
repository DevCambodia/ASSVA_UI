package com.asva.entity;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Created Date: 14/07/2016
 * Author: Rath Phearun
 * Email: rathphearun123@gmail.com
 * 
 * */
public class Role{
	
	/**
	 * 	
	 * Admin : Full functionality for administrator.
	 * Editor: Control items and users.
	 * Ads   : Manage banner. 
	 * Member: Post their item and manage their information.
	 * 
	 * */
	@JsonProperty("ID")
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@JsonProperty("NAME")
	private String name;

	public Role() {
		super();
	}

	public Role(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Role [name=" + name + "]";
	}

}
