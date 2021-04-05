

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL   
);

drop table dept_manager

CREATE TABLE "dept_manager" (
     "dept_no" varchar   NOT NULL,
	"emp_no" int  NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "departments" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);


ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_emp" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


SELECT first_name, last_name, sex, salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date FROM employees WHERE hire_date >='1986-01-01' AND hire_date <'1987-01-01';

SELECT dept_manager.emp_no, departments.dept_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_manager 
INNER JOIN departments ON dept_manager.dept_no=departments.dept_no
INNER JOIN employees ON employees.emp_no= dept_manager.emp_no;

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name, dept_emp.dept_no
FROM dept_emp
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
INNER JOIN employees ON dept_emp.emp_no=employees.emp_no;

SELECT first_name, last_name FROM employees WHERE first_name = 'Hercules' AND last_name LIKE '%B%';

SELECT employees.first_name, employees.last_name
FROM employees 
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
WHERE dept_no = 'd007'

SELECT employees.first_name, employees.last_name
FROM employees 
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
WHERE dept_no = 'd007' OR dept_no = 'd005'

SELECT last_name, COUNT(last_name) as "Count Last Names" 
FROM employees 
GROUP BY last_name 
ORDER BY "Count Last Names" DESC;






