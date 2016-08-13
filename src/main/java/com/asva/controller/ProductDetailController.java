package com.asva.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductDetailController {
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String detail(@RequestParam(name="id", required=true) int itemId){
		return "detail";
	}
}
	