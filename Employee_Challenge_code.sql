--Deliverable 1

--retirement title table
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_title
FROM employees as e 
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name,
r.title
INTO Unique_Titles
FROM retirement_title as r
ORDER BY r.emp_no, r.to_date DESC;

--retirement title count
SELECT COUNT(u.title), u.title
INTO Retiring_Titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY COUNT(u.title) DESC;

