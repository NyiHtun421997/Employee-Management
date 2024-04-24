package com.in28minutes.bean;

import java.io.Serializable;

public class Employee implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String empId;
	private String name;
	private String afflCd;
	private Boolean isAdmin;
	
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAfflCd() {
		return afflCd;
	}
	public void setAfflCd(String afflCd) {
		this.afflCd = afflCd;
	}
	public Boolean getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	@Override
	public String toString() {
		return "Employee [empCd=" + empId + ", name=" + name + ", afflCd=" + afflCd + ", isAdmin=" + isAdmin + "]";
	}	
}
