create database corelation;
use corelation;
create table student(sid int primary key, sname varchar(20));
insert into student values(1,'Mahi'),(2,'Sam'),(3,'Roy'),(4,'Andy');
select * from student;

create table sub(subid int primary key, sid int, mark float, foreign key(sid) references student(sid));
desc sub;
insert into sub(subid,sid,mark) values(101,1,90),(102,1,90),(103,2,98),(104,2,99),(105,3,95),(106,3,96),(107,4,80);
select * from sub;

select s.sid,s.sname,(select sum(su.mark) from sub su where su.sid = s.sid) as totalsubjectmarks from student s;
