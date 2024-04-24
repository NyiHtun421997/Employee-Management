package com.in28minutes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.in28minutes.bean.Employee;
import com.in28minutes.dao.EmpMapper;

@Service
public class EmployeeService {

	@Autowired
	private EmpMapper empMapper;
	
	public List<Employee> getAllEmployees() {
		return empMapper.getAllEmployees();
	}
	
	public void updateEmployee(Employee employee) {
		empMapper.updateEmployee(employee);
	}

	public List<String> getAllAfflCodes() {
		return empMapper.getAllAfflCodes();
	}

}
