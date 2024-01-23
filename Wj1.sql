create database Webjava;


create table login1(username varchar(30),pass varchar(20));
desc login1;
insert into login1(username,pass) values
('Raj','roy'),
('Ethan','Whyte');
delete from  login1 where username='Raj';
insert into login1(username,pass) values
('Raj','roy'),('Sam','Patil'),('Rahul','Kadam');
select * from login1;

use webjava;
create table employee(eid int,ename varchar(20),esalary int);

insert into employee(eid,ename,esalary) values
(1,'Sam',25000),
(2,'Andy',50000),
(3,'Sandy',70000),
(4,'Amol',30000),
(5,'Vinit',40000);

SELECT MAX(esalary) AS highest_salary, MIN(esalary) AS lowest_salary FROM employee;
