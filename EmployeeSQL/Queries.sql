-- Part 3: Data Analysis
	--Once you have a complete database, do the following:
	--Confirm tables are set up:
		SELECT * FROM departments;
		SELECT * FROM dept_emp;
		SELECT * FROM dept_manager;
		SELECT * FROM employees;
		SELECT * FROM salaries;
		SELECT * FROM titles;
		
--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
INTO Query_1
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no=s.emp_no;

SELECT * FROM Query_1;

--2. List employees who were hired in 1986.

SELECT first_name, last_name, hire_date
INTO Query_2
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

SELECT * FROM Query_2;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
INTO Query_3
FROM departments AS d
INNER JOIN dept_manager AS dm
ON d.dept_no=dm.dept_no
INNER JOIN employees AS e
ON dm.emp_no=e.emp_no;

SELECT * FROM Query_3;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
INTO Query_4
FROM dept_emp AS de
INNER JOIN employees AS e
ON de.emp_no=e.emp_no
INNER JOIN departments AS d
ON de.dept_no=d.dept_no;

SELECT * FROM Query_4;

--5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
INTO Query_5
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
	--source: 
	--https://stackoverflow.com/questions/16179802/query-to-retrieve-all-people-with-a-last-name-starting-with-a-specific-letter

SELECT * FROM Query_5;

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
INTO Query_6
FROM dept_emp AS de
INNER JOIN employees AS e
ON de.emp_no=e.emp_no
INNER JOIN departments AS d
ON de.dept_no=d.dept_no
WHERE d.dept_name = 'Sales';

SELECT * FROM Query_6;

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
INTO Query_7
FROM dept_emp AS de
INNER JOIN employees AS e
ON de.emp_no=e.emp_no
INNER JOIN departments AS d
ON de.dept_no=d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

SELECT * FROM Query_7;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)
INTO Query_8
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

SELECT * FROM Query_8;