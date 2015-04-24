package com.web.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/common")
public class HomePageController {
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(ModelMap model, HttpServletRequest request) throws UnsupportedEncodingException{
		
		return "jsp/list";
	}

}
