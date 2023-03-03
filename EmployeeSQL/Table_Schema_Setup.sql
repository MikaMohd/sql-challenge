/* Table Schema Setup*/ 

/*Add Tables in order of creation!
don't scan for dept_emp_id, mgr_id, and salary_id columns during CSV import!*/

CREATE Table Departments (
	dept_no VARCHAR(5) Primary Key,
	dept_name VARCHAR(30)
);

CREATE Table Titles (
	title_id VARCHAR(5) Primary Key,
	title VARCHAR(20)
);

CREATE Table Employees (
	emp_no int Primary Key,
	emp_title_id varchar(5),
	foreign key (emp_title_id) references titles(title_id),
	birth_date VARCHAR(10),
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(1),
	hire_date VARCHAR(10)
);

CREATE Table Dept_Emp (
    dept_emp_id serial Primary Key,
	emp_no int,
	foreign key (emp_no) references Employees(emp_no),
	dept_no VARCHAR(5),
	foreign key (dept_no) references Departments(dept_no)
);

CREATE Table Dept_Manager (
    mgr_id serial Primary Key,
	dept_no VARCHAR(5),
	foreign key (dept_no) references Departments(dept_no),
	emp_no int,
	foreign key (emp_no) references Employees(emp_no)
);

CREATE Table Salaries (
    emp_no int not null,
	foreign key (emp_no) references Employees(emp_no),
	salary int,
	salary_id serial Primary Key
);