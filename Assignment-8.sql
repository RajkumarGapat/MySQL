use assignments;
select * from student;
alter table student change column sid student_id int;
alter table student change column sname student_name varchar(20);

CREATE TABLE student_mark (id INT, marks INT,
  FOREIGN KEY (id) REFERENCES student(student_id));
INSERT INTO student_mark (id, marks) VALUES
(1, 60),(2, 75),(3, 50);
select * from student_mark;

DELIMITER //
drop procedure if exists display_student_data;
CREATE PROCEDURE display_student_data()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id INT;
    DECLARE sname VARCHAR(100);
    DECLARE marks INT;
    
    DECLARE cur CURSOR FOR
        SELECT s.student_id, s.student_name, sm.marks 
        FROM student s
        INNER JOIN student_mark sm ON s.student_id = sm.id;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    read_loop: LOOP
    FETCH cur INTO id, sname, marks;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT id, sname, marks;
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

call display_student_data();
