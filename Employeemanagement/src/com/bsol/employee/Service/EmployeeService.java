package com.bsol.employee.Service;

import java.util.List;

import com.bsol.employee.pojo.Employeee;

public interface EmployeeService {
	
	public String getlastId();
	public void saveemployee(Employeee emp);
	public List<Employeee> getallEmployees();
	public Employeee getEmpById(String empid);
	public void updateEmployee(Employeee emp);

}
