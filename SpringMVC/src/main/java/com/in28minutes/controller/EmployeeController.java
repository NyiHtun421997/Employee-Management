package com.in28minutes.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.in28minutes.bean.Employee;
import com.in28minutes.service.EmployeeService;

@Controller
@RequestMapping("/admin")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    // Handler method to display the employee list
    @RequestMapping(value = "/get_employees", method = RequestMethod.GET)
    public ModelAndView showEmployeeList(ModelMap model) {
        List<Employee> employees = employeeService.getAllEmployees();
        List<String> afflCodes = employeeService.getAllAfflCodes();
        model.addAttribute("employees", employees);
        model.addAttribute("afflCodes", afflCodes);
        return new ModelAndView("admin-page", model);
    }

    // Handler method to update employee data
    @RequestMapping(value = "/update_employees", method = RequestMethod.POST)
    public ResponseEntity<String> updateEmployees(@RequestBody List<Employee> updatedEmployees) {
        // Process the updated employee data (e.g., update in the database)
        for (Employee employee : updatedEmployees) {
            employeeService.updateEmployee(employee);
        }
        return ResponseEntity.ok("Employees updated successfully");
    }
}
