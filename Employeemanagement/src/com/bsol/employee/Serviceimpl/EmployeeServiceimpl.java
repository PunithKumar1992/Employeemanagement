package com.bsol.employee.Serviceimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsol.employee.Dao.EmployeeDao;
import com.bsol.employee.Service.EmployeeService;
import com.bsol.employee.pojo.Employeee;

@Service
public class EmployeeServiceimpl implements EmployeeService {

	@Autowired
	private EmployeeDao empdao; 
	
	
	@Override
	@Transactional
	public String getlastId() {
		String empid = empdao.getlastId();
		return empid;
	}


	@Override
	@Transactional
	public void saveemployee(Employeee emp) {
		empdao.saveemployee(emp);
	}


	@Override
	@Transactional
	public List getallEmployees() {
		List list = empdao.getallEmployees();
		return list;
	}


	@Override
	@Transactional
	public Employeee getEmpById(String empid) {
		Employeee emp = empdao.getEmpById(empid);
		
		return emp;
	}


	@Override
	@Transactional
	public void updateEmployee(Employeee emp) {
		empdao.updateEmployee(emp);
		
	}

}
