package com.bsol.employee.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bsol.employee.Service.EmployeeService;
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
	public String saveemployeeController(@ModelAttribute("newemp")Employeee emp)
	{
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

}
