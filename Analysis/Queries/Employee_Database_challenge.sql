-- Find employees who are eligible for retirement (1952-1955 bday)
SELECT d.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM emp_info as d
inner join employees as e
on d.emp_no = e.emp_no
	INNER JOIN titles as t
		on d.emp_no = t.emp_no
where e.birth_date between '01-01-1952' and '12-31-1955'
order by d.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no, r.first_name, r.last_name, r.title
INTO unique_titles
FROM retirement_titles as r
ORDER BY r.emp_no

-- Create a retiring table grouping the number of employees eligible to retired by title
SELECT COUNT(rt.emp_no), de.title
into retiring_titles
FROM retirement_titles as rt
LEFT JOIN unique_titles as de
ON rt.emp_no = de.emp_no
GROUP BY de.title;

-- Find employees who are eligible for mentorship (1965 bday)
SELECT e.emp_no, e.first_name, e.last_name, e.birth_date, t.title, d.from_date, d.to_date
INTO mentorship_eligibilty
FROM employees as e
inner join titles as t
on e.emp_no = t.emp_no
	inner join dept_emp as d
		on e.emp_no = d.emp_no
where e.birth_date between '01-01-1965' and '12-31-1965'
order by e.emp_no


