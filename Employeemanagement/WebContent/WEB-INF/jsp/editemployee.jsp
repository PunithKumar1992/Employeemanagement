<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Edit Employee Details</title>
  
  
  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>

  <html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/datepicker.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="js/datepicker.js"></script>
<script src="js/datepicker.en.js"></script>

<style type="text/css">
td
{
padding:0.5em;

}
.error
{
color:red;
}

</style>
    <title>Edit Employee Details</title>
  </head>
  <body>
    
    <header id="header">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center" id="title"> Edit Employee Details </h1>
          </div>
        </div>
      </div>
    </header>

    <div class="container survey">
      <form:form method="post" action="saveeditedemployee" modelAttribute="editemp" class="well form-horizontal" id="survey-form" onsubmit="return FormValidation();">
     
          <div class="form-group">
            <div class="col-md-4">
              <div class="Form control">
              <form:hidden path="emp_id" class="form-control"  id="empid" title="Please fill out this field" readonly="true"/>
              </div>
             </div>
          </div>
		  <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">First Name <span style="color:red;">*</span></label>  
            <div class="col-md-4">
              <div class="Form control">
                <form:input  path="first_name" class="form-control" id="firstname" title="Please fill out this field" placeholder="Enter the Employee first name" onchange="return FormValidation();" onblur="return FormValidation();" />
              <label id="firstnamelabel" class="error"></label>
              </div>
             </div>
          </div>
		  
		  <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Last Name <span style="color:red;">*</span></label>  
            <div class="col-md-4">
              <div class="Form control">
                <form:input  path="last_name" class="form-control"  id="lastname" title="Please fill out this field" placeholder="Enter the Employee last name" onchange="return FormValidation();" onblur="return FormValidation();"/>
               <label id="lastnamelabel" class="error"></label>
              </div>
             </div>
          </div>
		  
		   <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Date of join <span style="color:red;">*</span></label>  
            <div class="col-md-4">
              <div class="Form control">
              <input type="hidden" id="hidedate" name="hidedate" value="${editemp.dateofjoin}">
               <form:input  path="dateofjoin"  class="datepicker-here datepicker-promo form-control" id="joindate" title="Please Enter the joined date" placeholder="Enter the Employee Joined date" required="required"/> 
               <label class="error" id="joindatelabel"></label>
			  </div>
             </div>
          </div>
		  <script type="text/javascript">
										 
    							var $promo = $('.datepicker-promo');
    							$promo.datepicker({
        						language: 'en'
   					 })</script> 
		  
		   <div class="form-group"> 
            <label class="col-md-4 control-label">Department <span style="color:red;">*</span></label>
            <div class="col-md-2">
              <div class="form control">
              <form:select path="department" class="form-control" id="department" style="width:160px;" required="required" onchange="return FormValidation();">
               <form:option value="select" selected="selected"  disabled="true" hidden="true" >Select Option</form:option>
              	  <form:option value="Testing">Testing </form:option>
                  <form:option value="Development">Development</form:option>
                  <form:option value="Analysis">Analysis</form:option>
              
              </form:select>
              <label class="error" id="departmentlabel"></label>
                             </div>
            </div>
          </div>
		  
		  <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Salary</label>  
            <div class="col-md-4">
              <div class="Form control">
                <form:input  path="salary" class="form-control" onchange="return checksal();"  type="text" id="salary" title="Please fill out this field" placeholder="Enter the Employee Salary" />
              </div>
             </div>
          </div>
		  
		   <div class="form-group"> 
            <label class="col-md-4 control-label">Experience </label>
            <div class="col-md-2">
              <div class="form control">
               <form:select class="form-control" id="dropdown" style="width:160px;" path="experience">
                  <form:option value="Select" selected="selected" disabled="true">Select Option</form:option>
                  <form:option value="YES">YES </form:option>
                  <form:option value="NO">NO</form:option>
                  </form:select>
              </div>
            </div>
          </div>
		  
		  <div class="form-group">
            <label class="col-md-4 control-label" for="comment">permanent Address</label>
            <div class="col-md-4">
              <form:textarea class="form-control" path="permanent_address" id="permanent_address" placeholder="Enter your comment here..." style="height:80px;"></form:textarea>
            </div>
          </div>
		  
		 <!--  <div class="form-group">
            <label class="col-md-4 control-label" >If present address is same as permanent address </label>
              <div class="col-md-4">
                <div class="checkbox">
                  <label>
                      <input type="checkbox" value="1" name="sameaddress" id="sameaddress"> 
                  </label>
                </div>

              </div>
          </div> -->
		   <div class="form-group">
            <label class="col-md-4 control-label" for="comment">present Address</label>
            <div class="col-md-4">
              <form:textarea class="form-control" path="present_address" id="present_address" placeholder="Enter your comment here..." style="height:80px;"></form:textarea>
            </div>
          </div>
		  
		  <hr><label class="class="col-md-4 control-label" style="margin-left:20%;">Education Details</label></hr>
		  <br>
		  <br>
		  <input type="hidden" id="artcount" name="artcount" value="1">
		  <!-- <i class="fa fa-plus" aria-hidden="true" value='Add TextArea' id='addButton' title="Add Text Area" style="margin-left: 30%;"></i>
		   <i class="fa fa-times" aria-hidden="true"  value='Remove TextArea' id='removeButton' title="Remove Text Area"></i> -->
		 <div id="TextBoxesGroup"> 
		  <input type="hidden" name="qdivcount" value="${fn:length(editemp.eduqualification)}">
		 <c:forEach var="qualilist" items="${editemp.eduqualification}" varStatus="theCount">
		  <div class="" id="qualificationgroup1" style="border:1px solid #cfcdd3;width:70%;margin-left:10%;margin-bottom:5%">
		  <div class="form-group"> 
            <label class="col-md-4 control-label">Qualification </label>
            <div class="col-md-2">
              <div class="form control">
               <select class="form-control" id="qualification${theCount.count}" name="qualification${theCount.count}" onchange="checkqualification(this.id);" style="width:160px;" required >
                  <option value="${qualilist.qualification}" selected="selected" hidden="true">${qualilist.qualification}</option>
                 <option value='SSlc'>SSlc</option>
                  <option value='PUC'>PUC</option>
				  <option value='Diploma'>Diploma</option>
				   <option value='BA'>BA</option>
				  <option value='BSc'>BSc</option>
				   <option value='Bcom'>Bcom</option>
				    <option value='BE'>BE</option>
					<option value='MA'>MA</option>
					 <option value='Msc'>Msc</option>
					  <option value='Mcom'>Mcom</option>
					  <option value='MTech'>MTech</option>
                  </select>
                  
                  <label class="error" id="qualificationlabel${theCount.count}"></label>
              </div>
            </div>
          </div>
		  
		   <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">University/College</label>  
            <div class="col-md-4">
              <div class="Form control">
                <input  name="college${theCount.count}" class="form-control"  type="text" value="${qualilist.college}" id="college${theCount.count}" onchange="checkcollege(this.id);" title="Please fill out this field" placeholder="Enter the Employee University/college" >
              <label class="error" id="collegelabel${theCount.count}"></label>
              </div>
             </div>
          </div>
		  
		   <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Percentage %</label>  
            <div class="col-md-4">
              <div class="Form control">
               <input  name="percentage${theCount.count}" class="form-control" type="text" value="${qualilist.percentage}" id="percentage${theCount.count}" onchange="checkpercent(this.id);"  title="Please fill out this field" placeholder="Enter the Employee percentage" >               
               <label class="error" id="percentagelabel${theCount.count}"></label>
              </div>
             </div>
          </div>
		  
		   <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Year of completion </label>  
            <div class="col-md-4">
              <div class="Form control">
              <select class="form-control" id="completionyear${theCount.count}" name="completionyear${theCount.count}" onchange="checkyear(this.id); "style="width:160px;" required >
                  <option value="${qualilist.completionyear}" selected="selected" hidden="true">${qualilist.completionyear}</option>
									<option value='1992'>1992</option>
									<option value='1993'>1993</option>
									<option value='1994'>1994</option>
									<option value='1995'>1995</option>
									<option value='1996'>1996</option>
									<option value='1997'>1997</option>
									<option value='1998'>1998</option>
									<option value='1999'>1999</option>
									<option value='2000'>2000</option>
									<option value='2001'>2001</option>
									<option value='2002'>2002</option>
									<option value='2003'>2003</option>
									<option value='2004'>2004</option>
									<option value='2005'>2005</option>
									<option value='2006'>2006</option>
									<option value='2007'>2007</option>
									<option value='2008'>2008</option>
									<option value='2009'>2009</option>
									<option value='2010'>2010</option>
									<option value='2011'>2011</option>
									<option value='2012'>2012</option>
									<option value='2013'>2013</option>
									<option value='2014'>2014</option>
									<option value='2015'>2015</option>
									<option value='2016'>2016</option>
									<option value='2017'>2017</option>
									<option value='2018'>2018</option>
								</select>
              		<label class="error" id="completionyearlabel${theCount.count}"></label>
              </div>
             </div>
          </div>
		  
		  </div>
		 
		   </c:forEach>
		  </div>
		  
		   <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Contact no <span style="color:red;">*</span> </label>  
            <div class="col-md-4">
              <div class="Form control">
                <form:input  path="contact_no" class="form-control" id="contact" title="Please fill out this field" placeholder="Enter the Employee Contact number" onchange="return FormValidation();" onblur="return FormValidation();" />
              </div>
             </div>
          </div>



          <div class="form-group">
            <label class="col-md-4 control-label" for="email" id="email-label"> E-Mail <span style="color:red;">*</span></label>  
            <div class="col-md-4">
              <div class="form control">
                <form:input path="email" placeholder="Enter your email address" class="form-control" id="email" title="Please fill out this field" onchange="return FormValidation();" onblur="return FormValidation();" />
              </div>
          </div>
          </div>
		  
		  <div class="form-group"> 
            <label class="col-md-4 control-label">Active Status <span style="color:red;" required="">*</span> </label>
            <div class="col-md-2">
              <div class="form control">
               <form:select class="form-control" id="activestatus" path="activestatus" style="width:160px;" required="required" onchange="checkactive();">
                  <form:option value="select" selected="selected" disabled="true">Select Option</form:option>
                  <form:option value="Active">Active </form:option>
                  <form:option value="InActive">InActive</form:option>
                  </form:select>
              </div>
            </div>
          </div>
        
          

          <div class="form-group">
            <label class="col-md-4 control-label"></label>
            <div class="col-md-6">
              <button type="submit"  class="btn btn-primary" id="submit">Submit</button>
            </div>
          </div>
     </form:form>
   </div>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script type="text/javascript">
   $( document ).ready(function() {
	  var date = $('#hidedate').val();
	  $('#joindate').val(date);
	});
   </script>
   
   
   <script type="text/javascript">
function FormValidation()
{
	var count = document.getElementById('artcount').value;
  var fn=document.getElementById('firstname').value;
    if(fn == ""){
        document.getElementById('firstname').style.borderColor = "red";
        document.getElementById('firstnamelabel').innerHTML = "Enter the Employee First name";
        document.getElementById('firstname').focus();
        return false;
    }else{
        document.getElementById('firstname').style.borderColor = "green";
        document.getElementById('firstnamelabel').innerHTML = "";
        
    }
    if (/^[A-Za-z][A-Za-z0-9]+$/.test(document.getElementById("firstname").value)) {
    	 document.getElementById('firstname').style.borderColor = "green";
         document.getElementById('firstnamelabel').innerHTML = "";
       
        
    }else{
    	 document.getElementById('firstname').style.borderColor = "red";
         document.getElementById('firstnamelabel').innerHTML = "Enter the valid Employee First name, name must start with characters";
         document.getElementById('firstname').focus();
         return false;
    }
    if(fn.length<2){
        document.getElementById('firstname').style.borderColor = "red";
        document.getElementById('firstnamelabel').innerHTML = "Employee First name is too short";
        document.getElementById('firstname').focus();
        return false;
    }
    else{
        document.getElementById('firstname').style.borderColor = "green";
        document.getElementById('firstnamelabel').innerHTML = "";
    }
	
	var ln=document.getElementById('lastname').value;
    if(ln == ""){
        document.getElementById('lastname').style.borderColor = "red";
        document.getElementById('lastnamelabel').innerHTML = "Enter the Employee Last name";
        document.getElementById('lastname').focus();
        
        return false;
    }else{
        document.getElementById('lastname').style.borderColor = "green";
        document.getElementById('lastnamelabel').innerHTML = "";
        
    }
    if (/^[A-Za-z][A-Za-z0-9]+$/.test(document.getElementById("lastname").value)){
       
        document.getElementById('lastname').style.borderColor = "green";
        document.getElementById('lastnamelabel').innerHTML = "";
       
    }else{
        document.getElementById('lastname').style.borderColor = "red";
        document.getElementById('lastnamelabel').innerHTML = "Enter the valid Employee Last name, name must start with characters";
        document.getElementById('lasttname').focus();
  
        return false;
    }
    if(ln.length <=2){
        document.getElementById('lastname').style.borderColor = "red";
        document.getElementById('lastnamelabel').innerHTML ="Employee Last name is too short";
       	document.getElementById('lasttname').focus();
        
        return false;
    }else{
        document.getElementById('lastname').style.borderColor = "green";
    }
        
    var department = document.getElementById('department').value;
	  if(department=='select')
	  {
	  document.getElementById('department').style.borderColor="red";
	  document.getElementById('department').focus();
	  document.getElementById('departmentlabel').innerHTML="Please Select the Department"
	  }
	  else if(department != 'select')
	  {
	   document.getElementById('department').style.borderColor="green";
	   document.getElementById('departmentlabel').innerHTML="";
	  }
    
	var ph=document.getElementById('contact').value;
    if(ph=="")
 	   {
 	   document.getElementById('contact').style.borderColor = "red";
 	  document.getElementById('contactlabel').innerHTML="Enter the Employee Contact number";
 	 document.getElementById('contact').focus();
        return false;
    }else{
        document.getElementById('contact').style.borderColor = "green";
        document.getElementById('contactlabel').innerHTML="";
    }
   if(/^[789]\d{9}$/.test(document.getElementById("contact").value))
	   {
	   
	   document.getElementById('contact').style.borderColor = "green";
	   document.getElementById('contactlabel').innerHTML="";
	   }
   else
   {
   document.getElementById('contact').style.borderColor = "red";
   document.getElementById('contactlabel').innerHTML="Enter the valid Contact number";
   document.getElementById('contact').focus();
   return false;
   }
    
    
    var em=document.getElementById('email').value;
    if(em=="")
 	   {
 	   document.getElementById('email').style.borderColor = "red";
 	  document.getElementById('emaillabel').innerHTML="Enter the Employee Email id";
 	 document.getElementById('email').focus();
        return false;
    }else{
        document.getElementById('email').style.borderColor = "green";
        document.getElementById('emaillabel').innerHTML="";
    }
    if(/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/.test(document.getElementById("email").value))
    	{
    	document.getElementById('email').style.borderColor = "green";
    	document.getElementById('emaillabel').innerHTML="";
       
    	
    	}
    else
 	   {
 	   document.getElementById('email').style.borderColor = "red";
 	  document.getElementById('emaillabel').innerHTML="Enter the valid Email id";
 	 document.getElementById('email').focus();
 	   return false;
 	   }   
	   
	 
	  
	  var activestatus = document.getElementById('activestatus').value;
	  if(activestatus=='select')
	  {
	  document.getElementById('activestatus').style.borderColor="red";
	  document.getElementById('activestatus').focus();
	  document.getElementById('activestatuslabel').innerHTML="Please Select the active status";
	  return false;
	  }
	  else if(activestatus != 'select')
	  {
	   document.getElementById('activestatus').style.borderColor="green";
	   document.getElementById('activestatuslabel').innerHTML="";
	  }
	
	 }



    </script>
    
    <script type="text/javascript">
 
 function checksal()
 {
 if(/^\d{1,6}(?:\.\d{0,2})?$/.test(document.getElementById("salary").value))
 {
  document.getElementById('salary').style.borderColor = "green";
	   }
   else
   {
   document.getElementById('salary').style.borderColor = "red";
   return false;
   }
 
 }
 
 function checkqualificationinner(id)
 {
	 var qualification1 = document.getElementById('qualification'+id).value;
	
		  if(qualification1 == 'select')
			  {
			  document.getElementById('qualification'+id).style.borderColor="red";
			  document.getElementById('qualificationlabel'+id).innerHTML="Please Select the Qualification";
			  document.getElementById('qualification'+id).focus();
			  return false;
			  }
			  else if(qualification1 != 'select')
			  {
			   document.getElementById('qualification'+id).style.borderColor="green";
			   document.getElementById('qualificationlabel'+id).innerHTML="";
			   document.getElementById('qualification'+id).focus();
			  }
 }
 
 function checkcollegeinner(id)
 {
	 
	 if(/^[a-zA-Z\s]+$/.test(document.getElementById('college'+id).value))
		 {
		 document.getElementById('college'+id).style.borderColor="green"
			 document.getElementById('collegelabel'+id).innerHTML="";
		 
		 }
	 else
		 {
		 document.getElementById('college'+id).style.borderColor="red"
			 document.getElementById('collegelabel'+id).innerHTML="Enter valid college name College name not numeric or special characters";
		 document.getElementById('college'+id).focus();
		 
		 }
 } 
 
 function checkpercentinner(id)
 {
	 var per = document.getElementById('percentage'+id).value;
		  if(/^\d{1,6}(?:\.\d{0,2})?$/.test(document.getElementById('percentage'+id).value))
			 {
			  document.getElementById('percentage'+id).style.borderColor = "green";
			  document.getElementById('percentagelabel'+id).innerHTML="";
			  
				   }
			   else
			   {
			   document.getElementById('percentage'+id).style.borderColor = "red";
			   document.getElementById('percentagelabel'+id).innerHTML="Please enter the valid percentage";
			   document.getElementById('percentage'+id).foucs();
			   return false;
			   } 
		  if (per<= 0||per >= 100) {
				 document.getElementById('percentage'+id).style.borderColor = "red";
				 document.getElementById('percentagelabel'+id).innerHTML="Please enter the percentage in 0 to 100 % only";
		         return false;
		     }
			 else
				 {
				 document.getElementById('percentage'+id).style.borderColor = "green";
				 document.getElementById('percentagelabel'+id).innerHTML="";
				 }
 }
 function checkyearinner(id)
 {
	
	 var year = document.getElementById('completionyear'+id).value;
		 
		  if(year=='select')
			  {
			  document.getElementById('completionyear'+id).style.borderColor="red";
			  document.getElementById('completionyearlabel'+id).innerHTML="Please Select the Completion Year";
			  document.getElementById('completionyear'+id).focus();
			  
			  return false;
			  }
			  else if(year != 'select')
			  {
			   document.getElementById('completionyear'+id).style.borderColor="green";
			   document.getElementById('completionyearlabel'+id).innerHTML="";
			  }
	
 }
 
 
 function checkqualification(id)
 {
	cid=id.substring(13);
	 var qualification = document.getElementById(id).value;
		 
		  if(qualification=='select')
			  {
			  document.getElementById(id).style.borderColor="red";
			  document.getElementById('qualificationlabel'+cid).innerHTML="Please Select the Qualification";
			  document.getElementById(id).focus();
			  
			  return false;
			  }
			  else if(qualification != 'select')
			  {
			   document.getElementById(id).style.borderColor="green";
			   document.getElementById('qualificationlabel'+cid).innerHTML="";
			  }
		 	 checkcollegeinner(cid);
			 checkpercentinner(cid);
			 checkyearinner(cid);
 }
 
 
 function checkcollege(id)
 {
	 var qid= id.substring(7);
	 
	 if(/^[a-zA-Z\s]+$/.test(document.getElementById(id).value))
		 {
		 document.getElementById(id).style.borderColor="green"
			 document.getElementById('collegelabel'+qid).innerHTML="";
		 
		 }
	 else
		 {
		 document.getElementById(id).style.borderColor="red"
			 document.getElementById('collegelabel'+qid).innerHTML="Enter valid college name College name not numeric or special characters";
		 document.getElementById(id).focus();
		 
		 }
	 checkqualificationinner(qid);
	 checkpercentinner(qid);
	 checkyearinner(cid);
 }
 
 function checkpercent(id)
 {
	var pid=id.substring(10);
	 var per = document.getElementById(id).value;
		  if(/^\d{1,6}(?:\.\d{0,2})?$/.test(document.getElementById(id).value))
			 {
			  document.getElementById(id).style.borderColor = "green";
			  document.getElementById('percentagelabel'+pid).innerHTML="";
			  
				   }
			   else
			   {
			   document.getElementById(id).style.borderColor = "red";
			   document.getElementById('percentagelabel'+pid).innerHTML="Please enter the valid percentage";
			   document.getElementById(id).foucs();
			   return false;
			   } 
		  if (per<= 0||per >= 100) {
				 document.getElementById(id).style.borderColor = "red";
				 document.getElementById('percentagelabel'+pid).innerHTML="Please enter the percentage in 0 to 100 % only";
		         return false;
		     }
			 else
				 {
				 document.getElementById(id).style.borderColor = "green";
				 document.getElementById('percentagelabel'+pid).innerHTML="";
				 }
		  checkqualificationinner(pid);
		  checkcollegeinner(pid);
		  checkyearinner(cid);
	 
	 
 }
 
 function checkyear(id)
 {
	 
	 cid=id.substring(14);
	 var year = document.getElementById(id).value;
		 
		  if(year == 'select')
			  {
			  document.getElementById(id).style.borderColor="red";
			  document.getElementById('completionyearlabel'+cid).innerHTML="Please Select the Completion Year";
			  document.getElementById(id).focus();
			  
			  return false;
			  }
			  else if(year != 'select')
			  {
			   document.getElementById(id).style.borderColor="green";
			   document.getElementById('completionyearlabel'+cid).innerHTML="";
			  }
		  checkqualificationinner(cid);
		  checkcollegeinner(cid);
		  checkpercentinner(cid);
	
 }
 </script>
 
</body>
</html>