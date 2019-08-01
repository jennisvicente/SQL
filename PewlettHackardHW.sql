SELECT empl_no, birth_date, first_name, last_name, gender
from employees 
INNER JOIN salaries ON emp_no = emp_no
