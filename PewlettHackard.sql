--1. Show employees info and salary

SELECT * 
FROM employees;

SELECT *
FROM salaries;

SELECT employees.first_name, employees.last_name, 
employees.birth_date, employees.gender, salaries.salary
			FROM employees
INNER JOIN salaries ON
employees.emp_no=salaries.emp_no

--2.employees hired on 1986
SELECT employees.first_name, employees.last_name
FROM employees
WHERE
  hire_date LIKE '%/86'
  
 --3. List the manager of each department with the following information: department number, 
 --department name, the manager's employee number, last name, first name, and start and 
 --end employment dates.
CREATE TABLE Manager_info as SELECT employees.emp_no, 
employees.first_name, employees.last_name, 
departments.dept_name, dept_manager.dept_no,
dept_manager.from_date, dept_manager.to_date
FROM employees
INNER JOIN dept_manager ON employees.emp_no=dept_manager.emp_no
INNER JOIN departments on departments.dept_no=dept_manager.dept_no

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
CREATE TABLE Employee_info as SELECT employees.emp_no, 
employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments on departments.dept_no=dept_emp.dept_no


 --5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name
FROM employees
WHERE employees.first_name = 'Hercules' and employees.last_name like 'B%'

--6. List all employees in the Sales department, including their employee number,
--last name, first name, and department name.
SELECT * FROM Employee_info
WHERE Employee_info.dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including
-- their employee number, last name, first name, and department name.
SELECT * FROM Employee_info
WHERE Employee_info.dept_name = 'Sales' OR 'Development'

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT employees.last_name,
COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
