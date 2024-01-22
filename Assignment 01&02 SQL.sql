use student;
create table Employee(Emp_no int,Emp_name varchar(20));
desc Employee;

Alter table Employee add column Dept varchar(20);
desc Employee;

Alter table Employee add column Salary float(4,2),add column age varchar(5);
desc Employee;

Alter TABLE Employee modify COLUMN Age int;
desc Employee;

Alter Table Employee Rename column dept to dept_id;
desc Employee;
delete FROM employee where Emp_name='Rohit';
Insert into Employee values(5,'Swapnil',30,60.00,22);
Select*from Employee;
delete FROM employee where Emp_name='Rohit';
Select*from Employee;

TRUNCATE TABLE Employee;
Select*from Employee;
Drop  table employee;
desc employee;


CREATE TABLE Employee (
  Emp_no INT NOT NULL,
  Emp_name VARCHAR(20) NOT NULL,
  Dept_id VARCHAR(20),
  Salary FLOAT(4,2) DEFAULT 40.00,
  Age INT NOT NULL,
  PRIMARY KEY (Emp_no),
  CHECK (Age > 20)
);
desc employee;

CREATE TABLE Department (
  ID INT NOT NULL AUTO_INCREMENT,
  Dept_id INT NOT NULL,
  Dept_name VARCHAR(20) NOT NULL,
  Location VARCHAR(15) DEFAULT 'New Delhi',
  PRIMARY KEY (ID)
) AUTO_INCREMENT=100;

insert into department values(2,30,'sales','Mumbai');
Select *from department;


insert into employee values(4,'Vihan',30,40.00,29);




Select *from Employee;
Select *from department;

Select Emp_no,Emp_name,Salary from Employee;
update  Employee SET Salary = Salary + 10.00 WHERE Salary < 50.00;


create table city (ID int, name varchar(17),countrycode varchar(3),district varchar(20),population int);
desc city;
update city set countrycode='USA';

SELECT *
FROM CITY
WHERE Population > 100000;


insert into city values (5,'Los Angeles','USA','San Antonio City',80000);
Select *from city;
