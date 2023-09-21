--1. List the employee number, last name, first name, sex, and salary of each employee.
select * from employees;
SELECT e.emp_no, e.emp_last_name, e.emp_first_name, e.emp_sex, s.salaries_salary 
FROM employees e
INNER JOIN salaries s
ON s.salaries_emp_no = e.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp_first_name, emp_last_name, emp_hire_date AS "hire_date" FROM employees WHERE date_part('year', emp_hire_date) = 1986;

--3. List the manager of each department along with their department number, department name,
--   employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.emp_last_name, e.emp_first_name
FROM employees e
INNER JOIN dept_manager dm
ON dm.dept_manager_emp_no = e.emp_no
INNER JOIN departments d
ON dm.dept_manager_dept_no = d.dept_no;

--4. List the department number for each employee along with that employee’s 
--   employee number, last name, first name, and department name.
SELECT d.dept_no, e.emp_no, e.emp_last_name, e.emp_first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON de.dept_emp_emp_no = e.emp_no
INNER JOIN departments d
ON de.dept_emp_dept_no = d.dept_no;

--5. List the first name, last name, and sex of each employee whose first name is Hercules 
--   and whose last name begins with the letter B.
SELECT emp_first_name, emp_last_name, emp_sex FROM employees WHERE emp_first_name = 'Hercules' AND emp_last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, last name, 
--   and first name.
SELECT emp_no, emp_last_name, emp_first_name
FROM employees
WHERE emp_no IN
(
  SELECT dept_emp_emp_no
  FROM dept_emp
  WHERE dept_emp_dept_no IN
  (
    SELECT dept_no
    FROM departments
    WHERE dept_name = 'Sales'
  )
);

-- 7. List each employee in the Sales and Development departments, including their
--    employee number, last name, first name, and department name.
SELECT e.emp_no, e.emp_last_name, e.emp_first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON de.dept_emp_emp_no = e.emp_no
INNER JOIN departments d
ON de.dept_emp_dept_no = d.dept_no
WHERE d.dept_name ='Sales' OR d.dept_name = 'Development'

--8. List the frequency counts, in descending order, of all the employee last names 
--   (that is, how many employees share each last name).
SELECT emp_last_name, COUNT(emp_last_name) AS "frequency_counts_last_name"
FROM employees
GROUP BY emp_last_name
ORDER BY "frequency_counts_last_name" DESC;
