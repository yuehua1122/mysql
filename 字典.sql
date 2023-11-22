/* 
DROP DATABASE `名稱`; 刪除資料庫
CREATE DATABASE `名稱`; 新增資料庫
SHOW DATABASES; 顯示資料庫 
USE `名稱`; 使用資料庫
CREATE TABLE `名稱`(
    `student_id` INT PRIMARY KEY,
    `name` VARCHAR(20),
    `major` VARCHAR(20) 
); 新增資料表

DESCRIBE `名稱`; 顯示資料表
INT              整數    
DECIMAL(3,2)     有小數點的數
VARCHAR(n)       字串
BLOB             圖片 影片 檔案
DATE             YYYY-MM-DD 日期
TIMESTAMP        YYYY-MM-DD HH:MM:SS 日期 時間

INSERT INTO `資料庫名稱`.`table名稱` (`欄位名稱`,`欄位名稱`, `欄位名稱`) VALUES ('值','值','值');

DELETE record
FROM `reserve` record
INNER JOIN `sign` s ON record.id = s.id
WHERE s.`out` IS NOT NULL;
#當接收到用戶的簽退紀錄時，會將用戶的預約資料刪除

ALTER TABLE reserve
DROP PRIMARY KEY,
MODIFY COLUMN r_no INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE sign
DROP PRIMARY KEY,
MODIFY COLUMN s_no INT AUTO_INCREMENT PRIMARY KEY;
#讓主鍵可以自動排序
*/