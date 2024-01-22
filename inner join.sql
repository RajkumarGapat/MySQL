use employee;
desc employee;
alter table employee add column dept_id int;
show tables;
create table department(d_id int, d_name varchar(30), location varchar(30));
desc department;
insert into department values(01, 'IT', 'Mumbai'), (02, 'HR', 'Mumbai'), (03, 'Admin', 'Mumbai');
select * from employee;
update employee set dept_id = 01 where name = 'Robin';
update employee set dept_id = 01 where name = 'Warner';
update employee set dept_id = 01 where name = 'Peter';
update employee set dept_id = 04 where name = 'Marco';
update employee set dept_id = 04 where name = 'Brayden';

select * from employee e1 inner join department d on e1.dept_id = d.d_id;  
select * from employee e1 left join department d on e1.dept_id = d.d_id;
select * from employee e1 right join department d on e1.dept_id = d.d_id;

select * from employee e1 natural join department d;
alter table Department rename column d_id to dept_id;

select * from employee e1 inner join department d on e1.dept_id = d.dept_id;
select * from employee e1 left join department d on e1.dept_id = d.dept_id;
select * from employee e1 right join department d on e1.dept_id = d.dept_id;

select * from employee e1 inner join department d using(dept_id);
select * from employee e1 inner join department d on e1.dept_id = d.dept_id where d_name = 'IT';
select * from employee e1 inner join department d on e1.dept_id = d.dept_id where occupation = 'Scientist';
select count(e1.dept_id),e1.dept_id from employee e1 inner join department d on e1.dept_id = d.dept_id group by e1.dept_id;


