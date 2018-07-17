package com.bsol.employee.pojo;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="employeee")
public class Employeee {
	
	@Id
	private String emp_id;
	@Column(name="first_name")
	private String first_name;
	
	@Column(name="last_name")
	private String last_name;
	
	@Column(name="dateofjoin")
	private String dateofjoin;
	
	@Column(name="department")
	private String department;
	
	@Column(name="salary")
	private int salary;
	
	@Column(name="experience")
	private String experience; 
	
	@Column(name="permanent_address")
	private String permanent_address;
	
	@Column(name="present_address")
	private String present_address;
	
	@Column(name="contact_no")
	private String contact_no;
	
	@Column(name="email")
	private String email;
	
	@Column(name="activestatus")
	private String activestatus;
	
	
	@OneToMany(mappedBy="empdetail",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	private List<Educationqualification>eduqualification=new ArrayList<Educationqualification>();

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getDateofjoin() {
		return dateofjoin;
	}

	public void setDateofjoin(String dateofjoin) {
		this.dateofjoin = dateofjoin;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getPermanent_address() {
		return permanent_address;
	}

	public void setPermanent_address(String permanent_address) {
		this.permanent_address = permanent_address;
	}

	public String getPresent_address() {
		return present_address;
	}

	public void setPresent_address(String present_address) {
		this.present_address = present_address;
	}

	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getActivestatus() {
		return activestatus;
	}

	public void setActivestatus(String activestatus) {
		this.activestatus = activestatus;
	}

	public List<Educationqualification> getEduqualification() {
		return eduqualification;
	}

	public void setEduqualification(List<Educationqualification> eduqualification) {
		this.eduqualification = eduqualification;
	}


	@Override
	public String toString() {
		return "Employeee [emp_id=" + emp_id + ", first_name=" + first_name + ", last_name=" + last_name
				+ ", dateofjoin=" + dateofjoin + ", department=" + department + ", salary=" + salary + ", experience="
				+ experience + ", permanent_address=" + permanent_address + ", present_address=" + present_address
				+ ", contact_no=" + contact_no + ", email=" + email + ", activestatus=" + activestatus
				+ ", eduqualification=" + eduqualification + "]";
	}
	
	
	
	
	

}
