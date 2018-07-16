package com.bsol.employee.Dao;

import java.util.List;

import com.bsol.employee.pojo.Educationqualification;
import com.bsol.employee.pojo.Employeee;

public interface EmployeeDao {
	
	public String getlastId();
	public void saveemployee(Employeee emp);
	public List getallEmployees();
	public Employeee getEmpById(String empid);
	public void updateEmployee(Employeee emp);
	
}
