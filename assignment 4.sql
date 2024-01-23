use assignments;
create table EMP(empno int,empname varchar(30),Job varchar(10),mgr int,hiredate date,sal float,deptno int);
desc EMP;

insert into EMP (empno,empname,Job,mgr,hiredate,sal,deptno) values
(111,'Saw Kalayar','CLERK',115,'2017-12-03',800,20),
(112,'Aung Myst','salesman',115,'2002-02-02',1600,30),
(113,'wai wai','salesman',114,'2022-02-04',1250,30),
(114, 'Ba Nyo', 'MANAGER', 115, '1981-05-10', 4850, 30),
(115, 'Myat Thu', 'ANALYST', 114, '1981-12-03', 3000, 20),
(116, 'Cho Myint', 'CLERK', 115, '1990-12-09', 1500, 20),
(117, 'Aye Win', 'CLERK', 114, '1993-01-23', 1200, 10);
select * from EMP;


create table DEPT(deptno int,dname varchar(15),Loc varchar(15));
desc DEPT;
INSERT INTO DEPT(deptno, dname, Loc) VALUES
(10, 'STORE', 'CHICAGO'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'NEW YORK'),
(40, 'MARKETING', 'BOSTON');
select * from DEPT;


CREATE TABLE SALGRADE(grade INT, `low-sal` FLOAT, `hi-sal` FLOAT);
desc SALGRADE;

INSERT INTO SALGRADE(grade, `low-sal`, `hi-sal`) VALUES
(1, 700, 1200),
(2, 1201, 1400),
(3, 1401, 2000),
(4, 2001, 3000),
(5, 3001, 9999);

select * from SALGRADE;


select * from EMP where empname like 'A%';

select empname,empno,sal from EMP where sal between 1200 and 1400;

#3
select Job,avg(sal) as average_salary,count(job) as total_emp from EMP Group by Job;

#4
select empname, floor(datediff(curdate(),hiredate) / 365) as experience from EMP where
floor(datediff(curdate(),hiredate) / 365) > 10 order by empname;

#5
update EMP set Job='MANAGER' where empno=115;
update EMP set sal=4000 where empno=115;
select * from EMP where empno=115;

#6
update EMP set sal=sal+(sal*10/100);
select * from EMP;