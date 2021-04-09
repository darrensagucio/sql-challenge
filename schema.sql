DROP TABLE Departments; 
DROP TABLE Titles; 
DROP TABLE Employees_Info; 
DROP TABLE Department_Employees;
DROP TABLE Department_Managers;
DROP TABLE Salaries; 

CREATE TABLE Departments (
	serial_id SERIAL,
	department_id VARCHAR NOT NULL PRIMARY KEY,
	department_name VARCHAR NOT NULL	
); 

SELECT * FROM Departments; 

CREATE TABLE Titles (
	serial_id SERIAL,
	title_id VARCHAR NOT NULL PRIMARY KEY,
	title_name VARCHAR NOT NULL
);

SELECT * FROM Titles; 

CREATE TABLE Employees_Info (
	serial_id SERIAL, 
	employee_id INTEGER PRIMARY KEY, 
	employee_title_id VARCHAR NOT NULL, 
	birth_date VARCHAR NOT NULL, 
	first_name VARCHAR NOT NULL, 
	last_name VARCHAR NOT NULL, 
	sex VARCHAR NOT NULL, 
	hire_date VARCHAR NOT NULL,
	FOREIGN KEY (employee_title_id) REFERENCES Titles (title_id)
); 

SELECT * FROM Employees_Info; 

CREATE TABLE Department_Employees (
	serial_id SERIAL, 
	employee_id INTEGER, 
	department_id VARCHAR NOT NULL,
	PRIMARY KEY (employee_id, department_id),
	FOREIGN KEY (department_id) REFERENCES Departments (department_id),
	FOREIGN KEY (employee_id) REFERENCES Employees_Info (employee_id)
); 
 
SELECT * FROM Department_Employees; 

CREATE TABLE Department_Managers (
	serial_id SERIAL, 
	department_id VARCHAR NOT NULL,
	employee_id INTEGER, 
	PRIMARY KEY (employee_id, department_id),
	FOREIGN KEY (department_id) REFERENCES Departments (department_id),
	FOREIGN KEY (employee_id) REFERENCES Employees_Info (employee_id)
);

SELECT * FROM Department_Managers;

CREATE TABLE Salaries (
	serial_id SERIAL,
	employee_id INTEGER PRIMARY KEY, 
	salary INTEGER,
	FOREIGN KEY (employee_id) REFERENCES Employees_Info (employee_id)
);

SELECT * FROM Salaries; 