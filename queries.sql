-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e."Employee_no", e."Last_name", e."First_name", e."Sex", s."Salary"
FROM "Employees" AS e
LEFT JOIN "Salaries" AS s ON e."Employee_no" = s."Employee_no";


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT "First_name", "Last_name", "Hire_date"
FROM "Employees"
WHERE EXTRACT(YEAR FROM "Hire_date") = 1986;


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm."Department_no", d."Department_name", e."Employee_no", e."Last_name", e."First_name"
FROM "Employees" AS e
LEFT JOIN "Department_Manager" AS dm ON  dm."Employee_no" = e."Employee_no"
LEFT JOIN "Departments" AS d ON  dm."Department_no" = d."Department_no"
WHERE e."Employee_no" IN (
	SELECT "Employee_no" FROM "Department_Manager");


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de."Department_no", e."Employee_no", e."Last_name", e."First_name",  d."Department_name"
FROM "Employees" AS e
LEFT JOIN "Department_Employee" AS de ON  de."Employee_no" = e."Employee_no"
LEFT JOIN "Departments" AS d ON  de."Department_no" = d."Department_no";


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT "First_name", "Last_name", "Sex"
FROM "Employees"
WHERE "First_name" = 'Hercules' AND "Last_name" LIKE 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT "Employee_no", "Last_name", "First_name" FROM "Employees" WHERE "Employee_no" IN(
	SELECT "Employee_no" FROM "Department_Employee" WHERE "Department_no" IN(
		SELECT "Department_no" FROM "Departments" WHERE "Department_no" = 'd007'
	)
);


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
WITH sales_and_dev_empl AS (SELECT "Employee_no", "Last_name", "First_name" FROM "Employees" WHERE "Employee_no" IN(
	SELECT "Employee_no" FROM "Department_Employee" WHERE "Department_no" IN(
		SELECT "Department_no" FROM "Departments" WHERE "Department_name" = 'Sales' OR "Department_name" = 'Development'
	)
))
SELECT sde.*, d."Department_name" FROM sales_and_dev_empl AS sde
INNER JOIN "Department_Employee" AS de ON sde."Employee_no" = de."Employee_no"
INNER JOIN "Departments" AS d ON de."Department_no" = d."Department_no";


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT "Last_name", COUNT("Last_name") AS "Frequency Counts" FROM "Employees"
GROUP BY "Last_name"
ORDER BY "Frequency Counts" DESC;



