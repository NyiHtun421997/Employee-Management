package com.in28minutes.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.in28minutes.bean.Employee;
import com.in28minutes.util.MyBatisUtil;

@Repository
public class EmpMapper {

	public List<Employee> getAllEmployees() {
		SqlSession session = MyBatisUtil.getSessionFactory().openSession();
		List<Employee> allEmployees = session.selectList("getAllEmployees");
		session.commit();
		session.close();
		return allEmployees;
	}
	
	public void updateEmployee(Employee employee) {
		SqlSession session = MyBatisUtil.getSessionFactory().openSession();
		session.update("updateEmployeeById", employee);
		session.commit();
		session.close();
	}

	public List<String> getAllAfflCodes() {
		SqlSession session = MyBatisUtil.getSessionFactory().openSession();
		List<String> allAfflCodes = session.selectList("getAllAfflCodes");
		session.commit();
		session.close();
		return allAfflCodes;
		
	}
}
