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

INSERT INTO `meeting room`.`reserve` (`r_no`,`r_start`, `r_end`,`c_id`) VALUES ('1','2023-09-15 10:00','2023-09-15 11:00','B1044109');
INSERT INTO `meeting room`.`reserve` (`r_no`,`r_start`, `r_end`,`c_id`) VALUES ('2','2023-09-15 15:00','2023-09-15 17:00','B1044124');
INSERT INTO `meeting room`.`reserve` (`r_no`,`r_start`, `r_end`,`c_id`) VALUES ('3','2023-09-16 09:30','2023-09-16 11:20','B1044127');
INSERT INTO `meeting room`.`reserve` (`r_no`,`r_start`, `r_end`,`c_id`) VALUES ('4','2023-09-16 13:00','2023-09-16 14:10','B1044147');
INSERT INTO `meeting room`.`reserve` (`r_no`,`r_start`, `r_end`,`c_id`,`room_no`) VALUES ('1','2023-09-16 15:00','2023-09-16 16:00','B1044150','A005');

INSERT INTO `meeting room`.`sign` (`s_no`,`s_in`, `s_out`,`c_uid`) VALUES ('1','2023-09-15 10:01','2023-09-15 10:55','1234567');
INSERT INTO `meeting room`.`sign` (`s_no`,`s_in`, `s_out`,`c_uid`) VALUES ('2','2023-09-15 15:05','2023-09-15 16:50','1234568');
INSERT INTO `meeting room`.`sign` (`s_no`,`s_in`, `s_out`,`c_uid`) VALUES ('3','2023-09-16 09:36','2023-09-16 11:18','1234569');
INSERT INTO `meeting room`.`sign` (`s_no`,`s_in`, `s_out`,`c_uid`) VALUES ('4','2023-09-16 13:10','2023-09-16 14:06','1234561');
INSERT INTO `meeting room`.`sign` (`s_no`,`s_in`, `s_out`,`c_uid`) VALUES ('5','2023-09-16 15:20','2023-09-16 15:50','1234562');

SELECT * FROM  `customer`;
SELECT * FROM  `reserve`;
SELECT * FROM  `sign`;
SELECT * FROM  `room`;
SHOW tables;

truncate table reserve; 

