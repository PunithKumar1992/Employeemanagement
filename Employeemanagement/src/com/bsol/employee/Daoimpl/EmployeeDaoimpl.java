package com.bsol.employee.Daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bsol.employee.Dao.EmployeeDao;
import com.bsol.employee.pojo.Employeee;

@Repository
public class EmployeeDaoimpl implements EmployeeDao {

	@Autowired
	private SessionFactory factory;
	@Override
	public String getlastId() {
		Session session = factory.openSession();
		Query query = session.createQuery("from Employeee order by emp_id DESC");
		query.setMaxResults(1);
		Employeee emp = (Employeee) query.uniqueResult();
		String empid ="";
		if(emp==null)
		{
			empid="100";
		}
		else
		{
			empid = emp.getEmp_id();
			String subid= empid.substring(4);
			int id = Integer.parseInt(subid);
			 id = id+1;
			 empid=String.valueOf(id);
		}
		return empid;
	}
	@Override
	public void saveemployee(Employeee emp) {
		Session session = factory.getCurrentSession();
		session.save(emp);
		
	}
	@Override
	public List<Employeee> getallEmployees() {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from Employeee");
		List<Employeee>list = query.list();
		return list;
	}
	@Override
	public Employeee getEmpById(String empid) {
		Session session = factory.getCurrentSession();
		Employeee emp = session.get(Employeee.class, empid);
		return emp;
	}
	@Override
	public void updateEmployee(Employeee emp) {
		Session session = factory.getCurrentSession();
		session.update(emp);
		
	}

}
