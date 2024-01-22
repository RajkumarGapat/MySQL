use employee;
 CREATE TABLE employee(
 name varchar(45) NOT NULL, 
 occupation varchar(35) NOT NULL, 
 working_date date,
 working_hours varchar(10));
 
 select * from employee;
 
 INSERT INTO employee VALUES 
 ('Robin', 'Scientist', '2020-10-04', 12),
 ('Warner', 'Engineer', '2020-10-04', 10),
 ('Peter', 'Actor', '2020-10-04', 13),
 ('Marco', 'Doctor', '2020-10-04', 14),
 ('Brayden', 'Teacher', '2020-10-04', 12),
 ('Antonio', 'Business', '2020-10-04', 11);
 
  INSERT INTO employee VALUES 
 ('Rohit', 'Scientist', '1999-09-18', 15),
 ('David', 'Engineer', '2021-01-17', 16),
 ('Raj', 'Actor', '2022-11-04', 27),
 ('Prashant', 'Doctor', '2023-12-08', 18),
 ('Rahul', 'Teacher', '2024-04-07', 19),
 ('Suraj', 'Business', '2025-03-05', 14),
  ('Sam', 'Doctor', '2029-11-06', 18),
 ('Ronny', 'Teacher', '2028-01-11', 20),
 ('Sunny', 'Business', '2027-02-01', 14);
 
 select count(name)from employee;
 SELECT SUM(working_hours) AS "Total working hours" FROM employee; 
 select min(working_hours)from employee;
 select max(working_hours)from employee;
select avg(working_hours)from employee;
select group_concat(name, occupation) as nameandoccupation from employee where name = 'Antinio';
select * from employee limit 3;
select * from employee order by name desc;
select * from employee order by working_hours;
select * from employee order by working_hours limit 4;    ## Ascending order by default.
select * from employee order by working_hours desc;      ## descending order.
select * from employee order by working_hours desc limit 2;
select * from employee order by working_hours desc limit 0,2;
select occupation, sum(working_hours) from employee group by occupation;
select occupation, count(occupation) from employee group by occupation;
select occupation, count(occupation) from employee group by occupation having count(occupation)>2;



