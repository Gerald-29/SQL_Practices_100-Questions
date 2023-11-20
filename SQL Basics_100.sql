CREATE SCHEMA employee;

create table employee.emp_details(
sl_no int NOT NULL,
emp_id int NOT NULL,
job_name varchar(255),
manager_id int NOT NULL,
hire_date date,
salary int NOT NULL,
commission int,
dep_id int  NOT NULL,
PRIMARY KEY(emp_id)
)

SET search_path = employee, public;

SELECT * FROM employee.emp_details;

ALTER TABLE employee.emp_details
ADD emp_name VARCHAR(255);

-- Insert data into the employee.emp_details table
INSERT INTO employee.emp_details (sl_no, emp_id, emp_name, job_name, manager_id, hire_date, salary, commission, dep_id)
VALUES
   (1, 68319, 'KAYLING', 'PRESIDENT', 68319, '1991-11-18', 6000, 0, 1001),
   (2, 66928, 'BLAZE', 'MANAGER', 68319, '1991-05-01', 2750, 0, 3001),
   (3, 67832, 'CLARE', 'MANAGER', 68319, '1991-06-09', 2550, 0, 1001),
   (4, 65646, 'JONAS', 'MANAGER', 68319, '1991-04-02', 2957, 0, 2001),
   (5, 67858, 'SCARLET', 'ANALYST', 65646, '1997-04-19', 3100, 0, 2001),
   (6, 69062, 'FRANK', 'ANALYST', 65646, '1991-12-03', 3100, 0, 2001),
   (7, 63679, 'SANDRINE', 'CLERK', 69062, '1990-12-18', 900, 0, 2001),
   (8, 64989, 'ADELYN', 'SALESMAN', 66928, '1991-02-20', 1700, 400, 3001),
   (9, 65271, 'WADE', 'SALESMAN', 66928, '1991-02-22', 1350, 600, 3001),
   (10, 66564, 'MADDEN', 'SALESMAN', 66928, '1991-09-28', 1350, 1500, 3001),
   (11, 68454, 'TUCKER', 'SALESMAN', 66928, '1991-09-08', 1600, 0, 3001),
   (12, 68736, 'ADNRES', 'CLERK', 67858, '1997-05-23', 1200, 0, 2001),
   (13, 69000, 'JULIUS', 'CLERK', 66928, '1991-12-03', 1050, 0, 3001),
   (14, 69324, 'MARKER', 'CLERK', 67832, '1992-01-23', 1400, 0, 1001);

  
 --1. From the following table return complete information about the employees
 SELECT * FROM employee.emp_details;

--2. From the following table, write a SQL query to find the salaries of all employees. Return salary.
 SELECT salary FROM emp_details;

--3. From the following table, write a SQL query to find the unique designations of the employees. Return job name.
 SELECT DISTINCT job_name FROM employee.emp_details;

--4. From the following table, write a SQL query to list the employees’ name, increased their salary by 15%, and expressed as number of Dollars.
 SELECT emp_name, CONCAT('$',(salary *1.15)) AS salary_hike
 FROM emp_details;

--5. From the following table, write a SQL query to list the employee's name and job name as a format of "Employee & Job"
SELECT CONCAT(emp_name,'  &   ', job_name) AS "Employee & Job"
FROM emp_details;

--6. Write a query in SQL to produce the output of employees as follows.
Employee
JONAS(manager)

SELECT emp_name || ' ('||  lower(job_name)  ||')' AS Employee
FROM emp_details;


--7.  From the following table, write a SQL query to find those employees with hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date.
SELECT emp_ID, emp_name, salary, TO_CHAR(hire_date,'MONTH DD, YYYY') AS Formatted_Hire_Date FROM emp_details;

--8. From the following table, write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length.
--SELECT emp_name, CHAR_LENGTH(emp_name) AS EmpName_Length_1 from emp_details;

SELECT emp_name, LENGTH(trim(emp_name)) AS EmpName_Length from emp_details;

--9.  write a SQL query to find the employee ID, salary, and commission of all the employees.
SELECT emp_ID, salary, commission FROM emp_details;

--10. write a SQL query to find the unique department with jobs. Return department ID, Job name.
SELECT DISTINCT dep_ID, job_name FROM emp_details;

--11. write a SQL query to find those employees who do not belong to the department 2001. Return complete information about the employees.
SELECT emp_id, emp_name, job_name, manager_id, hire_date, salary, commission, dep_id FROM emp_details
WHERE dep_id NOT IN (2001);

--12. Write a SQL query to find those employees who joined before 1991. Return complete information about the employees
SELECT emp_name, job_name, hire_date FROM emp_details
WHERE hire_date < '1991-01-01';

--13. Write a SQL query to calculate the average salary of employees who work as analysts. Return average salary.
SELECT AVG(salary) FROM emp_details
WHERE job_name = 'ANALYST';

--14. Write a SQL query to find the details of the employee ‘BLAZE’.
SELECT * FROM emp_details
WHERE emp_name = 'BLAZE';

--15. Write a SQL query to identify employees whose commissions exceed their salaries. Return complete information about the employees.
SELECT * FROM emp_details
WHERE salary < commission;

--16. Write a SQL query to identify those employees whose salaries exceed 3000 after receiving a 25% salary increase. Return complete information about the employees.
SELECT * FROM emp_details
WHERE (1.25*SALARY) > 3000;

--17. Write a SQL query to find the names of the employees whose length is six. Return employee name.
SELECT emp_name FROM emp_details
WHERE CHAR_LENGTH(emp_name) = 6;

--18. Write a SQL query to find out which employees joined in the month of January. Return complete information about the employees.
SELECT * FROM emp_details
WHERE TO_CHAR(hire_date, 'Mon')='Jan';

--19. Write a SQL query to separate the names of employees and their managers by the string 'works for'
Sample Output: BLAZE works for KAYLING

SELECT e.emp_name ||' works for '|| m.emp_name FROM emp_details e, emp_details m
WHERE e.manager_id = m.emp_id; --employee_id is higher because many employees will report to manager.


--20. Write a SQL query to find those employees whose designation is ‘CLERK’. Return complete information about the employees.
SELECT * FROM emp_details
WHERE job_name = 'CLERK';

--21. Write a SQL query to identify employees with more than 32 years of experience. Return complete information about the employees.
SELECT * FROM emp_details
WHERE DATE_PART('year',current_date) - DATE_PART('year',hire_date)>32;

--22.Write a SQL query to find the employee whose designation is ‘ANALYST’. Return employee name, job name and salary.
SELECT emp_name, job_name, salary FROM emp_details
WHERE job_name = 'ANALYST';

--23. Write a SQL query to find those employees whose salaries are less than 3500. Return complete information about the employees.
SELECT * FROM emp_details
WHERE salary < '3500';

--24. Write a SQL query to identify those employees who joined the company in 1991. Return complete information about the employees.
SELECT * FROM emp_details
WHERE DATE_PART('year',hire_date)= '1991';

--25. Write a SQL query to find those employees who joined before 1st April 1991. Return employee ID, employee name, hire date and salary.
SELECT emp_ID, emp_name, hire_date, salary FROM emp_details
WHERE hire_date < '1991-04-02';

--26.Write a SQL query identify the employees who do not report to a manager. Return employee name, job name.
SELECT emp_name, job_name FROM emp_details
WHERE manager_id = emp_id;

--27. Wite a SQL query to find the employees who joined on the 1st of May 1991. Return complete information about the employees.
SELECT * FROM emp_details
WHERE hire_date = '1991-05-01';

--28. Write a SQL query to identify the experience of the employees who work under the manager whose ID number is 68319. Return employee ID, employee name, salary, experience.
SELECT emp_id, emp_name, salary, DATE_PART('year',current_date) - DATE_PART('year',hire_date) AS work_experience FROM emp_details;

--29. Write a SQL query to find out which employees earn more than 100 per day as a salary. Return employee ID, employee name, salary, and experience.
SELECT emp_id, emp_name, salary/30 AS per_day_salary, DATE_PART('year',current_date) - DATE_PART('year',hire_date) AS work_experience FROM emp_details
WHERE(salary/30)>'100';

--30. Write a SQL query to identify those employees who retired after 31-Dec-99, completing eight years of service. Return employee name.
SELECT emp_name, hire_date FROM emp_details
WHERE DATE_PART('year',current_date) - DATE_PART('year',hire_date)>8;

--31. Write a SQL query to identify the employees whose salaries are odd. Return complete information about the employees.
SELECT * FROM emp_details
WHERE (salary%2) = 1;

--32. Write a SQL query to identify employees whose salaries contain only three digits. Return complete information about the employees.
SELECT * FROM emp_details
WHERE (salary)>'99';

--33. Write a SQL query to find those employees who joined in the month of APRIL. Return complete information about the employees.
SELECT * FROM emp_details
WHERE TO_CHAR(hire_date,'Mon')='Apr';

--34. Write a SQL query to find out which employees joined the company before the 19th of the month. Return complete information about the employees.
SELECT * FROM emp_details
WHERE TO_CHAR(hire_date,'DD')<'19';

--35. Write a SQL query to identify those employees who have been working as a SALESMAN and month portion of the experience 
--is more than 10. Return complete information about the employees.

SELECT emp_name, AGE(CURRENT_DATE, hire_date) AS age
FROM emp_details
WHERE DATE_PART('month', AGE(CURRENT_DATE, hire_date)) > 10;

--36. Write a SQL query to find those employees of department id 3001 or 1001 and joined in the year 1991. Return complete information about the employees

SELECT * FROM emp_details
WHERE DATE_PART('year',hire_date)='1991'
	AND(dep_id =3001 OR dep_id =1001);
	

--37. Write a SQL query to find the employees who are working for the department ID 1001 or 2001. Return complete information about the employees.
SELECT * FROM emp_details
WHERE (dep_id = 1001 OR dep_id = 2001);

--38. write a SQL query to find those employees whose designation is ‘CLERK’ and work in the department ID 2001.Return complete data
SELECT * FROM emp_details
WHERE job_name = 'CLERK'
	AND (dep_id='2001');
	
--39. Write a query in SQL to find those employees where -
--[A]. the employees receive some commission which should not be more than the salary and annual salary including commission is below 34000.
--[B]. Designation is ‘SALESMAN’ and working in the department ‘3001’. Return employee ID, employee name, salary and job name.

SELECT emp_ID, emp_name, salary, job_name FROM emp_details
WHERE 12*(salary+commission)<34000
	AND commission is NOT NULL
	AND commission<salary
	AND job_name = 'SALESMAN'
	AND dep_id = '3001';

--40. Write a SQL query to find those employees who are either CLERK or MANAGER. Return complete information about the employees.
--TYPE =1
SELECT * FROM emp_details
WHERE job_name = 'CLERK' OR job_name = 'MANAGER';

--TYPE =2
SELECT * FROM emp_details
WHERE job_name IN('CLERK','MANAGER');

--41. Write a SQL query to identify those employees who joined in any month other than February. Return complete information about the employees
SELECT * FROM emp_details
WHERE DATE_PART('Month',hire_date)<>'2';

--42. Write a SQL query to find those employees who joined in the year 1991. Return complete information about the employees.
SELECT * FROM emp_details
WHERE TO_CHAR(hire_date,'YYYY')='1991';

--43. Write a SQL query to identify the employees who joined the company in June 1991. Return complete information about the employees.
SELECT * FROM emp_details
WHERE TO_CHAR(hire_date,'mon-yyyy')='jun-1991';

--44. Write a SQL query to search for all employees with an annual salary between 24000 and 50000 (Begin and end values are included.). Return complete information about the employees.
SELECT * FROM emp_details
WHERE 12*(salary) BETWEEN '24000' AND '50000';

--45. Write a SQL query to identify all employees who joined the company on 1st May, 20th February, and 3rd December 1991. Return complete information about the employees.
SELECT * FROM emp_details
WHERE TO_CHAR(hire_date,'DD-MON-YY') IN ('01-MAY-91','20-FEB-91','03-DEC-91');

--46. Write a SQL query to find out which employees are working under the managers 63679, 68319, 66564, or 69000. Return complete information about the employees.
SELECT * FROM emp_details
WHERE manager_id IN (63679, 68319, 66564, 69000);

--47. Write a SQL query to find which employees joined the company after the month of June in 1991 and within this year. Return complete information about the employees.
SELECT * FROM emp_details
WHERE hire_date BETWEEN '01-JUNE-1991' AND '31-DEC-1991';

--48. Write a SQL query to find those employees who joined in 90's. Return complete information about the employees.
SELECT * FROM emp_details
WHERE hire_date BETWEEN '01-JAN-1990' AND '31-DEC-1999';
										 
--49.Write a SQL query to find those managers who are in the department 1001 or 2001. Return complete information about the employees.
SELECT * FROM emp_details
WHERE job_name = 'MANAGER'
	AND (dep_id = 1001 OR dep_id = 2001);

--50. write a SQL query to identify employees who joined in the month of FEBRUARY with a salary range of 1001 to 2000
--(Begin and end values are included.). Return complete information about the employees.)
SELECT * FROM emp_details
WHERE TO_CHAR(hire_date,'MON')='FEB'
	AND(salary) BETWEEN '1001' AND '2000';
	
--51. Write a SQL query to find those employees who joined before or after the year 1991.
--Return complete information about the employees.
SELECT * FROM emp_details
WHERE TO_CHAR(hire_date,'YYYY') NOT IN ('1991');


-- Create a table to store department information
create table employee.dept(
sl_no int NOT NULL,
dep_id int NOT NULL,
dep_name varchar(255),
dep_location varchar(255),
PRIMARY KEY(dep_id)
)

-- Insert data into the department table
INSERT INTO employee.dept(sl_no, dep_id, dep_name, dep_location)
VALUES
  	(01, 1001, 'FINANCE', 'SYDNEY'),
    (02, 2001, 'AUDIT', 'MELBOURNE'),
    (03, 3001, 'MARKETING', 'PERTH'),
    (04, 4001, 'PRODUCTION', 'BRISBANE');

-- Create a table to store grade information
CREATE TABLE employee.salary_grade(
    grade INT,
    min_sal INT,
    max_sal INT
);

-- Insert data into the salary_grade table
INSERT INTO salary_grade (grade, min_sal, max_sal)
VALUES
    (1, 800, 1300),
    (2, 1301, 1500),
    (3, 1501, 2100),
    (4, 2101, 3100),
    (5, 3101, 9999);

SELECT * FROM salary_grade;

SET search_path = employee, public;

--52. to find employees along with their department details.
--Return employee ID, employee name, job name, manager ID, hire date, salary, commission, department ID, and department name.
SELECT e.emp_id, e.emp_name, e.job_name, e.manager_id, e.hire_date, e.salary, e.commission, e.dep_id, d.dep_name
	FROM emp_details e, 
WHERE e.dep_id = d.dep_id;


--53. Identify those employees who earn 60000 or more per year or do not work as ANALYST.
-- Return employee name, job name, (12*salary) as Annual Salary, department ID, and grade.
SELECT e.emp_name, e.job_name, e.dep_id, d.dep_name, s.grade, (12*e.salary) "Annual Salary"
	FROM emp_details e, dept d, salary_grade s
WHERE e.dep_id = d.dep_id
AND e.salary BETWEEN s.min_sal AND s.max_sal
AND (((12*e.salary)>= '60000')
	OR e.job_name!='ANALYST');

	
--54.To identify employees whose salaries are higher than their managers' salaries.
--Return employee name, job name, manager ID, salary, manager name, manager's salary.
SELECT e.emp_name, e.job_name,e.manager_id, e.salary "Emp_salary",m.emp_name "Manager_name", m.salary "Manager_salary", m.emp_ID "Manager_ID"
	FROM emp_details e, emp_details m
WHERE e.manager_id = m.emp_ID
	AND e.salary > m.salary;
	
--55.To find those employees whose salary is between 2000 and 5000 (Begin and end values are included.) and location is PERTH.
-- Return employee name, department ID, salary, and commission.
SELECT e.emp_name, e.dep_id, e.salary, e.commission, m.dep_id, m.dep_location, m.dep_name
	FROM emp_details e, dept m
WHERE e.dep_id = m.dep_id
	AND e.salary BETWEEN '2000' AND '5000'
	AND m.dep_location ='PERTH';
	
--56.to find the employees whose department ID is 1001 or 3001 and whose salary grade is not 4.
--They joined the company before 1992-12-31. Return grade, employee name.
SELECT e.emp_name, s.grade, e.dep_id
	FROM emp_details e, salary_grade s
WHERE e.dep_id IN ('1001','3001')
	AND hire_date <	('1992-12-31')
	AND(e.salary BETWEEN s.min_sal AND s.max_sal
	AND s.grade!='4');
	
--57. to find those employees whose manager name is JONAS.
--Return employee id, employee name, job name, manager ID, hire date, salary, department ID, employee name.
SELECT e.emp_id, e.emp_name, e.job_name, e.manager_id, e.hire_date, e.salary, e.dep_id, m.emp_name "Mgr_name"
	FROM emp_details e, emp_details m
WHERE e.manager_id = m.emp_id
	AND m.emp_name = 'JONAS';
	
--58. To find the name and salary of the employee FRANK.
--Salary should be equal to the maximum salary within his or her salary group
SELECT e.emp_name, e.salary FROM emp_details e, salary_grade s
WHERE e.emp_name = 'FRANK'
	AND(e.salary BETWEEN s.min_sal AND s.max_sal
		AND e.salary = s.max_sal);

--59. Search for employees who are working either as a MANAGER or an ANALYST with a salary between 2000 and 5000 (Begin and end values are included.) without commissions.
-- Return complete information about the employees.
SELECT * FROM emp_details
--"IN" operator is used to specify a range of values, and you should provide a list of values enclosed in parentheses.
WHERE job_name IN ('MANAGER','ANALYST')
	AND salary BETWEEN '2000' AND '5000';
	
--60. search for employees working in PERTH or MELBOURNE and month part of their achieved experience is more than 10.
-- Return employee ID, employee name, department ID, salary, and department location.
SELECT e.emp_id, e.emp_name, e.dep_id, e.salary, d.dep_location
	FROM emp_details e, dept d
WHERE e.dep_id = d.dep_id
	AND d.dep_location IN ('PERTH','MELBOURNE')
	AND DATE_PART('month',AGE(CURRENT_DATE, hire_date)) > '10';
	
--61. write a SQL query to find the employees who joined in 1991 and whose department location is SYDNEY or MELBOURNE with a salary range of 2000 to 5000
--Return employee ID, employee name, department ID, salary, and department location.
SELECT e.emp_id, e.emp_name, e.dep_id, e.salary, d.dep_location
	FROM emp_details e, dept d
WHERE e.dep_id = d.dep_id
	AND TO_CHAR(hire_date,'YYYY')='1991'
	AND ((d.dep_location IN ('SYDNEY', 'MELBOURNE')
		  AND e.salary BETWEEN '2000' AND '5000'));
		  
--62. To find the employees of MARKETING department come from MELBOURNE or PERTH, are in grades 3 ,4, and 5 and have at least 25 years of experience
--Return department ID, employee ID, employee name, salary, department name, department location and grade.
SELECT e.emp_id, e.emp_name, e.dep_id, e.salary, d.dep_location,d.dep_name,d.dep_id,s.grade
	FROM emp_details e, dept d, salary_grade s
WHERE e.dep_id = d.dep_id
	AND (d.dep_name = 'MARKETING'
	AND d.dep_location IN ('MELBOURNE','PERTH'))
	AND e.salary BETWEEN s.min_sal AND s.max_sal
  	AND s.grade IN (3,4,5)
  	AND EXTRACT(YEAR
              FROM age(CURRENT_DATE, hire_date)) > 25;
			  
--63.To find those employees who are senior to their manager. Return complete information about the employees.
SELECT * FROM emp_details e, emp_details m
WHERE e.manager_id = m.emp_id
	AND e.hire_date < m.hire_date;
	
--64. To determine which employees have a grade of 4 and a salary between the minimum and maximum.
-- Return all information of each employees and their grade and salary related details.
SELECT * FROM emp_details e, salary_grade s
WHERE e.salary BETWEEN s.min_sal AND s.max_sal
	AND s.grade = '4';
	
--65. to find those employees who joined after 1991, excluding MARKER or ADELYN in the departments PRODUCTION or AUDIT.
-- Return employee name.
SELECT e.emp_name, d.dep_name,e.hire_date FROM emp_details e, dept d
WHERE e.dep_id = d.dep_id
	AND d.dep_name IN ('PRODUCTION','AUDIT')
	AND e.emp_name NOT IN ('MARKER','ADELYN')
	AND TO_CHAR(hire_date,'YYYY')>'1991';
	
--66. to find the employees and their salaries. Sort the result-set in ascending order by salaries.
-- Return complete information about the employees.
SELECT * FROM emp_details
ORDER BY salary ASC;

--67.to list employees in ascending order on department ID and descending order on jobs. RCI
SELECT * FROM emp_details
ORDER BY dep_id ASC,job_name DESC;

--68.to sort the unique jobs in descending order. Return job name.
SELECT DISTINCT job_name FROM emp_details
ORDER BY job_name DESC;

--69. to rank the employees according to their annual salary in ascending order.
-- Return employee ID, employee name, monthly salary, salary/30 as Daily_Salary, and 12*salary as Anual_Salary.
SELECT emp_ID, emp_name, salary AS Monthly_Salary, salary/30 AS Daily_Salary, 12*salary AS Annual_Salary
	FROM emp_details
ORDER BY Annual_Salary ASC;

--70.Find those employees who are either 'CLERK' or 'ANALYST’. Sort the result set in descending order on job_name. RCI
SELECT * FROM emp_details
WHERE job_name IN ('CLERK','ANALYST')
ORDER BY job_name DESC;

--71. to find the department location of employee ‘CLARE’. Return department location.
SELECT e.emp_name, d.dep_location FROM emp_details e, dept d
WHERE e.dep_id = d.dep_id
AND e.emp_name = 'CLARE';

--72. to find those employees who joined on 1-MAY-91, or 3-DEC-91, or 19-JAN-90. 
-- Sort the result-set in ascending order by hire date. Return complete information about the employees.
SELECT * FROM emp_details
WHERE hire_date IN ('01-MAY-1991','03-DEC-1991','19-JAN-1990')
ORDER BY hire_date ASC;

--73. to find those employees who earn less than 1000. Sort the result-set in ascending order by salary. RCI
SELECT * FROM emp_details
WHERE salary < '1000'
ORDER BY salary ASC;

--74. SQL query to list the employees in ascending order based on salary. RCI
SELECT * FROM emp_details
ORDER BY salary ASC;

--75. SQL query to list the employees in the ascending order by job title and in descending order by employee ID. RCI
SELECT * FROM emp_details
ORDER BY job_name ASC, emp_name DESC;

--76. SQL query to list the unique jobs of department 2001 and 3001 in descending order. Return job name.
SELECT DISTINCT job_name FROM emp_details
WHERE dep_id IN ('2001','3001');

--77. to list all the employees except the PRESIDENT and the MANAGER in ascending order of salaries. RCI
SELECT * FROM emp_details
WHERE job_name NOT IN ('PRESIDENT','MANAGER')
ORDER BY salary ASC;

--78. to find the employees whose annual salary is less than $25,000 per year.
-- Sort the result in ascending order of the salary. RCI
SELECT * FROM emp_details
WHERE (12*salary< 25000)
ORDER BY salary ASC;

--79. to list the employees who works as a SALESMAN. Sort the result set in ascending order of annual salary.
--Return employee id, name, annual salary, daily salary of all the employees.
SELECT emp_id, emp_name, salary, salary/30 Daily_salary, 12*salary Annual_salary FROM emp_details
WHERE job_name = 'SALESMAN'
ORDER BY Annual_salary ASC;

--80. To list the employee ID, name, hire date, current date and experience of the employees in ascending order on their experiences.
SELECT emp_id, emp_name, hire_date, current_date, AGE(current_date,hire_date) experience  FROM emp_details
ORDER BY experience ASC; 

--81. Write a SQL query to list the employees in ascending order of designations of those joined after the second half of 1991.
SELECT emp_id, emp_name, job_name, hire_date FROM emp_details
WHERE hire_date > ('1991-06-30')
AND DATE_PART('YEAR',hire_date)='1991'
ORDER BY job_name ASC;

--82. find the location of all the employees working in the FINANCE or AUDIT department.
--Sort the result-set in ascending order by department ID. RCI
SELECT * FROM emp_details e, dept d
WHERE e.dep_id = d.dep_id
	AND d.dep_name IN ('FINANCE','AUDIT')
	ORDER BY d.dep_id ASC;

--ALTERNATE METHOD
--SELECT *FROM employees e, department d
--WHERE (dep_name = 'FINANCE' OR dep_name ='AUDIT')
--		AND e.dep_id = d.dep_id
--		ORDER BY e.dep_id ASC;

--83. to find the employees along with grades in ascending order. RCI
SELECT * FROM emp_details e, salary_grade s, dept d
WHERE e.dep_id = d.dep_id
AND e.salary BETWEEN s.min_sal AND s.max_sal
ORDER BY s.grade ASC;

--84.To find the employees according to the department in ascending order.
--Return name, job name, department, salary, and grade.
SELECT e.emp_name, e.job_name, e.dep_id, e.salary, d.dep_name, s.grade FROM emp_details e, dept d, salary_grade s
WHERE e.dep_id = d.dep_id
AND e.salary BETWEEN s.min_sal AND s.max_sal
ORDER BY s.grade ASC;

--85. to select all employees except CLERK and sort the results in descending order by salary.
--Return employee name, job name, salary, grade and department name.
SELECT e.emp_name, e.job_name, e.dep_id, e.salary, d.dep_name, s.grade FROM emp_details e, dept d, salary_grade s
WHERE e.dep_id = d.dep_id
AND e.salary BETWEEN s.min_sal AND s.max_sal
AND e.job_name NOT IN ('CLERK')
ORDER BY e.salary DESC;

--86. to find those employees who work in the department 1001 or 2001.
--Return employee ID, name, salary, department, grade, experience, and annual salary.
SELECT e.emp_id, e.emp_name, e.job_name, e.dep_id, 12*e.salary annual_sal, AGE(current_date,hire_date) experience, d.dep_name, s.grade
	FROM emp_details e, dept d, salary_grade s
WHERE e.dep_id = d.dep_id
AND e.salary BETWEEN s.min_sal AND s.max_sal
AND d.dep_id IN ('1001','2001');

--87. to list the details of the employees along with the details of their departments.
SELECT * FROM emp_details e, dept d, salary_grade s
WHERE e.dep_id = d.dep_id
AND e.salary BETWEEN s.min_sal AND s.max_sal;

--88. To list the employees who are senior to their MANAGERS. Return complete information about the employees.
SELECT * FROM emp_details e, emp_details m
WHERE e.manager_id = m.emp_id
AND e.hire_date > m.hire_date;

--89.  to find those employees who work in the department 1001. Sort the result-set in ascending order by salary.
-- Return employee ID, employee name, salary and department ID.
SELECT emp_name, emp_id, salary, dep_id FROM emp_details
WHERE dep_id = '1001'
ORDER BY salary ASC;

--90. write a SQL query to find the highest salary. Return highest salary.
SELECT MAX(salary) max_sal FROM emp_details;

--"ALTERNATE METHOD"
--SELECT (salary) max_sal FROM emp_details
--ORDER BY salary DESC
--LIMIT 1;

--91. To calculate the average salary and average total remuneration (salary and commission) for each type of job.
-- Return name, average salary and average total remuneration.
SELECT job_name, AVG(salary) avg_salary, AVG(salary+commission) avg_total_renumeration FROM emp_details
GROUP BY job_name;

--92.To calculate the total annual salary distributed across each job in 1991. Return job name, total annual salary.
SELECT job_name, SUM(12*salary) total_annual_salary FROM emp_details
WHERE TO_CHAR(hire_date,'YYYY')='1991'
GROUP BY job_name;

--93. To list the employee id, name, department id, location of all the employees.
SELECT e.emp_id, e.emp_name, e.dep_id, d.dep_name, d.dep_location FROM emp_details e, dept d
WHERE e.dep_id = d.dep_id;

--94. to find those employees who work in the department ID 1001 or 2001. 
-- Return employee ID, employee name, department ID, department location, and department name.
SELECT e.emp_id, e.emp_name, e.dep_id, d.dep_location, d.dep_name FROM emp_details e, dept d
WHERE e.dep_id = d.dep_id
AND e.dep_id IN ('1001','2001');

--95. to find those employees whose salary is in the range of minimum and maximum salary (Begin and end values are included.).
--Return employee ID, name, salary and grade.
SELECT e.emp_ID, e.emp_name, e.salary, s.grade FROM emp_details e, salary_grade s, dept d
WHERE e.dep_id = d.dep_id
AND e.salary BETWEEN s.min_sal AND s.max_sal
ORDER BY s.grade ASC;

--96.  to create a list of the managers and the number of employees they supervise. Sort the result set in ascending order on manager. 
--Return manager ID and number of employees under them.
SELECT e.manager_id, COUNT (e.emp_name) emp_count FROM emp_details e, emp_details m
WHERE e.manager_id = m.emp_id
GROUP BY e.manager_id;

--97. to count the number of employees in each designation of a department. Return department id, job name and number of employees.
SELECT dep_id, job_name, count(*) no_of_employees FROM emp_details
GROUP BY dep_id, job_name;

--98. To identify the departments in which at least two employees are employed. Return department id, number of employees.
SELECT dep_id, count(*) no_of_emp FROM emp_details
GROUP BY dep_id
HAVING count(*)>=2;

--99. To list the grade, number of employees, and maximum salary of each grade.
SELECT s.grade, count(*) no_of_emp, MAX(e.salary) FROM emp_details e, salary_grade s, dept d
WHERE (e.salary) BETWEEN s.min_sal AND s.max_sal
GROUP BY s.grade
ORDER BY s.grade ASC;

--100. To identify departments with at least two SALESMEN in each grade. Return department name, grade and number of employees.
SELECT d.dep_name, s.grade, count(*) no_of_emp FROM emp_details e, dept d, salary_grade s
WHERE e.dep_id = d.dep_id
AND e.job_name = 'SALESMAN'
AND e.salary BETWEEN s.min_sal AND s.max_sal
GROUP BY s.grade,d.dep_name
HAVING count(*) >= '2';

--101. To identify departments with fewer than four employees. Return department ID, number of employees.
SELECT e.dep_id, count(*) no_of_emp FROM emp_details e, dept d, salary_grade s
WHERE  e.dep_id = d.dep_id
AND e.salary BETWEEN s.min_sal AND s.max_sal
GROUP BY d.dep_name, e.dep_id
HAVING count(*)<='4';

--102. To find which departments have at least two employees. Return department name, number of employees.
SELECT d.dep_name, count(*) no_of_emp FROM emp_details e, dept d, salary_grade s
WHERE  e.dep_id = d.dep_id
AND e.salary BETWEEN s.min_sal AND s.max_sal
GROUP BY d.dep_name
HAVING count(*)>='2';

--103. To check whether the employees ID are unique or not. Return employee id, number of employees.
SELECT emp_id, count(*) no_of_emp FROM emp_details
GROUP BY emp_id;

--104. To find number of employees and average salary. Group the result set on department id and job name.
--Return number of employees, average salary, department ID, and job name.
SELECT e.dep_id, e.job_name, ROUND(AVG(e.salary),2) avg_sal FROM emp_details e
GROUP BY e.dep_id, e.job_name;

--105. To identify those employees whose names begin with 'A' and are six characters long. Return employee name.
SELECT emp_name FROM emp_details
WHERE emp_name LIKE 'A%'
AND LENGTH(emp_name) = '6';

--106. To find those employees whose name is six characters in length and the third character must be 'R'. RCI
SELECT * FROM emp_details
WHERE length(emp_name)=6
  AND emp_name LIKE '__R%';

--ALTERNATE METHOD
SELECT * FROM emp_details
WHERE SUBSTRING (emp_name,3,1) ='R'
AND LENGTH(emp_name) = '6';

--107. To find those employees whose name is six characters in length, starting with 'A' and ending with 'N'.
--Return number of employees.
SELECT * FROM emp_details
WHERE length(emp_name)=6
  AND emp_name LIKE 'A%__N';
  
--108. to find those employees who joined in the month of where the second letter is 'a'. Return number of employees.
SELECT * FROM emp_details
WHERE TO_CHAR(hire_date,'MON') LIKE '_A%';

--109. to find those employees whose names contain the character set 'AR' together. RCI.
SELECT * FROM emp_details
WHERE emp_name LIKE '%%AR%%';

--110. To find those employees who joined in 90's. Return complete information about the employees.
SELECT * FROM emp_details
WHERE TO_CHAR(hire_date,'YYYY')='1990';		

--111.To find those employees whose ID not start with the digit 68. Return employee ID, employee ID using trim function.
SELECT emp_id, trim(to_char(emp_id,'99999'))
FROM emp_details
WHERE trim(to_char(emp_id,'99999')) NOT LIKE '68%';

--ALTERNATE METHOD
SELECT * FROM emp_details
WHERE TEXT(emp_id) NOT LIKE '68%';
			  
--112. To find those employees whose names contain the letter 'A’. Return complete information about the employees.			  
SELECT * FROM emp_details			  
WHERE emp_name LIKE '%A%';			  

--113. to find those employees whose name ends with 'S' and six characters long. Return complete information about the employees
SELECT * FROM emp_details			  
WHERE emp_name LIKE '%%S'
AND LENGTH(emp_name) = '6';
			  
--114.To find those employees who joined in any month, but the month name contain the character ‘A’. RCI
SELECT * FROM emp_details
WHERE TO_CHAR(hire_date,'MONTH') LIKE '%A%';

--115.To find tho*e employees who joined in any month, but the name of the month contain the character ‘A’ in second position. RCI
SELECT * FROM emp_details
WHERE TO_CHAR(hire_date,'MONTH') LIKE '_A%';

--SUBQUERIES
--1. SQL query to find the managers. RCI
SELECT * FROM emp_details
WHERE emp_id IN
	(SELECT manager_id FROM emp_details);

--2 To compute the experience of all the managers. Return employee ID, employee name, job name, joining date, and experience.
SELECT emp_id, emp_name, job_name, hire_date, AGE(current_date,hire_date) FROM emp_details
WHERE emp_id IN 
	(SELECT manager_id FROM emp_details);

--3. to find those employees who work as 'MANAGERS' and 'ANALYST'
--	And working in ‘SYDNEY’ or ‘PERTH’ with an experience more than 5 years without receiving the commission.
--	Sort the result-set in ascending order by department location.
--  Return employee ID, employee name, salary, and department name.
SELECT e.emp_id, e.job_name,e.emp_name, e.salary, d.dep_name, d.dep_location, AGE(current_date,hire_date) work_exp
FROM emp_details e,  dept d
WHERE e.dep_id = d.dep_id
	AND e.job_name IN ('MANAGER','ANALYST') 
	AND d.dep_location IN ('SYDNEY','PERTH')
	AND (DATE_PART('year', CURRENT_DATE)-DATE_PART('year', hire_date))> '5'
	AND e.commission =0
ORDER BY d.dep_location ASC;

SELECT e.emp_id, e.emp_name, e.salary, d.dep_name
FROM emp_details e,  dept d
WHERE d.dep_location IN ('SYDNEY', 'PERTH')
  AND e.dep_id = d.dep_id
  AND e.emp_id IN
    (SELECT e.emp_id
     FROM emp_details e
     WHERE e.job_name IN ('MANAGER',
                          'ANALYST')
       AND (DATE_PART('year', CURRENT_DATE)-DATE_PART('year', hire_date))> 5
       AND e.commission = 0)
ORDER BY d.dep_location ASC;

--4. to find those employees work at SYDNEY or working in the FINANCE department with an annual salary above 28000
-- but the monthly salary should not be 3000 or 2800 and who do not work as a MANAGER and whose ID contain a digit of '3' or '7' in 3rd position.
-- Sort the result-set in ascending order by department ID and descending order by job name.
-- Return employee ID, employee name, salary, department name, department location, department ID, and job name.
SELECT e.emp_id, e.job_name,e.emp_name, e.salary, 12*e.salary annual_sal, d.dep_name, d.dep_location, e.dep_id
FROM emp_details e,  dept d
WHERE (d.dep_location = 'SYDNEY' OR d.dep_name = 'FINANCE')
AND e.dep_id = d.dep_id
AND e.emp_id IN
	(SELECT e.emp_id FROM emp_details e
		WHERE (12*e.salary)>28000
		AND e.salary NOT IN ('3000','2800')
		AND e.job_name != 'MANAGER'
		AND (TEXT(e.emp_id)) LIKE '__3%' OR (TEXT(e.emp_id)) LIKE '__7%')
		ORDER BY e.dep_id ASC, e.job_name DESC;
		
--5. to find the employees of grade 2 and 3.Return all the information of employees and salary details.
SELECT * FROM emp_details e, salary_grade s
WHERE e.salary BETWEEN s.min_sal AND s.max_sal
AND s.grade IN ('2','3');

--6. To find those employees of grade 4 or 5 and who work as ANALYST or MANAGER. Return complete information about the employees
SELECT * FROM emp_details e, salary_grade s
WHERE e.salary BETWEEN s.min_sal AND s.max_sal
AND s.grade IN ('4','5')
AND e.emp_id IN 
	(SELECT e.emp_id FROM emp_details e
	 WHERE e.job_name IN ('ANALYST','MANAGER'));
	
--ALTERNATE METHOD
SELECT * FROM emp_details e, salary_grade s
WHERE e.salary BETWEEN s.min_sal AND s.max_sal
AND s.grade IN ('4','5')
AND e.job_name IN ('ANALYST','MANAGER');

--7. to find those employees whose salary is more than the salary of JONAS. Return complete information about the employees.
SELECT * FROM emp_details 
WHERE salary >
	(SELECT salary FROM emp_details
	WHERE emp_name = 'JONAS');

--8. to find those employees who work as same designation of FRANK. Return complete information about the employees.
SELECT * FROM emp_details
WHERE job_name =
 	(SELECT job_name FROM emp_details
	WHERE emp_name = 'FRANK');

--9. to find those employees who are senior to ADELYN. Return complete information about the employees.
SELECT * FROM emp_details
WHERE hire_date <
	(SELECT hire_date FROM emp_details
	WHERE emp_name = 'ADELYN');

--10. to find those employees of department ID 2001 and whose designation is same as of the designation of department ID 1001.RCI
SELECT * FROM emp_details e, dept d
WHERE e.dep_id = d.dep_id
AND  d.dep_id = '2001' 
AND e.job_name IN
	(SELECT e.job_name FROM emp_details e, dept d
	WHERE e.dep_id = d.dep_id
	AND  d.dep_id = '1001');

--11. to find those employees whose salary is the same as the salary of FRANK or SANDRINE. Sort the result-set in descending order by salary. 
SELECT * FROM emp_details
WHERE salary IN
    (SELECT salary FROM emp_details e
     WHERE e.emp_name IN ('FRANK', 'SANDRINE'))
ORDER BY salary DESC;

--12. find those employees whose designation are the same as the designation of MARKER or salary is more than the salary of ADELYN. RCI
SELECT * FROM emp_details
WHERE job_name IN
    (SELECT job_name FROM emp_details e
     WHERE e.emp_name = 'MARKER')
	 OR salary >
    (SELECT salary FROM emp_details e
     WHERE e.emp_name = 'ADELYN');
	 
--13.  to find those employees whose salary is more than the total remuneration (salary + commission) of the designation SALESMAN. RCI
SELECT * FROM emp_details
WHERE salary >
	(SELECT max(salary+commission) FROM emp_details
	 WHERE job_name = 'SALESMAN');
	 
--75.to find the maximum average salary drawn for each job except for PRESIDENT. 
SELECT max(my_avg) FROM 
	(SELECT avg(e.salary) my_avg FROM emp_details e
	WHERE e.job_name != 'PRESIDENT'
	GROUP BY e.job_name);

--76.  write a SQL query to find those departments where no employee works. Return department ID.
SELECT d.dep_id, count(e.dep_id)
FROM dept d
LEFT OUTER JOIN emp_details e ON e.dep_id=d.dep_id
GROUP BY d.dep_id
HAVING count(e.dep_id) = 0;

--SQL [29 exercises with solution] -- JOINS

CREATE TABLE employee.sales_person (
    salesman_id INT,
    spoc_name VARCHAR(255),
    city VARCHAR(255),
    commission DECIMAL(5, 2)
);

INSERT INTO employee.sales_person (salesman_id, spoc_name, city, commission)
VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5007, 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);
	
SELECT * FROM sales_person;
	
CREATE TABLE employee.customers (
    customer_id INT,
    cust_name VARCHAR(255),
    city VARCHAR(255),
    grade INT,
    salesman_id INT,
    new_column_name VARCHAR(255) -- Add the new column here
);

ALTER TABLE customers
DROP COLUMN new_column_name;

INSERT INTO employee.customers (customer_id, cust_name, city, grade, salesman_id)
VALUES
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3008, 'Julian Green', 'London', 300, 5002),
    (3004, 'Fabian Johnson', 'Paris', 300, 5006),
    (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
    (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
    (3001, 'Brad Guzan', 'London', NULL, 5005);

SELECT * FROM customers;

--1. to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
SELECT s.spoc_name, b.cust_name, s.city FROM customers b, sales_person s
WHERE s.city = b.city;

CREATE TABLE employee.orders (
    ord_no INT,
    purch_amt DECIMAL(8, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    order_status VARCHAR(20)
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001),
    (70010, 1983.43, '2012-10-10', 3004, 5006),
    (70003, 2480.4, '2012-10-10', 3009, 5003),
    (70012, 250.45, '2012-06-27', 3008, 5002),
    (70011, 75.29, '2012-08-17', 3003, 5007),
    (70013, 3045.6, '2012-04-25', 3002, 5001);


--2. to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
SELECT o.ord_no, o.purch_amt, b.cust_name, b.city FROM orders o, customers b
WHERE b.customer_id = o.customer_id
AND o.purch_amt BETWEEN '500' AND '2000';

--3.to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.
SELECT b.cust_name, s.city,s.spoc_name, s.commission FROM customers b, sales_person s
WHERE s.salesman_id = b.salesman_id;

--4. to find salespeople who received commissions of more than 12 percent from the company.
--Return Customer Name, customer city, Salesman, commission
SELECT b.cust_name, b.city,s.spoc_name, s.commission FROM customers b
INNER JOIN sales_person s
ON s.salesman_id = b.salesman_id
AND s.commission > 0.12;

--ALTERNATIVE METHOD
SELECT b.cust_name, b.city,s.spoc_name, s.commission FROM customers b, sales_person s
WHERE s.salesman_id = b.salesman_id
AND s.commission > 0.12;

--5. To locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company.
--Return Customer Name, customer city, Salesman, salesman city, commission. 
SELECT b.cust_name, b.city,s.spoc_name, s.city, s.commission FROM customers b
INNER JOIN sales_person s
ON s.salesman_id=b.salesman_id 
WHERE s.city != b.city
AND s.commission>0.12;

--6. to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission
SELECT o.ord_no, o.ord_date, o.purch_amt, b.cust_name, b.grade, s.spoc_name sales_man, s.commission
FROM orders o
INNER JOIN customers b
ON b.customer_id = o.customer_id
INNER JOIN sales_person s
ON s.salesman_id =b.salesman_id
ORDER BY ord_no;


--7. To join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned.
SELECT * FROM orders
NATURAL JOIN customers
NATURAL JOIN sales_person;

--8.  to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id. 
SELECT b.cust_name, b.city,b.grade, s.spoc_name sales_man, s.city salesman_city
FROM customers b
LEFT JOIN sales_person s
ON b.salesman_id = s.salesman_id
ORDER BY b.customer_id ASC;


