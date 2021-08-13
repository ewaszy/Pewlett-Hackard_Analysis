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

-- My table is right; example picture in instructions is wrong

-- Deliverable 2
-- Mentorship Eligibility
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    ti.title
INTO mentorship_eligibilty
FROM employees as e
Left outer Join dept_employees as de
ON (e.emp_no = de.emp_no)
Left outer Join titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibilty

-- Three additional queries 
-- Retrieve number of employees eligible for mentorship program by title
SELECT COUNT(ut.emp_no), 
ut.title
INTO mentorship_count
FROM mentorship_eligibilty as me
GROUP BY title 
ORDER BY COUNT(title) DESC;

-- Employees born in 1964 that can serve as backup mentors 
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    ti.title
INTO backup_mentors
FROM employees as e
Left outer Join dept_employees as de
ON (e.emp_no = de.emp_no)
Left outer Join titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1964-01-01' AND '1964-12-31')
ORDER BY e.emp_no;

-- Number of employees eligible to be a backup mentor by title
SELECT COUNT(bm.emp_no), 
bm.title
INTO backup_mentors_count
FROM backup_mentors as bm
GROUP BY title 
ORDER BY COUNT(title) DESC;