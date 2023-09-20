--SQL challenge week 9
CREATE TABLE titles(
    title_id VARCHAR(5) NOT NULL PRIMARY KEY,
    title_name VARCHAR(30) NOT NULL
);

CREATE TABLE departments(
    dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE employees(
    emp_no INT NOT NULL PRIMARY KEY, 
    emp_title_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    emp_birth_date DATE,
    emp_first_name VARCHAR(20) NOT NULL,
    emp_last_name VARCHAR(20) NOT NULL,
    emp_sex VARCHAR(1),
	emp_hire_date DATE NOT NULL
);

CREATE TABLE salaries(
	salaries_emp_no INT NOT NULL,
	FOREIGN KEY (salaries_emp_no) REFERENCES employees(emp_no),
    salaries_salary FLOAT
);

--junction table dept_emp
CREATE TABLE dept_emp(
    dept_emp_emp_no INT NOT NULL,
	FOREIGN KEY (dept_emp_emp_no) REFERENCES employees(emp_no),
    dept_emp_dept_no VARCHAR(4) NOT NULL,
    FOREIGN KEY (dept_emp_dept_no) REFERENCES departments(dept_no) 	
);

--junction table dept_manager
CREATE TABLE dept_manager(
    dept_manager_dept_no VARCHAR(4) NOT NULL,
    FOREIGN KEY (dept_manager_dept_no) REFERENCES departments(dept_no),
    dept_manager_emp_no INT NOT NULL,
	FOREIGN KEY (dept_manager_emp_no) REFERENCES employees(emp_no)
);

