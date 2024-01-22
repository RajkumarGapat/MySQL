use sys;
create user 'sun'@'localhost'identified by 'sun';
grant all privileges on *.* to 'sun'@'localhost';

revoke delete,alter on *.* from 'sun'@'localhost';