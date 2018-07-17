<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Employee management</title>
  
  
  
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
    <title>Employee management</title>
  </head>
  <body>
    
    <header id="header">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center" id="title"> Employee management </h1>
          </div>
        </div>
      </div>
    </header>

    <div class="container survey">
      <form:form method="post" action="saveemployee" modelAttribute="newemp" class="well form-horizontal" id="survey-form"  onsubmit="return FormValidation();">
     
          <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Employee Id <span style="color:red;">*</span></label>  
            <div class="col-md-4">
              <div class="Form control">
              <form:input path="emp_id" class="form-control" value="BSOL${empid}" id="empid" title="Please fill out this field" readonly="true"/> 
              </div>
             </div>
          </div>
		  <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">First Name <span style="color:red;">*</span></label>  
            <div class="col-md-4">
              <div class="Form control">
                <form:input  path="first_name" class="form-control" id="firstname" title="Please fill out this field" onchange="return FormValidation();" onblur="return FormValidation();"  placeholder="Enter the Employee first name"/>
               <label id="firstnamelabel" class="error"></label>
              </div>
             </div>
          </div>
		  
		  <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Last Name <span style="color:red;">*</span></label>  
            <div class="col-md-4">
              <div class="Form control">
                <form:input  path="last_name" class="form-control"  id="lastname" title="Please fill out this field" onchange="return FormValidation();" onblur="return FormValidation();" placeholder="Enter the Employee last name" />
              	 <label id="lastnamelabel" class="error"></label>
              </div>
             </div>
          </div>
		  
		   <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Date of join <span style="color:red;">*</span></label>  
            <div class="col-md-4">
              <div class="Form control">
               <form:input  path="dateofjoin" class="datepicker-here datepicker-promo form-control" id="joindate" title="Please Enter the joined date" placeholder="Enter the Employee Joined date" required="required" /> 
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
               <form:option value="select" selected="selected"  disabled="true" hidden="true">Select Option</form:option>
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
               <form:select class="form-control" id="dropdown" style="width:160px;" path="experience" required="required">
                  <form:option value="Select" selected="selected" disabled="true" hidden="true" >Select Option</form:option>
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
		  
		  <div class="form-group">
            <label class="col-md-4 control-label" >If present address is same as permanent address </label>
              <div class="col-md-4">
                <div class="checkbox">
                  <label>
                      <input type="checkbox" value="1" name="sameaddress" id="sameaddress"> 
                  </label>
                </div>

              </div>
          </div>
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
		  <i class="fa fa-plus" aria-hidden="true" value='Add TextArea' id='addButton' title="Add Text Area" style="margin-left: 30%;"></i>
		   <i class="fa fa-times" aria-hidden="true"  value='Remove TextArea' id='removeButton' title="Remove Text Area"></i>
		 <div id="TextBoxesGroup"> 
		  <div class="" id="qualificationgroup1" style="border:1px solid #cfcdd3;width:70%;margin-left:10%;margin-bottom:5%">
		  <div class="form-group"> 
            <label class="col-md-4 control-label">Qualification </label>
            <div class="col-md-2">
              <div class="form control">
               <select class="form-control" id="qualification1" name="qualification1" onchange="checkqualification(this.id); "style="width:160px;" required >
                  <option value="Select" selected="selected"  disabled>Select Option</option>
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
              </div>
            </div>
          </div>
		  
		   <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">University/College</label>  
            <div class="col-md-4">
              <div class="Form control">
                <input  name="college1" class="form-control"  type="text" id="college1" onchange="checkcollege(this.id);" title="Please fill out this field" placeholder="Enter the Employee University/college" >
                <label class="error" id="collegelabel1"></label>
              </div>
             </div>
          </div>
		  
		   <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Percentage %</label>  
            <div class="col-md-4">
              <div class="Form control">
                <input  name="percentage1" class="form-control" type="text" id="percentage1" onchange="checkpercent(this.id);"  title="Please fill out this field" placeholder="Enter the Employee percentage" >
               <label class="error" id="percentagelabel1"></label>
              </div>
             </div>
          </div>
		  
		   <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Year of completion </label>  
            <div class="col-md-4">
              <div class="Form control">
                <input  name="completionyear1" class="form-control" type="text" id="completionyear1" onchange="checkyear(this.id);" title="Please fill out this field" placeholder="Enter the Employee passed out year" >
              		<label class="error" id="completionyearlabel1"></label>
              </div>
             </div>
          </div>
		  
		  </div>
		   
		  </div>
		  
		   <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Contact no <span style="color:red;">*</span> </label>  
            <div class="col-md-4">
              <div class="Form control">
                <form:input  path="contact_no" class="form-control" id="contact" title="Please fill out this field" onchange="return FormValidation();" placeholder="Enter the Employee Contact number" />
             	<label id="contactlabel" class="error"></label>
              </div>
             </div>
          </div>



          <div class="form-group">
            <label class="col-md-4 control-label" for="email" id="email-label"> E-Mail <span style="color:red;">*</span></label>  
            <div class="col-md-4">
              <div class="form control">
                <form:input path="email" placeholder="Enter your email address" class="form-control" id="email" title="Please fill out this field" onchange="return FormValidation();" onblur="return FormValidation();" />
              <label id="emaillabel" class="error"></label>
              </div>
          </div>
          </div>
		  
		  <div class="form-group"> 
            <label class="col-md-4 control-label">Active Status <span style="color:red;" required="">*</span> </label>
            <div class="col-md-2">
              <div class="form control">
               <form:select class="form-control" id="activestatus" path="activestatus" style="width:160px;" required="required" onchange="return FormValidation();">
                  <form:option value="select" selected="selected" disabled="true" hidden="true" >Select Option</form:option>
                  <form:option value="Active">Active </form:option>
                  <form:option value="InActive">InActive</form:option>
                  </form:select>
                   <label class="error" id="activestatuslabel"></label>
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
   <hr>
    <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="text-center" id="title">Employee Information </h1>
          </div>
        </div>
      </div>
      <div class="container survey">
      <form class="well form-horizontal" id="survey-form" style="max-width:1024px;">
     
          <div class="form-group" style="overflow-x:auto;">
		
  <table>
  <tr>
    <th style="padding:1em;background-color:#3a4660;color:#fff;">Employee_id</th>
    <th style="padding:1em;background-color:#3a4660;color:#fff;">Name</th>
    <th style="padding:1em;background-color:#3a4660;color:#fff;">Date_of_Join</th>
	<th style="padding:1em;background-color:#3a4660;color:#fff;">Department</th>
	<th style="padding:1em;background-color:#3a4660;color:#fff;">Contact NO </th>
	<th style="padding:1em;background-color:#3a4660;color:#fff;">EMail Id</th>
	<th style="padding:1em;background-color:#3a4660;color:#fff;">Highest Qualification</th>
	<th style="padding:1em;background-color:#3a4660;color:#fff;">Employee Status</th>
	<th style="padding:1em;background-color:#3a4660;color:#fff;">Action</th>
	
  </tr>
  <c:forEach var="emlist" items="${emplist}">
  <c:url var="empdelete" value="deleteemployee">
  <c:param name="emp_id" value="${emlist.emp_id}"></c:param>
  </c:url>
  <c:url var="editemp" value="editemployee">
  <c:param name="emp_id" value="${emlist.emp_id}"></c:param>
  </c:url>
  <tr>
   <td> <a href="${editemp}">${emlist.emp_id}</a></td>
    <td>${emlist.first_name} ${emlist.last_name}</td>
    <td>${emlist.dateofjoin}</td>
    <td>${emlist.department}</td>
	 <td>${emlist.contact_no}</td>
	 <td>${emlist.email}</td>
	<td>${emlist.qualification}</td>
	 <c:if test="${emlist.activestatus == 'Active'}">
	 <td>YES</td>
	 </c:if>
	  <c:if test="${emlist.activestatus == 'InActive'}">
	 <td>NO</td>
	 </c:if>
	 <td><a href="${empdelete}" onclick="return confirmActiondelete();"><button type="button" class="btn btn-primary">Delete</button></a></td>
  </tr>
  </c:forEach> 
 
</table>
   </div>
   </form>
   </div>
   <script src="main.js"></script>
  </body>
</html>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
 
 function checkqualification(id)
 {
	 var qualification = document.getElementById('qualification'+id).value;
		 
		  if(qualification=='select')
			  {
			  document.getElementById('qualification'+id).style.borderColor="red";
			  return false;
			  }
			  else if(qualification != 'select')
			  {
			   document.getElementById('qualification'+i).style.borderColor="green";
			  }
 }
 
 function checkcollege(id)
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
 
 function checkpercent(id)
 {
	 var per = document.getElementById('percentage'+id).value;
		  if(/^\d{1,6}(?:\.\d{0,2})?$/.test(document.getElementById(' percentage'+id).value))
			 {
			  document.getElementById(' percentage'+id).style.borderColor = "green";
				   }
			   else
			   {
			   document.getElementById(' percentage'+id).style.borderColor = "red";
			   return false;
			   } 
		  if (per<= 0||per >= 100) {
				 document.getElementById('percentage'+id).style.borderColor = "red";
		         return false;
		     }
			 else
				 {
				 document.getElementById('percentage'+id).style.borderColor = "green";
				 }
	 
	 
	 
 }
 

 

 

 
 
 
 </script>
 
<script type="text/javascript">
    $(document).ready(function(){
        $('input[type="checkbox"]').click(function(){
            if($(this).prop("checked") == true){
                var permanent = $("#permanent_address").val();
				$("#present_address").val(permanent);
            }
            else if($(this).prop("checked") == false){
                $("#present_address").val("");
				
            }
        });
    });
</script>




<script type="text/javascript">
$(document).ready(function(){
var count =2;

$("#addButton").click(function () 
{
	if(count>4){ 
            alert("Only 4 Education details allow"); 
             return false; 
	 } 

$("		  <div class='' id='qualificationgroup"+count+"' style='border:1px solid #cfcdd3;width:70%;margin-left:10%;margin-bottom:5%'>"
		  +"<div class='form-group'>"
            +"<label class='col-md-4 control-label'>Qualification </label>"
            +"<div class='col-md-2'><div class='form control'>"
              +" <select class='form-control' id='qualification"+count+"' name='qualification"+count+"' style='width:160px;'>"
                 +" <option value='Select' selected='selected' disabled>Select Option</option>"
                 +" <option value='SSlc'>SSlc</option>"
                  +"<option value='PUC'>PUC</option>"
				  +"<option value='Diploma'>Diploma</option>"
				   +"<option value='BA'>BA</option>"
				  +"<option value='BSc'>BSc</option>"
				   +"<option value='Bcom'>Bcom</option>"
				    +"<option value='BE'>BE</option>"
					 +"<option value='MA'>MA</option>"
					  +"<option value='Msc'>Msc</option>"
					   +"<option value='Mcom'>Mcom</option>"
					    +"<option value='MTech'>MTech</option>"
				  
                 +" </select></div></div> </div>"
		   +"<div class='form-group'><label class='col-md-4 control-label' for='name' id='name-label'>University/College</label>  <div class='col-md-4'>"
              +"<div class='Form control'>"
               +" <input  name='college"+count+"' class='form-control'  type='text' id='college"+count+"' title='Please fill out this field' placeholder='Enter the Employee University/college' >"
              +"</div></div> </div>"
		  +"<div class='form-group'>"
    +" <label class='col-md-4 control-label' for='name' id='name-label'>Percentage %</label>  <div class='col-md-4'><div class='Form control'>"
            +"    <input  name='percentage"+count+"' class='form-control'  type='text' id='percentage"+count+"' title='Please fill out this field' placeholder='Enter the Employee percentage' >"
              +"</div> </div></div>"
		   +"<div class='form-group'>"
            +"<label class='col-md-4 control-label' for='name' id='name-label'>Year of completion </label> "
            +"<div class='col-md-4'><div class='Form control'>"
                +"<input  name='completionyear"+count+"' class='form-control' type='text' id='completionyear"+count+"' title='Please fill out this field' placeholder='Enter the Employee passed out year' >"
              +"</div> </div></div></div>").appendTo("#TextBoxesGroup");
			  count=count+1;
			  assign(count);


});

 $("#removeButton").click(function () {
 
 console.log(count);  
	 if(count==2){ 
       alert("No more Education detail div to remove"); 
         return false;
      }    
        
	  count=count-1; 
			
       $("#qualificationgroup" + count).remove(); 
       assign(count);  
       
 
 });

});


</script>

 
  
   <script type="text/javascript">
 function assign(count) 
 { 
	  
	 $("#artcount").val(count-1); 
	 
	  
 } 
 </script> 

<script type="text/javascript">
function confirmActiondelete() {
	if (!confirm("Are You Sure You want to Delete?")) {
		return false;
	}
}

</script>


</body>

</html>
