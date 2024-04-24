package com.in28minutes.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.in28minutes.bean.User;
import com.in28minutes.validator.LoginValidator;



@Controller
@RequestMapping
public class LoginController {
	
	@Autowired
	private LoginValidator validator;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String sayHello(ModelMap model) {
		model.addAttribute("user", new User());
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String handleLogin(@Valid @ModelAttribute("user") User user, BindingResult result, ModelMap model) {
		
		if (!result.hasErrors()) {
			validator.validate(user, result);
		}
		if (result.hasErrors()) {
			model.put("errorMessage", "Wrong credentials");
			model.put("errors", result);
			return "login";
		}
		model.put("name", user.getName());
		model.put("password", user.getPassword());
		return "welcome";
	}
}
