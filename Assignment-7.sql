use assignments;

CREATE TABLE employee1(
emp_id INT,
emp_name VARCHAR(15),
city VARCHAR(30),
salary FLOAT);
INSERT INTO employee1 VALUES
(101,'Ronny','Pune', 200000),
(102,'Sandy','Bangalore', 55000),
(103,'Andy','Mumbai', 66000),
(104,'Sasi','Delhi', 79000),
(105,'Sami','Hyderabad', 59000);
SELECT * FROM employee1;
DESC employee1;
SELECT emp_name AS employee1, salary FROM employee1 WHERE salary = (SELECT MAX(salary) FROM
employee1);



#2

create table student(sid int primary key, sname varchar(20));
insert into student values(1,'Mahi'),(2,'Sam'),(3,'Roy'),(4,'Andy');
select * from student;

create table sub(subid int primary key, sid int, mark float, foreign key(sid) references student(sid));
desc sub;
insert into sub(subid,sid,mark) values(101,1,90),(102,1,90),(103,2,98),(104,2,99),(105,3,95),(106,3,96),(107,4,80);
select * from sub;

select s.sid,s.sname,(select sum(su.mark) from sub su where su.sid = s.sid) as totalsubjectmarks from student s;


#3
create user 'Raj'@'localhost'identified by 'Raj';
grant all privileges on *.* to 'Raj'@'localhost';

#4
revoke delete,alter,update on *.* from 'Raj'@'localhost';

#5
create or replace view Emp_view as select empno, Empname, Deptno, Sal from emp where Empno is not null with check option;

insert into Emp_view (Empno,Empname,Deptno,Sal) values (10, 'Maddy', 40, 125000);
select * from Emp_view;
CREATE VIEW Employee_View AS SELECT Empno, Empname FROM emp WHERE Empno < 115;
select * from Employee_view;

create or replace view Dept_view as select  Deptno,Dname,Loc from dept where deptno is not null with check option;
insert into Dept_view (Deptno,Dname,Loc) values (50,'R&D','Delhi');
select * from Dept_view;

CREATE VIEW Department_view AS SELECT deptno, Dname FROM dept ORDER BY Dname;
select * from Department_view;