CREATE TABLE "departments" (
    "dept_no" text  PRIMARY KEY NOT NULL,
    "dept_name" text   NOT NULL
);

DROP TABLE if exists "dept_emp";
CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
	"dept_no" text   NOT NULL
);

DROP TABLE if exists "dept_manager";
CREATE TABLE "dept_manager" (
    "dept_no" text   NOT NULL,
    "emp_no" int   NOT NULL
);

DROP TABLE if exists "employees";
CREATE TABLE "employees" (
    "emp_no" int	PRIMARY KEY NOT NULL,
    "emp_title_id" text   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" text   NOT NULL,
    "last_name" text   NOT NULL,
    "sex" text   NOT NULL,
    "hire_date" date   NOT NULL
);

DROP TABLE if exists "salaries";
CREATE TABLE "salaries" (
    "emp_no" int PRIMARY KEY NOT NULL,
	"salary" int  NOT NULL
);

DROP TABLE if exists "titles";
CREATE TABLE "titles" (
    "title_id" text  PRIMARY KEY  NOT NULL,
    "title" text   NOT NULL
);





-- Query 1
select 
	e.emp_no, e.last_name, e.first_name, e.sex, s.salary
	from employees as e
	inner join salaries as s on e.emp_no=s.emp_no
	order by s.salary desc
	;

-- Query 2
select 
	first_name, last_name, hire_date
	from employees 
	where extract(year from hire_date) = 1986
	;
	
-- Query 3
select
	dm.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
	
	from dept_manager as dm
	inner join departments as d 
		on dm.dept_no=d.dept_no
	inner join employees as e 
		on dm.emp_no=e.emp_no
;
	


-- Query 4
select
	e.emp_no, e.last_name, e.first_name, d.dept_name
	from employees e
	inner join dept_emp de on de.emp_no = e.emp_no
	inner join departments d on d.dept_no = de.dept_no
;


-- Query 5
select 
	first_name, last_name, sex
	from employees
	where first_name = 'Hercules'
	and last_name like 'B%'
;


-- Query 6
select 
	e.emp_no, e.last_name, e.first_name, d.dept_name
	from departments d
	inner join dept_emp de on d.dept_no = de.dept_no
	inner join employees e on de.emp_no = e.emp_no
	where dept_name = 'Sales'
;


-- Query 7
select 
	e.emp_no, e.last_name, e.first_name, d.dept_name
	from departments d
	inner join dept_emp de on d.dept_no = de.dept_no
	inner join employees e on de.emp_no = e.emp_no
	where dept_name = 'Sales' 
		or dept_name = 'Development'
;


-- Query 8
select 
	last_name, count(last_name) 
	from employees
	group by last_name
	order by count(last_name) desc
;


