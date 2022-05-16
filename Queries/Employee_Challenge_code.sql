--Deliverable 1

--Join
SELECT e.emp_no, e.first_name,e.last_name,
tt.title,
tt.from_date,
tt.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS tt
ON (e.emp_no = tt.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

--View
select * from retirement_titles

--DROP IF NEEDED
DROP TABLE retirement_titles;

--DISTINCT
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;
select * from unique_titles

--Count
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;
select * from retiring_titles

--Deliverable 2
--
SELECT DISTINCT On (e.emp_no)e.emp_no,
    e.first_name,
e.last_name,
    e.birth_date,
    de.from_date,
	de.to_date,
    tt.title
INTO mentorship
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as tt
ON (e.emp_no = tt.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no ASC;
select * from mentorship

