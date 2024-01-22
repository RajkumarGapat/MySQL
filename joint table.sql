create database Raj;
drop database raj;         ## to delete database,table or etc...

## join two tables using foreign key.....

## creating parent table ....

use sys;
create table school(sid int primary key, sname varchar(50));
insert into school values(1, 'zp school');
insert into school values(2, 'trinity school');
select * from school;

## creating child table ....

create table teacher(sid int, tname varchar(50), foreign key(sid) references school(sid));
insert into teacher values(1, 'Godase sir');
insert into teacher values(2, 'Borade sir');
select * from teacher;

## extracting data from parent table to child table using foreign key ....

select * from school, teacher;

