use assignments;

create table employee (emp_id int primary key , emp_name varchar(50) not null);
insert into employee values
(101,"Jack"),(102,"Rachel"),(103,"Kate"),(104,"Ron");
select * from employee;

create table ingredients (ing_id int primary key,ing_name varchar(50) not null);
insert into ingredients values
(21,"ing1"),(22,"ing2"),(23,"ing3"),(24,"ing4"),(25,"ing5"),(26,"ing6"),(27,"ing7"),
(28,"ing8"),(29,"ing9"),(30,"ing10");
select * from ingredients;

create table food (f_id int primary key , f_name varchar(50) not null);
insert into food values (51,"food1"),(52,"food2"),(53,"food3"),(54,"food4");
select * from food;

create table cooking (f_id int, emp_id int , foreign key(f_id) references food
(f_id), foreign key(emp_id) references employee (emp_id));
insert into cooking values
(51,101),(51,102),(52,101),(53,103),(53,104),(54,104),(54,101);
select * from cooking;

CREATE TABLE recipe (f_id INT , ing_id INT, FOREIGN KEY(f_id) REFERENCES food(f_id),
FOREIGN KEY(ing_id) REFERENCES ingredients(ing_id));
INSERT INTO recipe VALUES
(51,21), (51,22), (51,23), (51,24),
(51,25), (52,25), (52,26),(53,25),
(53,27), (53,28), (54,29), (54,30),
(54,21);
SELECT * FROM recipe;

SELECT emp_name AS 'TOP 3 MASTER CHEFS' FROM recipe
JOIN cooking ON recipe.f_id = cooking.f_id
JOIN employee ON cooking.emp_id = employee.emp_id
GROUP BY emp_name ORDER BY COUNT(ing_id) DESC LIMIT 3;



