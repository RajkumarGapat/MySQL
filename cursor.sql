use sys;
create table employee (eid int, ename varchar(20), city varchar(20), salary float,age int);
insert into employee values(101, 'Rajee', 'Delhi', 70000,22),(102, 'Raju','kochi',60000,23),(103, 'Anu','goa',65000,24),
(104, 'Arun','Mumbai',100000,25),(105, 'Kannan','Chennai',62000,23),(106, 'Latha','Mumbai',90000,25);
select * from employee;

update employee set salary=30000 where eid=103;
update employee set salary=125000 where eid=101;
update employee set salary=2500000 where eid=102;




#####  Cursor #####

delimiter //              
                          #### function or procedure starting
drop function if exists Findempname;
create function Findempname(empname varchar(100))
returns varchar(100)
deterministic      
                                 ### deterministic only use in function not in procedure.....
begin
declare done int default false;
declare id int default 0;
declare c1 cursor for select eid,ename from employee where ename=empname;
declare continue handler for not found set done = true;                 
## for exception handling
open c1;
fetch c1 into id, empname;
close c1;
set empname = concat("Emp id : ", id, "  ,  ", "Emp_name : ", empname);
return empname;
end //
delimiter ;

select Findempname("Raju");


#### Procedure 


select * from employee;
delimiter //
drop procedure if exists cursor_example;
create procedure cursor_example()
begin
declare count int default 1;
declare month_income float;
declare id int;
declare empname varchar(20);
declare ration_card_type varchar(100);
declare done int default 0;
declare ration_card_cursor cursor for 
    select eid,ename,salary from employee;
declare continue handler for not found set done = 1;
open ration_card_cursor;
id_loop: while(done=0) do
   fetch ration_card_cursor into id, empname, month_income;
   if done = 1 then
     leave id_loop;
    end if;
    #set count = count + 1;
    select salary into month_income from employee where eid = id;
    if month_income <= 50000 then
       set ration_card_type = 'Green Card';
       set count = count + 1;
    elseif month_income > 50000 and month_income<= 100000 then
			set ration_card_type = 'Brown Card';
			set count= count+1;
	elseif month_income > 100000 and month_income<= 1000000 then
			set ration_card_type = 'White Card';
			set count= count+1;
	else 
            set ration_card_type = 'Blue Card';
			set count= count+1; 
	end if;
    
	set ration_card_type = concat("Emp_name : ", empname, "  ,  ", " Salary : ", 
		month_income, "  ,  ", "Ration card Type : ", ration_card_type, "  ,  ", 
        "Count : ", count);
    select ration_card_type;
    end while id_loop;
    close ration_card_cursor;
    set done = 0;
    end //
    delimiter ;
    
    call cursor_example();
  
