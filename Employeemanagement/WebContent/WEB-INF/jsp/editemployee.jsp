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
      <form:form method="post" action="saveemployee" modelAttribute="editemp" class="well form-horizontal" id="survey-form" onsubmit="return FormValidation();">
     
          <div class="form-group">
            <!-- <label class="col-md-4 control-label" for="name" id="name-label">Employee Id <span style="color:red;">*</span></label> -->  
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
              </div>
             </div>
          </div>
		  
		  <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Last Name <span style="color:red;">*</span></label>  
            <div class="col-md-4">
              <div class="Form control">
                <form:input  path="last_name" class="form-control"  id="lastname" title="Please fill out this field" placeholder="Enter the Employee last name" onchange="return FormValidation();" onblur="return FormValidation();"/>
              </div>
             </div>
          </div>
		  
		   <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Date of join <span style="color:red;">*</span></label>  
            <div class="col-md-4">
              <div class="Form control">
               <form:input  path="dateofjoin"  class="datepicker-here datepicker-promo form-control" id="joindate" title="Please Enter the joined date" placeholder="Enter the Employee Joined date" required="required"/> 
              
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
              <form:select path="department" class="form-control" id="department" style="width:160px;" required="required" onchange="checkdep();">
               <form:option value="select" selected="selected"  disabled="true" >Select Option</form:option>
              	  <form:option value="Testing">Testing </form:option>
                  <form:option value="Development">Development</form:option>
                  <form:option value="Analysis">Analysis</form:option>
              
              </form:select>
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
		  <!-- <i class="fa fa-plus" aria-hidden="true" value='Add TextArea' id='addButton' title="Add Text Area" style="margin-left: 30%;"></i>
		   <i class="fa fa-times" aria-hidden="true"  value='Remove TextArea' id='removeButton' title="Remove Text Area"></i> -->
		 <div id="TextBoxesGroup"> 
		 <c:forEach var="qualilist" items="${editemp.eduqualification}">
		  <div class="" id="qualificationgroup1" style="border:1px solid #cfcdd3;width:70%;margin-left:10%;margin-bottom:5%">
		  <div class="form-group"> 
            <label class="col-md-4 control-label">Qualification </label>
            <div class="col-md-2">
              <div class="form control">
               <select class="form-control" id="qualification1" name="qualification1" style="width:160px;" >
                  <option value="Select" selected="selected" disabled>Select Option</option>
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
                <input  name="college1" class="form-control" value="${qualilist.college}" onchange="return checkcollege(this.id);"  type="text" id="college1" title="Please fill out this field" placeholder="Enter the Employee University/college" >
              </div>
             </div>
          </div>
		  
		   <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Percentage %</label>  
            <div class="col-md-4">
              <div class="Form control">
                <input  name="percentage1" class="form-control" value="${qualilist.percentage}"  type="text" id="percentage1" onchange="return checkpercentage(this.id);" title="Please fill out this field" placeholder="Enter the Employee percentage" >
              </div>
             </div>
          </div>
		  
		   <div class="form-group">
            <label class="col-md-4 control-label" for="name" id="name-label">Year of completion </label>  
            <div class="col-md-4">
              <div class="Form control">
                <input  name="completionyear1" class="form-control" value="${qualilist.completionyear}" onchange="return checkyear(this.id);"  type="text" id="completionyear1" title="Please fill out this field" placeholder="Enter the Employee passed out year" >
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
</body>
</html>