package com.bsol.employee.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="educationqualification")
public class Educationqualification {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="eduquali_id")
	private int eduquali_id;
	
	@Column(name="qualification")
	 String qualification;
	
	@Column(name="college")
	private String college;
	
	
	@Column(name="completionyear")
	private int completionyear;
	
	@Column(name="percentage")
	private int percentage;
	
	@Column(name="qualificationvalue")
	private int qualificationvalue;
	
	@Column(name="qemp_id")
	private String qemp_id;
	
	@ManyToOne(optional=false)
	@JoinColumn(name="qemp_id",insertable=false, updatable=false)
	private Employeee empdetail;

	public int getEduquali_id() {
		return eduquali_id;
	}

	public void setEduquali_id(int eduquali_id) {
		this.eduquali_id = eduquali_id;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public int getCompletionyear() {
		return completionyear;
	}

	public void setCompletionyear(int completionyear) {
		this.completionyear = completionyear;
	}

	public int getQualificationvalue() {
		return qualificationvalue;
	}

	public void setQualificationvalue(int qualificationvalue) {
		this.qualificationvalue = qualificationvalue;
	}

	public String getQemp_id() {
		return qemp_id;
	}

	public void setQemp_id(String qemp_id) {
		this.qemp_id = qemp_id;
	}

	public Employeee getEmpdetail() {
		return empdetail;
	}

	public void setEmpdetail(Employeee empdetail) {
		this.empdetail = empdetail;
	}

	public int getPercentage() {
		return percentage;
	}

	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}

	@Override
	public String toString() {
		return "Educationqualification [eduquali_id=" + eduquali_id + ", qualification=" + qualification + ", college="
				+ college + ", completionyear=" + completionyear + ", percentage=" + percentage
				+ ", qualificationvalue=" + qualificationvalue + ", qemp_id=" + qemp_id  +", empdetail=" + empdetail
				+ "]";
	}
	
	

}
