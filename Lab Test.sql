create database FinalTest;

use FinalTest;
create table Employee(Emp_id integer primary key, First_name varchar(20), Last_name varchar(20),Ph_number varchar(20), Date_of_Birth date, 
Hire_date date,Job_id varchar(10), Salary integer, Commission integer, Manager_id integer, Dept_id varchar(10));
desc Employee;
alter table Employee add column Experience integer;

insert into Employee(Emp_id, First_name, Last_name, Ph_number, Date_of_Birth, Hire_date, Job_id,
Salary, Commission, Manager_id, Dept_id,Experience) values
(100,'Neena','Kochhar','33333333','1972-01-04','1995-08-20','1001',50000,0,1002,'20',22),
(101, 'Lex', 'De Haan','44444444', '1982-05-10', '2005-06-01', '1001', 50000, 0, 1002, '20',17),
(102, 'Alexander', 'Hunold', '55555555', '1977-10-14', '2007-04-01', '1001', 50000, 0, 1002, '20',15),
(103, 'Bruce', 'Ernst', '66666666', '1967-03-07', '1990-07-01', '1004', 25000, 0, 1002, '40',32),
(104, 'David', 'Austin', '77777777', '1986-02-02', '2018-05-08', '1005', 15000, 0, 1002, '50',4),
(105, 'Valli', 'Pataballa', '88888888', '1990-11-17', '2015-07-10', '1003', 40000, 0, 1003, '30',7),
(106, 'Diana', 'Lorentz', '11111111', '1996-02-20', '2021-12-01', '1001', 60000, 0, 1002, '20', 1);
select * from Employee;




create table Jobs(Job_Id varchar(20),Job_Title varchar(20), Min_Salary Integer,Max_Salary Integer);
alter table Jobs change column Job_Id Job_id varchar(20) primary key;
desc Jobs;

insert into Jobs(Job_Id,Job_Title,Min_Salary,Max_Salary) values
('1001', 'Officer', 8000, 50000),
('1002', 'Manager', 8000, 60000),
('1003', 'Admin', 8000, 40000),
('1004', 'Security', 5000, 25000),
('1005', 'OfficeBoy', 5000, 15000);
select * from Jobs;



create table Department(Dept_id integer primary key, Dept_name varchar(25), Location varchar(20));
desc Department;

insert into Department(Dept_id,Dept_name,Location) values
(20, 'Research and Development', 'Mumbai'),
(30, 'Administration', 'Mumbai'),
(40, 'Security', 'Mumbai'),
(50, 'Helper', 'Mumbai'),
(60, 'Finance', 'Mumbai'),
(70, 'Quality Assurance', 'Mumbai');
select * from Department;

#3a
select Emp_id, concat(First_name, ' ', Last_name) as name, 
TIMESTAMPDIFF(YEAR, Date_of_Birth, CURDATE()) as age
from Employee;

#3b
select e.Emp_id, concat(e.First_name, ' ', e.Last_name) as name, d.dept_name
from Employee e
Inner join Jobs j on e.Job_id = j.Job_id
Inner join Department d on e.Dept_id = d.Dept_id
where e.salary = (select max(salary) from Employee where Dept_id = e.Dept_id)
order by d.Dept_name;

#3c
SELECT Emp_ID, CONCAT(First_name, ' ', Last_name) AS Name
FROM Employee
WHERE DATE_ADD(Date_of_Birth, INTERVAL 60 YEAR) = CURDATE();

#3d
SELECT d.Dept_id, d.Dept_name FROM Department d
LEFT JOIN Employee e ON d.Dept_id = e.Dept_ID
WHERE e.Emp_ID IS NULL;

#3e
SELECT e.Emp_ID, CONCAT(e.First_name, ' ', e.Last_name) AS Name, j.Job_Title, e.Salary
FROM Employee e
INNER JOIN Jobs j ON e.Job_ID = j.Job_ID
INNER JOIN Department d ON e.Dept_ID = d.Dept_id
WHERE d.Dept_name = 'Research and Development';

#3f
update Employee set Commission = 1
where Experience >= 10;
select * from Employee;

#Q5 
DELIMITER $$
drop procedure if exists SearchEmployeeByName;
CREATE PROCEDURE SearchEmployeeByName (IN searchName VARCHAR(50))
BEGIN
  SELECT e.Emp_ID, CONCAT(e.First_name, ' ', e.Last_name) AS Name, j.Job_Title, d.Dept_name
  FROM Employee e
  INNER JOIN Jobs j ON e.Job_ID = j.Job_ID
  INNER JOIN Department d ON e.Dept_ID = d.Dept_id
  WHERE CONCAT(e.First_name, ' ', e.Last_name) LIKE CONCAT('%', searchName, '%');
END $$

DELIMITER ;

CALL SearchEmployeeByName('David');




#########################   Q7

DELIMITER //
drop procedure if exists DisplayEmployeename;
CREATE PROCEDURE DisplayEmployeename()
BEGIN
    DECLARE empName VARCHAR(255);
    DECLARE deptName VARCHAR(255);
    DECLARE done INT DEFAULT FALSE;
    DECLARE employeeCursor CURSOR FOR
        SELECT CONCAT(First_name, ' ', Last_name) AS EmployeeName, Dept_name
        FROM Employee
        INNER JOIN Department ON Employee.Dept_ID = Department.Dept_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN employeeCursor;
    employeeLoop: LOOP
        FETCH employeeCursor INTO empName, deptName;
        IF done THEN
            LEAVE employeeLoop;
        END IF;
        SELECT CONCAT('Employee: ', empName, "   ,   " ' Department: ', deptName);

    END LOOP employeeLoop;
    CLOSE employeeCursor;

END//

DELIMITER ;

CALL DisplayEmployeename();


#8
CREATE VIEW ViewEmployeeData AS
SELECT CONCAT(e.First_name, ' ', e.Last_name) AS EmployeeName, 
d.Dept_name, MAX(e.Salary) AS MaxSalary
FROM Employee e
JOIN Department d ON e.Dept_ID = d.Dept_id
GROUP BY e.First_name, e.Last_name, d.Dept_name;

SELECT * FROM ViewEmployeeData;
