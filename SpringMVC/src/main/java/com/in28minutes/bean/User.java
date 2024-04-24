package com.in28minutes.bean;


import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {

	private Integer userId;

	@NotEmpty(message = "Name cannot be empty.")
	private String name;
	
	@NotEmpty(message = "Kana name cannot be empty.")
	private String kanaName;
	
	@NotNull(message = "Age cannot be empty.")
	private Integer age;
	
	@NotEmpty(message = "Password cannot be empty.")
	private String password;
	
	@Email(message = "Please provide valid email address.")
	private String email;
	
	private String phone;
	
	private Date updateDate;
}
