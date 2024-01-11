DROP DATABASE IF EXISTS assignment_01;
CREATE DATABASE assignment_01;
USE assignment_01;
-- Tạo bảng department
CREATE TABLE department (
	department_id INT,
    department_name VARCHAR(50) UNIQUE DEFAULT "Phòng chờ" NOT NULL ,
    PRIMARY KEY (department_id)
);
-- Tạo bảng Position
CREATE TABLE position (
	position_id INT,
    position_name ENUM("Dev", "Test", "Scrum", "Master", "PM")
);
 -- Tạo bảng account
 CREATE TABLE account (
	account_id INT,
    email VARCHAR(50),
    username VARCHAR(50),
    full_name VARCHAR(50),
    department_id INT,
    position_id INT,
    create_date DATE
 );
 
 -- Tạo bảng group
 CREATE TABLE `group` (
	group_id INT,
    group_name VARCHAR(50),
    creator_id VARCHAR(10),
    create_date DATE
 );
 
 -- tạo group_account
 CREATE TABLE group_account (
	group_id INT,
    account_id INT,
    join_date DATE,
    PRIMARY KEY (group_id,account_id)
 );
 
 -- Tạo type_question
 CREATE TABLE type_question (
	type_id INT,
    type_name ENUM("Essay", "Multiple-Choice")
 );
 
 -- Tạo category_question
 CREATE TABLE category_question (
	category_id INT,
    category_name VARCHAR(15)
 );
 
 -- tạo bảng question
 CREATE TABLE question (
	question_id INT,
    content VARCHAR(200),
    category_id INT,
    type_id INT,
    create_id INT,
    create_date DATE
 );
 
 -- Tạo bảng answer
 CREATE TABLE answer (
	answer_id INT,
    content VARCHAR(200),
    question_id INT,
    is_correct ENUM("Đúng", "Sai")
 );
 
 -- Tạo bảng exam
 CREATE TABLE exam (
	exam_id INT,
    code VARCHAR(5),
    title VARCHAR(50),
    category_id INT,
    duration TIME,
    create_id INT,
    create_date DATE
 );
 
 -- Tạo bảng exam_question
 CREATE TABLE exam_question (
	exam_id INT,
    question_id INT
 );
 
 
 -- Thêm dữ liệu cho bảng department
 INSERT INTO department (department_name)
 VALUES ("Giám đốc"), ("Bảo vệ");
 -- Hiển thị dữ liệu trong bảng
 TABLE department;