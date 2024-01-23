use employee;
show triggers;
select * from information_schema.triggers;
create table City(id int primary key,name varchar(20),population int,state varchar(20));
insert into city (id,name,population,state) values
(1,'Pune',2000,'Maharashtra'),
(2,'Bangalore',5000,'Karnataka'),
(3,'Chennai',4000,'Tamilnadu');
select * from city;

## Before inserting Trigger

Delimiter $$
create trigger befor_insert_city
Before Insert on city
for each row
BEGIN
set new.population = new.population+1500;
END $$
Delimiter ;

insert into city values(4,'Delhi',7000,'Delhi');
select * from city;

## After Insert Trigger

use student;
select * from studmarks;
desc studmarks;
insert into studmarks(sid,sname,mark1,mark2,mark3,mark4,totalmarks)values
(10,'Sam',80,80,80,80,320),
(20,'Andy',90,90,90,90,360);

DELIMITER $$

DROP TRIGGER IF EXISTS after_insert_studmarks$$

CREATE TRIGGER after_insert_studmarks
BEFORE INSERT ON studmarks
FOR EACH ROW
BEGIN
    INSERT INTO studmarks (sid, sname, mark1, mark2, mark3, mark4, totalmarks)
    VALUES (NEW.sid, 'Pavan', 80, 60, 70, 90, 300);
END$$

DELIMITER ;

INSERT INTO studmarks (sid, sname, mark1, mark2, mark3, mark4, totalmarks)
VALUES (100, 'Poly', 50, 50, 50, 50, 200);

SELECT * FROM studmarks;

