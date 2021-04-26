-- Deliverable 1

-- Retrieve emp_no, first_name, last_name from employees
-- Retrieve title, from_date, to_date from titles
-- Create a new table with INTO clause
-- Join both tables on the PK
-- Filter on birth_date born 1952-1955, orderby emp_no
SELECT  e.emp_no,
        e.first_name,
        e.last_name,
		tl.title,
		tl.from_date,
		tl.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;		

-- count the number of entries in retirement_titles table    ans=133776
SELECT COUNT(emp_no)
FROM retirement_titles;

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title, to_date
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- count the number of entries in unique_titles table    ans=90398
SELECT COUNT(emp_no)
FROM unique_titles;

-- Double check - Group by title and count number for each from unique_titles 
SELECT title, COUNT(emp_no) AS "Total Titles"
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY "Total Titles" DESC;

SELECT SUM("Total Titles")   -- ans 90398
FROM retiring_titles



-- Deliverable 2

-- Retrieve emp_no, first_name, last_name, birth_date from employees
-- Retrieve from_date, to_date from dept_emp
-- Retrieve title from titles
-- Use Distinct ON to retrieve first emp_no
-- Create a new table with INTO clause
-- Join three tables on the PK
-- Filter on to_date and birth_date born in 1965, orderby emp_no 
SELECT DISTINCT ON(e.emp_no)
		e.emp_no,
        e.first_name,
        e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		tl.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE ((e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
     AND (tl.to_date >= '9999-01-01'))
ORDER BY e.emp_no ASC, de.to_date DESC;		

SELECT COUNT(emp_no)   -- ans 1549
FROM mentorship_eligibility

-- Deliverable 3

-- create 2 additional queries or tables to provide more insight
-- just like mentorship, some employees no longer show as presently working i.e. to_date is not 9999-01-01
SELECT title, COUNT(emp_no) AS "Total Titles"
INTO retiring_titles_9999
FROM unique_titles
WHERE (to_date >= '9999-01-01')
GROUP BY title
ORDER BY "Total Titles" DESC;

SELECT SUM("Total Titles")      -- ans 72458
FROM retiring_titles_9999

DROP TABLE retire_54_55_titles
-- close to retirement employees birth date 1954-1955 may be more interested in part time as a mentor
SELECT title, COUNT (title) AS "54-55 Birthyear Retirees"
-- 		e.emp_no,
--         e.first_name,
--         e.last_name,
-- 		e.birth_date,
-- 		tl.from_date,
--		tl.to_date
INTO retire_54_55_titles
FROM employees AS e
INNER JOIN titles AS tl
ON (e.emp_no = tl.emp_no)
WHERE ((e.birth_date BETWEEN '1954-01-01' AND '1955-12-31') AND tl.to_date >= '9999 01-01')
GROUP BY title
ORDER BY "54-55 Birthyear Retirees" DESC;

SELECT SUM("54-55 Birthyear Retirees")      -- ans 37149
FROM retire_54_55_titles


-- compare the different outputs of the retiring titles
DROP TABLE retiring_titles_compare

SELECT 
	rt.title AS "Retiring Title Groups",
	rt."Total Titles" AS "All Retiring Employees on Record",
	r99."Total Titles" AS "Currently Working Retirees",	
	r54."54-55 Birthyear Retirees"
INTO retiring_titles_compare
FROM retiring_titles AS rt
LEFT JOIN retiring_titles_9999 AS r99
ON (rt.title = r99.title)
LEFT JOIN retire_54_55_titles AS r54
ON (rt.title = r54.title)
ORDER BY rt."Total Titles" DESC;