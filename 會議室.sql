CREATE DATABASE `meeting room`; 
SHOW DATABASES;  
USE `meeting room`; 

ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'kevinbear60404';
FLUSH PRIVILEGES;

CREATE Table `customer`(
c_id       VARCHAR(10)     NOT NULL,
c_name     VARCHAR(50)     NOT NULL,
c_uid      VARCHAR(16)     NOT NULL,
PRIMARY KEY (c_id)
) ;#創建客戶資料表

CREATE Table `room`(
room_no     varchar(4)      NOT NULL,
c_id        VARCHAR(10)     NOT NULL,
PRIMARY KEY (room_no)
) ;#創建會議室資料表

CREATE TABLE `reserve` (
r_no       INT AUTO_INCREMENT    PRIMARY KEY,
r_start    DATETIME              NOT NULL,
r_end      DATETIME              NOT NULL,
c_id       VARCHAR(10)           NOT NULL,
room_no     varchar(4)           NOT NULL,
INDEX (`r_start`, `r_end`)
);#創建預約資料表

CREATE Table `sign`(
s_no        INT AUTO_INCREMENT   NOT NULL,
s_in        TIMESTAMP            NOT NULL,
s_out       TIMESTAMP            NOT NULL,
c_uid       VARCHAR(16)          NOT NULL,
room_no     varchar(4)           NOT NULL,
PRIMARY KEY (s_no)
) ;#創建簽到資料表


INSERT INTO `meeting room`.`customer` (`c_id`,`c_name`, `c_uid`) VALUES ('B1044109','王彥斌','1234567');
INSERT INTO `meeting room`.`customer` (`c_id`,`c_name`, `c_uid`) VALUES ('B1044124','林佑呈','1234568');
INSERT INTO `meeting room`.`customer` (`c_id`,`c_name`, `c_uid`) VALUES ('B1044127','呂岳樺','1234569');
INSERT INTO `meeting room`.`customer` (`c_id`,`c_name`, `c_uid`) VALUES ('B1044147','楊安發','1234561');
INSERT INTO `meeting room`.`customer` (`c_id`,`c_name`, `c_uid`) VALUES ('B1044150','吳俊翊','1234562');

INSERT INTO reserve(r_no,r_start,r_end,c_id,room_no) VALUES(1,'2023-11-01 00:01:00','2023-11-01 00:02:00','B1044127','A001');
INSERT INTO reserve(r_no,r_start,r_end,c_id,room_no) VALUES(2,'2023-11-02 00:01:00','2023-11-02 00:02:00','B1044127','A001');
INSERT INTO reserve(r_no,r_start,r_end,c_id,room_no) VALUES(3,'2023-11-03 00:01:00','2023-11-03 00:02:00','B1044127','A001');
INSERT INTO reserve(r_no,r_start,r_end,c_id,room_no) VALUES(4,'2023-11-04 00:01:00','2023-11-04 00:02:00','B1044127','A001');
INSERT INTO reserve(r_no,r_start,r_end,c_id,room_no) VALUES(5,'2023-11-05 00:01:00','2023-11-05 00:02:00','B1044127','A001');

SELECT * FROM  `customer`;
SELECT * FROM  `reserve`;
SELECT * FROM  `sign`;
SELECT * FROM  `room`;
SHOW tables;

truncate table reserve; 

SET GLOBAL event_scheduler = ON;
ALTER EVENT update_reserve_status
ON SCHEDULE EVERY 5 SECOND   -- 每五秒檢查一次
DO
  UPDATE reserve 
  SET r_del = 1 
  WHERE r_end < NOW() AND r_del = 0;

SHOW EVENTS


CREATE TRIGGER trigger_update_reserve_del
AFTER UPDATE ON sign
FOR EACH ROW
BEGIN
    IF NEW.s_out IS NOT NULL THEN
        UPDATE reserve
        SET r_del = 1
        WHERE r_no = NEW.s_no;  -- 假設 s_no 與 r_no 相關聯
    END IF;
END; 

DROP TRIGGER IF EXISTS trigger_update_reserve_del;

ALTER TABLE reserve AUTO_INCREMENT = 1;