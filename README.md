# sql_challenge

This challenge aims to investigate employees whom the company Pewlett Hackard (a fictional company) employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files. The project scope includes modeling the data tables that will hold the data from the CSV files, creating the tables and inserting the data into a SQL database, and answering questions about the data.

Tools used for this project include:
1. [QuickDBD](https://app.quickdatabasediagrams.com/#/): Data modeling, Data Engineering and ERD diagram.
2. PostgreSQL and PgAdmin4 : Creating the Database, Tables, table sttucture and running the queries.

The project includes three components:
**Data Modeling**
 * Designing the Database structure using an Entity Relationship Diagram.

**Data Engineering**
* Creating the table scheme for the data, spcifying data types, primary and foreign keys, and other constriants.
* Creating the tables in PostgreSQL using PGAdmin4 interface.
* Importing the CSV data into the table structure.

**Data Analysis**
Answering the following questions about the data:
* List the employee number, last name, first name, sex, and salary of each employee.
* List the first name, last name, and hire date for the employees who were hired in 1986.
* List the manager of each department along with their department number, department name, employee number, last name, and first name.
* List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
* List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
* List each employee in the Sales department, including their employee number, last name, and first name.
* List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
* List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

