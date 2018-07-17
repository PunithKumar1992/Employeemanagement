package com.bsol.employee.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bsol.employee.Service.EmployeeService;
import com.bsol.employee.pojo.Educationqualification;
import com.bsol.employee.pojo.Employeee;

@Controller
public class Employeecontroller {
	
	@Autowired
	private EmployeeService empservice;
	
	@RequestMapping("/index")
	public ModelAndView indexcontroller()
	{
		List<Employeee> list = empservice.getallEmployees();
		String empid = empservice.getlastId();
		Employeee emp = new Employeee();
		System.out.println("in controller");
		ModelAndView mv = new ModelAndView();
		mv.addObject("newemp", emp);
		mv.addObject("empid", empid);
		mv.addObject("emplist", list);
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("/")
	public ModelAndView controller()
	{
		List<Employeee> list = empservice.getallEmployees();
		String empid = empservice.getlastId();
		Employeee emp = new Employeee();
		System.out.println("in controller");
		ModelAndView mv = new ModelAndView();
		mv.addObject("newemp", emp);
		mv.addObject("empid", empid);
		mv.addObject("emplist", list);
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(value="/saveemployee")
	public String saveemployeeController(@ModelAttribute("newemp")Employeee emp,@RequestParam Map<String, String>reqparam)
	{
		int count = Integer.parseInt(reqparam.get("artcount"));
	 Educationqualification[]  qulificationarry = new Educationqualification[count];
	
	 for(int i =0; i<count;i++)
	 {
		 qulificationarry[i] = new Educationqualification();
	 }
		 String quali="";
		 String college;
		 int percentage;
		 int year ;
		 
		 for(int i=1;i<=count;i++)
		 {
			 if(reqparam.get("qualification"+i)!=null)
			 quali = reqparam.get("qualification"+i);
			 else
				 quali = "NM";
			 if(reqparam.get("qualification"+i)!=null)
			 qulificationarry[i-1].setQualification(reqparam.get("qualification"+i));
			 else
				 qulificationarry[i-1].setQualification("NM"); 
			 if(reqparam.get("college"+i)!=null)
			 qulificationarry[i-1].setCollege(reqparam.get("college"+i));
			 else
				 qulificationarry[i-1].setCollege("NM");
			 if(reqparam.get("percentage"+i)!="")
			 qulificationarry[i-1].setPercentage(Integer.parseInt(reqparam.get("percentage"+i)));
			 else
			qulificationarry[i-1].setPercentage(0);
			 if(reqparam.get("completionyear"+i)!="")
			 qulificationarry[i-1].setCompletionyear(Integer.parseInt(reqparam.get("completionyear"+i)));
			 else
				 qulificationarry[i-1].setCompletionyear(0);
			 switch(quali)
			 {
			 case "SSlc":
				 qulificationarry[i-1].setQualificationvalue(1);
				 break;
		
			 case "PUC":
			 case "Diploma":
				 qulificationarry[i-1].setQualificationvalue(2);
				 break;
				 
			 case "BA":
			 case "BSc":
			 case "Bcom":
			 case "BE":
				 qulificationarry[i-1].setQualificationvalue(3);
				 break;
				 
			 case "MA":
			 case "Msc":
			 case "Mcom":
			 case "MTech":
				 qulificationarry[i-1].setQualificationvalue(4);
				 break;
				 
			default :
				 qulificationarry[i-1].setQualificationvalue(0);
				 break;
				 
			 }
			 qulificationarry[i-1].setQemp_id(emp.getEmp_id());
			 
		 }
		 List<Educationqualification> qualilist = new ArrayList<Educationqualification>();
		for(int i=1;i<=count;i++)
		{
			qualilist.add(qulificationarry[i-1]);
		}
		emp.setEduqualification(qualilist);
		empservice.saveemployee(emp);
		return"redirect:/index";
	}
	
	@RequestMapping(value="/deleteemployee")
	public String deleteemployeeController(@RequestParam("emp_id")String emp_id)
	{
		Employeee emp = empservice.getEmpById(emp_id);
		emp.setActivestatus("InActive");
		empservice.updateEmployee(emp);
		return"redirect:/index";
	}
	
	@RequestMapping(value="/editemployee")
	public ModelAndView editemployeeController(@RequestParam("emp_id")String emp_id)
	{
		Employeee emp = empservice.getEmpById(emp_id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("editemp", emp);
		mv.setViewName("editemployee");
		return mv;
		
	}
	
	@RequestMapping(value="/saveeditedemployee")
	public String saveeditedemployeeController(@ModelAttribute("editemp")Employeee emp,@RequestParam Map<String, String>reqparam)
	{
		int count = Integer.parseInt(reqparam.get("qdivcount"));
		 Educationqualification[]  qulificationarry = new Educationqualification[count];
			
		 for(int i =0; i<count;i++)
		 {
			 qulificationarry[i] = new Educationqualification();
		 }
			 String quali="";
			 String college;
			 int percentage;
			 int year ;
			 
			 for(int i=1;i<=count;i++)
			 {
				 if(reqparam.get("qualification"+i)!=null)
				 quali = reqparam.get("qualification"+i);
				 else
					 quali = "NM";
				 if(reqparam.get("qualification"+i)!=null)
				 qulificationarry[i-1].setQualification(reqparam.get("qualification"+i));
				 else
					 qulificationarry[i-1].setQualification("NM"); 
				 if(reqparam.get("college"+i)!=null)
				 qulificationarry[i-1].setCollege(reqparam.get("college"+i));
				 else
					 qulificationarry[i-1].setCollege("NM");
				 if(reqparam.get("percentage"+i)!="")
				 qulificationarry[i-1].setPercentage(Integer.parseInt(reqparam.get("percentage"+i)));
				 else
				qulificationarry[i-1].setPercentage(0);
				 if(reqparam.get("completionyear"+i)!="")
				 qulificationarry[i-1].setCompletionyear(Integer.parseInt(reqparam.get("completionyear"+i)));
				 else
					 qulificationarry[i-1].setCompletionyear(0);
				 switch(quali)
				 {
				 case "SSlc":
					 qulificationarry[i-1].setQualificationvalue(1);
					 break;
			
				 case "PUC":
				 case "Diploma":
					 qulificationarry[i-1].setQualificationvalue(2);
					 break;
					 
				 case "BA":
				 case "BSc":
				 case "Bcom":
				 case "BE":
					 qulificationarry[i-1].setQualificationvalue(3);
					 break;
					 
				 case "MA":
				 case "Msc":
				 case "Mcom":
				 case "MTech":
					 qulificationarry[i-1].setQualificationvalue(4);
					 break;
					 
				default :
					 qulificationarry[i-1].setQualificationvalue(0);
					 break;
					 
				 }
				 qulificationarry[i-1].setQemp_id(emp.getEmp_id());
				 
			 }
			 List<Educationqualification> qualilist = new ArrayList<Educationqualification>();
			for(int i=1;i<=count;i++)
			{
				qualilist.add(qulificationarry[i-1]);
			}
			emp.setEduqualification(qualilist);
			empservice.updateEmployee(emp);
		return"redirect:/index";
	}
	
	

}
