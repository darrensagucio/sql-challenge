/* Question 1: List the following details of each employee: 
employee number, last name, first name, sex, and salary. */

--SELECT * FROM Employees_Info;
--SELECT * FROM  Salaries;

SELECT s.employee_id AS employee_number , ei.last_name, ei.first_name, ei.sex, s.salary 
FROM employees_info AS ei 
INNER JOIN salaries AS s ON
s.employee_id = ei.employee_id
ORDER BY s.employee_id ASC;

/* Question 2: List first name, last name, and hire date for employees who were hired in 1986. */

SELECT first_name, last_name, hire_date 
FROM employees_info
WHERE hire_date LIKE '%1986'; 

/* Question 3: List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, first name.*/

--SELECT * FROM department_managers;

SELECT dm.department_id as department_number, d.department_name, dm.employee_id as managers_employee_number,
ei.last_name, ei.first_name
FROM employees_info AS ei 
INNER JOIN department_managers as dm ON 
dm.employee_id = ei.employee_id
INNER JOIN departments as d ON
d.department_id = dm.department_id; 

/* Question 4: List the department of each employee with the following information: 
employee number, last name, first name, and department name.*/

--SELECT * FROM department_employees;

SELECT de.employee_id AS employee_number, ei.last_name, ei.first_name, d.department_name
FROM employees_info AS ei 
INNER JOIN department_employees AS de ON
de.employee_id = ei.employee_id
INNER JOIN departments AS d ON
d.department_id = de.department_id
ORDER BY employee_number; 

-- Curious If Employee ID 10010 Had Two Names... 
/* SELECT last_name, first_name 
FROM employees_info
WHERE employee_id = 10010; */ 

/* Question 5: List first name, last name, and sex for employees 
whose first name is "Hercules" and last names begin with "B.*/

SELECT first_name, last_name, sex
FROM employees_info 
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

/* Question 6: List all employees in the Sales department, 
including their employee number, last name, first name, and department name. */ 

--SELECT * FROM Departments 

SELECT de.employee_id AS employee_number, ei.last_name, ei.first_name, d.department_name 
FROM employees_info AS ei 
INNER JOIN department_employees AS de ON
de.employee_id = ei.employee_id 
INNER JOIN departments AS d ON 
d.department_id = de.department_id 
WHERE d.department_name = 'Sales'
ORDER BY employee_number; 

/* Question 7: List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name. */ 

SELECT de.employee_id AS employee_number, ei.last_name, ei.first_name, d.department_name 
FROM employees_info AS ei 
INNER JOIN department_employees AS de ON
de.employee_id = ei.employee_id 
INNER JOIN departments AS d ON 
d.department_id = de.department_id 
WHERE d.department_name = 'Sales' OR  d.department_name = 'Development'
ORDER BY employee_number; 

/*  Question 8: In descending order, list the frequency count of employee last names, i.e., 
how many employees share each last name.*/ 

--Check If Count Was Correct
/*SELECT last_name, COUNT(last_name) AS check_syang_count 
FROM employees_info
WHERE last_name = 'Syang'
GROUP BY last_name; */

-- https://stackoverflow.com/questions/7053902/sql-how-to-get-the-count-of-each-distinct-value-in-a-column

SELECT last_name, COUNT(last_name) AS shared_name_count 
FROM employees_info
GROUP BY last_name 
ORDER BY shared_name_count DESC; 
