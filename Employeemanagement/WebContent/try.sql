 SELECT qualification 
 FROM `educationqualification`
 WHERE qualificationvalue IN (SELECT MAX(qualificationvalue) FROM `educationqualification` GROUP BY qemp_id);
 
 
 
 SELECT emp_id,Qualification
 (
 SELECT emp_id,MAX(q.`qualificationvalue`),Qualification FROM employeee  e JOIN educationqualification q ON e.`emp_id`= q.qemp_id GROUP BY emp_id ,qualificationvalue
 ) AS A 
 
 SELECT  * FROM educationqualification
 SELECT * FROM employeee
 
 SELECT DISTINCT(emp_id),MAX(q.`qualificationvalue`) ,q.Qualification FROM employeee  e JOIN educationqualification q
  ON e.`emp_id`= q.qemp_id  GROUP BY emp_id HAVING qualificationvalue=MAX(q.`qualificationvalue`)
  
  SELECT E.emp_id,Q.Qualification FROM Employeee E JOIN educationqualification Q ON e.emp_id=q.qemp_id 
  WHERE Q.qualificationvalue IN  (SELECT  MAX(qualificationvalue) FROM educationqualification GROUP BY qemp_id  )  GROUP BY E.emp_id,Qualification

  SELECT emp_id, first_name,last_name,dateofjoin,Department,contact_no,email,activestatus,A.qemp_id,A.ValueQ, B.Qualification FROM (
SELECT emp_id,  first_name,last_name,dateofjoin,Department,contact_no,email,activestatus,qemp_id  , MAX(qualificationvalue) AS ValueQ FROM employeee c, educationqualification D WHERE c.emp_id=D.qemp_id  GROUP BY qemp_id 
   ) AS A JOIN educationqualification B ON A.qemp_id=B.qemp_id AND A.ValueQ=B.qualificationvalue  