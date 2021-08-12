-- Deliverable 1

-- The Number of Retiring Employees by Title
SELECT e.emp_no,
       e.first_name,
       e.last_name,
       ti.title,
       ti.from_date,
       ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

-- Retrieve/Drop Table
SELECT * FROM retirement_titles
DROP TABLE retirement_titles

-- Remove duplicate rows using Distinct with Orderby
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

-- Retrieve/Drop Table
SELECT * FROM unique_titles
DROP TABLE unique_titles

-- Retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT(ut.emp_no), 
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

-- Retrieve/Drop Table
SELECT * FROM retiring_titles
DROP TABLE retiring_titles

-- Table does not come out right
-- Need to ask for help
	