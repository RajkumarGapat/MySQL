use sys;
set autocommit=0;
start transaction;
select * from t1;
alter table t1 add column salary float;
commit;
update t1 set salary=50000 where id=101;
update t1 set salary=60000 where id=102;
update t1 set salary=70000 where id=103;

savepoint A;
select * from t1;
delete from t1 where id=103;
select * from t1;
savepoint B;

 Rollback to savepoint A;
select * from t1;
