package com.bsol.employee.Daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.SqlQuery;
import org.springframework.stereotype.Repository;

import com.bsol.employee.Dao.EmployeeDao;
import com.bsol.employee.pojo.Educationqualification;
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
	public List getallEmployees() {
		Session session = factory.getCurrentSession();
		/*Query query = session.createQuery("from Employeee");
		List list = query.list();*/
		SQLQuery query = session.createSQLQuery("SELECT emp_id,first_name,last_name,dateofjoin,department,contact_no,email,activestatus,B.qualification FROM (" + 
				"SELECT emp_id,first_name,last_name,dateofjoin,department,contact_no,email,activestatus,qemp_id,MAX(qualificationvalue) AS ValueQ,qualification FROM educationqualification d,employeee c WHERE c.`emp_id`=d.`qemp_id` GROUP BY qemp_id" + 
				") AS A JOIN educationqualification B ON A.qemp_id=B.qemp_id AND A.ValueQ=B.qualificationvalue GROUP BY emp_id");
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List list = query.list();
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
