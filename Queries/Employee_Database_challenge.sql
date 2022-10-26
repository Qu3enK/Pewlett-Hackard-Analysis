-- Create Retirement Titles table for eligible retirees.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as t
	ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Obtain current title from Retirement Title table, create Unique Titles table
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

-- Number of eligible retirees by recent job titles, create Retiring Titles table
SELECT count(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC; 

-- Deliverable 2: Mentorship-Eligibility List
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentor_eligible
FROM employees as e
JOIN dept_emp as de 
	ON e.emp_no = de.emp_no
JOIN titles as t
	on e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT * 
FROM mentor_eligible;

SELECT COUNT(*) as mentor_eligible_count
FROM mentor_eligible;

-- Additional Analysis - Title impact by Department; 

-- Eligible retirees titles by Department.
SELECT d.dept_name, COUNT(ut.title) as title_count
FROM unique_titles as ut
INNER JOIN dept_emp as de
	ON de.emp_no = ut.emp_no
INNER JOIN departments as d 
	ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY title_count DESC;

--Breakdown of Title to Department impact
SELECT ut.title,
	d.dept_name, count(ut.title) as title_count
FROM unique_titles as ut
INNER JOIN dept_emp as de
	ON de.emp_no = ut.emp_no
INNER JOIN departments as d 
	ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY ut.title, d.dept_name
ORDER BY ut.title, title_count DESC;

--Analysis 2 -  Salary for Eligible Retirees 
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO sal_retiree
FROM employees as e
INNER JOIN salaries as s
	ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
	AND (de.to_date = '9999-01-01');

-- Total Salary by Title
SELECT ut.title, 
	cast(sum(sr.salary) as money) as salary_sum
INTO salary_bytitle
FROM unique_titles as ut
INNER JOIN sal_retiree as sr
	ON sr.emp_no = ut.emp_no
GROUP BY ut.title
ORDER BY salary_sum DESC;

SELECT *
FROM salary_bytitle;

SELECT sum(salary_sum) as total_salary
FROM salary_bytitle;
