--create a table for the departments.
CREATE TABLE departments (
	dept_no char(4) NOT NULL,
	dept_name VARCHAR(30),
	PRIMARY KEY (dept_no)
);

--create a table for the titles.
CREATE TABLE titles (
	title_id char(5) NOT NULL,
	title VARCHAR(30),
	PRIMARY KEY (title_id)
);

--create a table for the employees
CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id CHAR(5) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30) ,
	last_name VARCHAR(30),
	sex CHAR(1),
	hire_date DATE,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);


--create a table for the department managers
CREATE TABLE dept_manager(
	dept_no CHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);


--create a table for the salaries.
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);


--create a table for the dep_emp.
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no CHAR(4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


--check the tables
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM dept_emp;