package com.in28minutes.validator;

import java.io.Serializable;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.in28minutes.bean.User;

@Component
public class LoginValidator implements Validator, Serializable{

	private static final long serialVersionUID = 1L;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user = (User)target;
		if (user.getAge() >= 20 && StringUtils.isEmpty(user.getEmail())) {
			errors.rejectValue("email", "user.email.required", "Age above 20 years old require email address.");
		}
		if (user.getAge() >= 20 && StringUtils.isEmpty(user.getPhone())) {
			errors.rejectValue("phone", "user.phone.required", "Age above 20 years old require phone number.");
		}
	}

}
