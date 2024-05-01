-- Drop tables if they exist
DROP TABLE IF EXISTS "Departments", "Titles", "Employees", "Department_Employee", "Department_manager", "Salaries";

-- Create Table Schemas
CREATE TABLE "Departments" (
    "Department_no" varchar(50)   NOT NULL,
    "Department_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Department_no"
     )
);

CREATE TABLE "Titles" (
    "Title_id" varchar(50)   NOT NULL,
    "Title_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Title_id"
     )
);

CREATE TABLE "Employees" (
    "Employee_no" INT   NOT NULL,
    "Employee_title_id" varchar(50)   NOT NULL,
    "Birth_date" date   NOT NULL,
    "First_name" varchar(150)   NOT NULL,
    "Last_name" varchar(150)   NOT NULL,
    "Sex" varchar(50)   NOT NULL,
    "Hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Employee_no"
     )
);

CREATE TABLE "Department_Employee" (
    "Employee_no" INT   NOT NULL,
    "Department_no" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Department_Employee" PRIMARY KEY (
        "Employee_no","Department_no"
     )
);

CREATE TABLE "Department_Manager" (
    "Department_no" varchar(50)   NOT NULL,
    "Employee_no" INT   NOT NULL,
    CONSTRAINT "pk_Department_Manager" PRIMARY KEY (
        "Department_no","Employee_no"
     )
);

CREATE TABLE "Salaries" (
    "Employee_no" INT   NOT NULL,
    "Salary" money   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Employee_no"
     )
);

-- Add Constraints
ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Employee_title_id" FOREIGN KEY("Employee_title_id")
REFERENCES "Titles" ("Title_id");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_Employee_no" FOREIGN KEY("Employee_no")
REFERENCES "Employees" ("Employee_no");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_Department_no" FOREIGN KEY("Department_no")
REFERENCES "Departments" ("Department_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_Department_no" FOREIGN KEY("Department_no")
REFERENCES "Departments" ("Department_no");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_Employee_no" FOREIGN KEY("Employee_no")
REFERENCES "Employees" ("Employee_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Employee_no" FOREIGN KEY("Employee_no")
REFERENCES "Employees" ("Employee_no");


-- References: Exported from QuickDBD: https://www.quickdatabasediagrams.com/