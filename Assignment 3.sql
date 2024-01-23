create database Assignments;
use assignments;
create table job_history(Employee_id int primary key not null,start_date date,
end_date date,job_id int,department_id int unique key);
desc job_history;

# Q2
create table job(job_id int,job_title varchar(20),min_salary int,max_salary int check(max_salary<25000));
insert into job values (1,'Manager',15000,100000);

insert into job values (1,'Manager',15000,24000);
select * from job;

#Q3
create table salesman(salesman_id int,name varchar(20),city varchar(20),commission float(5,2));
insert into salesman (salesman_id,name,city,commission) values
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12);
select * from salesman;


