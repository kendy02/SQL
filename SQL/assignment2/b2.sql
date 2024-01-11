DROP DATABASE IF EXISTS assignment_02;
CREATE DATABASE assignment_02;
USE assignment_02;
-- 1 phòng ban chỉ có một tên duy nhất và phải có tên 
CREATE TABLE department (
	department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) UNIQUE NOT NULL
);
-- Tạo bảng Position (một chức vụ phải có tên và chỉ đc một chức vụ)
CREATE TABLE position (
	position_id INT PRIMARY KEY AUTO_INCREMENT,
    position_name ENUM("Dev", "Test", "Scrum Master", "PM") UNIQUE NOT NULL 
);
 -- Tạo bảng account( thời gian tạo tk là tg tạo)
 CREATE TABLE account (
	account_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) UNIQUE NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    department_id INT,
    position_id INT,
    create_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (department_id) REFERENCES department (department_id),
    FOREIGN KEY (position_id) REFERENCES position (position_id)
 );
 
 -- Tạo bảng group
 CREATE TABLE `group` (
	group_id INT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(50) UNIQUE NOT NULL,
    creator_id INT,
    create_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (creator_id) REFERENCES account (account_id)
 );
 
 -- tạo group_account
 CREATE TABLE group_account (
	group_id INT,
    account_id INT,
    join_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (group_id, account_id),
    FOREIGN KEY (group_id) REFERENCES `group` (group_id),
    FOREIGN KEY (account_id) REFERENCES account (account_id)
 );
 -- Tạo type_question
 CREATE TABLE type_question (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name ENUM("Essay", "Multiple-Choice") UNIQUE NOT NULL
 );
 
 -- Tạo category_question
 CREATE TABLE category_question (
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) UNIQUE NOT NULL
 );
 
 -- tạo bảng question
 CREATE TABLE question (
	question_id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(50) UNIQUE NOT NULL,
    category_id INT,
    type_id INT,
    creator_id INT,
    create_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (category_id) REFERENCES category_question (category_id),
    FOREIGN KEY (type_id) REFERENCES type_question (type_id),
    FOREIGN KEY (creator_id) REFERENCES account (account_id)
 );
 
 -- Tạo bảng answer
 CREATE TABLE answer (
	answer_id INT PRIMARY KEY AUTO_INCREMENT ,
    content VARCHAR(50),
    question_id INT,
    is_correct BOOLEAN,
    FOREIGN KEY (question_id) REFERENCES question (question_id)
 );
 
 -- Tạo bảng exam
 CREATE TABLE exam (
	exam_id INT PRIMARY KEY AUTO_INCREMENT,
    code CHAR(8) UNIQUE NOT NULL,
    title VARCHAR(50) UNIQUE NOT NULL,
    category_id INT,
    duration INT NOT NULL,
    creator_id INT,
    create_date DATE NOT NULL DEFAULT(CURRENT_DATE),
    FOREIGN KEY (category_id) REFERENCES category_question(category_id),
    FOREIGN KEY (creator_id) REFERENCES account (account_id)
 );
 
 -- Tạo bảng exam_question
 CREATE TABLE exam_question (
	exam_id INT,
    question_id INT,
    PRIMARY KEY (exam_id, question_id),
    FOREIGN KEY (exam_id) REFERENCES exam (exam_id),
    FOREIGN KEY (question_id) REFERENCES question (question_id) 
 );
 
 
 -- Thêm dữ liệu cho bảng department
 INSERT INTO department (department_name)
 VALUES                 ("Marketing"    ),
						("Sale"         ),
                        ("Bảo vệ"       ),
                        ("Nhân sự"      ),
                        ("Kỹ thuật"     ),
                        ("Tài chính"    ),
                        ("Phó giám đốc" ),
                        ("Thư kí"       ),
                        ("Bán hàng"     ),
                        ("Giám đốc"     );
-- Thêm dữ liệu cho bảng position
INSERT INTO position (position_name )
VALUES               ("Dev"         ),
					 ("Test"        ),
					 ("Scrum Master"),
					 ("PM"          );


-- Thêm dữ liệu cho bảng account
INSERT INTO account (email                           , username      , full_name           , department_id, position_id, create_date)
VALUES              ("haidang29productions@gmail.com", "dangblack"   , "Nguyen Hai Dang"   , 1            , 1          , "2010-03-05"),
                    ("account1@gmail.com"            , "quanganh"    , "Tong Quang Anh"    , 2            , 2          , "2011-03-05"),
                    ("account2@gmail.com"            , "vanchien"    , "Nguyen Van Chien"  , 2            , 3          , "2012-03-07"),
                    ("account3@gmail.com"            , "cocoduongqua", "Duong Do"          , 3            , 4          , "2013-03-08"),
                    ("account4@gmail.com"            , "doccocaubai" , "Nguyen Chien Thang", 5            , 4          , "2014-03-10"),
                    ("dapphatchetngay@gmail.com"     , "khabanh"     , "Ngo Ba Kha"        , 3            , 3          , "2015-04-05"),
                    ("songcodaoly@gmail.com"         , "huanhoahong" , "Bui Xuan Huan"     , 4            , 2          , "2016-04-05"),
                    ("sontungmtp@gmail.com"          , "tungnui"     , "Nguyen Thanh Tung" , 4            , 1          , "2018-04-07"),
                    ("duongghuu@gmail.com"           , "duongghuu"   , "Duong Van Huu"     , 4            , 1          , "2020-04-07"),
                    ("vtiaccademy@gmail.com"         , "vtiaccademy" , "Vi Ti Ai"          , 4            , 1          , "2022-04-09");
-- Thêm dữ liệu cho bảng group
INSERT INTO `group` (group_name         , creator_id, create_date)
VALUES              ("Testing System"   , 4         , "2019-03-05"),
                    ("Developement"     , 4         , "2022-03-07"),
                    ("VTI Sale 01"      , 4         , "2021-03-09"),
                    ("VTI Sale 02"      , 4         , "2016-03-10"),
                    ("VTI Sale 03"      , 3         , "2015-03-28"),
                    ("VTI Creator"      , 2         , "2018-04-06"),
                    ("VTI Marketing 01" , 1         , "2019-04-07"),
                    ("Management"       , 8         , "2017-04-08"),
                    ("Chat with love"   , 9         , "2016-04-09"),
                    ("Vi Ti Ai"         , 10        , "2019-04-10");
                       
-- Thêm dư liệu cho bảng group_account
INSERT INTO group_account   (group_id, account_id, join_date )
VALUES                      (1       , 1         , "2019-03-05"),
                            (1       , 2         , "2020-03-07"),
                            (2       , 3         , "2018-03-09"),
                            (2       , 4         , "2017-03-10"),
                            (2       , 2         , "2020-03-28"),
                            (3       , 8         , "2021-04-06"),
                            (1       , 8         , "2022-04-07"),
                            (2       , 8         , "2022-04-08"),
                            (3       , 9         , "2022-04-09"),
                            (4       , 10        , "2016-04-10");
-- Thêm dữ liệu cho bảng type_question
INSERT INTO type_question (type_name) VALUES ("Essay"), ("Multiple-Choice"); 

-- Thêm dữ liệu cho bảng category_question
INSERT INTO category_question   (category_name)
VALUES                          ("Java"       ),
                                ("ASP.NET"    ),
                                ("ADO.NET"    ),
                                ("SQL"        ),
                                ("Postman"    ),
                                ("Ruby"       ),
                                ("Python"     ),
                                ("C++"        ),
                                ("C Sharp"    ),
                                ("PHP"        ); 

-- Thêm dữ liệu cho bảng question
INSERT INTO question    (content          , category_id, type_id, creator_id, create_date)
VALUES                  ("Câu hỏi về Java", 1          , 1      , 6         , "2020-04-05"),
                        ("Câu Hỏi về PHP" , 10         , 2      , 2         , "2021-04-05"),
                        ("Hỏi về C#"      , 9          , 2      , 6         , "2021-04-06"),
                        ("Hỏi về Ruby"    , 9          , 1      , 2         , "2022-04-06"),
                        ("Hỏi về Postman" , 9          , 1      , 6         , "2022-04-06"),
                        ("Hỏi về ADO.NET" , 2          , 2      , 6         , "2016-04-06"),
                        ("Hỏi về ASP.NET" , 2          , 1      , 2         , "2016-04-06"),
                        ("Hỏi về C++"     , 2          , 1      , 2         , "2017-04-07"),
                        ("Hỏi về SQL"     , 1          , 2      , 3         , "2017-04-07"),
                        ("Hỏi về Python"  , 7          , 1      , 10        , "2018-04-07");
                      


-- Thêm dữ liệu cho bảng answer
INSERT INTO answer  (content     , question_id, is_correct)
VALUES              ("Trả lời 01", 1          , FALSE     ),
                    ("Trả lời 02", 1          , TRUE      ),
                    ("Trả lời 03", 1          , FALSE     ),
                    ("Trả lời 04", 1          , TRUE      ),
                    ("Trả lời 05", 2          , TRUE      ),
                    ("Trả lời 06", 3          , TRUE      ),
                    ("Trả lời 07", 4          , FALSE     ),
                    ("Trả lời 08", 8          , FALSE     ),
                    ("Trả lời 09", 9          , TRUE      ),
                    ("Trả lời 10", 10         , TRUE      );

-- Thêm dữ liệu cho bảng exam
INSERT INTO exam    (code     , title           , category_id, duration, creator_id, create_date)
VALUES              ("VTIQ001", "Đề thi C#"     , 1          , 60      , 7         , "2019-04-05"),
                    ("VTIQ002", "Đề thi PHP"    , 10         , 60      , 1         , "2019-04-05"),
                    ("VTIQ003", "Đề thi C++"    , 5          , 120     , 2         , "2019-04-07"),
                    ("VTIQ004", "Đề thi Java"   , 7          , 60      , 8         , "2015-04-08"),
                    ("VTIQ005", "Đề thi Ruby"   , 4          , 120     , 3         , "2015-04-10"),
                    ("VTIQ006", "Đề thi Postman", 5          , 60      , 6         , "2016-04-05"),
                    ("VTIQ007", "Đề thi SQL"    , 5          , 60      , 8         , "2016-04-05"),
                    ("VTIQ008", "Đề thi Python" , 8          , 60      , 8         , "2022-04-07"),
                    ("VTIQ009", "Đề thi ADO.NET", 4          , 90      , 3         , "2020-04-07"),
                    ("VTIQ010", "Đề thi ASP.NET", 7          , 90      , 10        , "2020-04-08");

-- Thêm dữ liệu cho bảng exam_question
INSERT INTO exam_question   (question_id, exam_id)
VALUES                      (1          , 1      ),
                            (2          , 1      ),
                            (3          , 1      ),
                            (4          , 1      ),
                            (5          , 1      ),
                            (6          , 2      ),
                            (7          , 2      ),
                            (8          , 3      ),
                            (9          , 8      ),
                            (10         , 10     );
