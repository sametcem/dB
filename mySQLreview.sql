CREATE DATABASE acme;

SHOW DATABASES; 
USE ACME;
show tables;

CREATE TABLE users(
id INT AUTO_INCREMENT,
first_name  VARCHAR(100),
last_name VARCHAR(100),
e_mail VARCHAR(75),
password VARCHAR(255),
location VARCHAR(100),
dept VARCHAR(75),
is_admin TINYINT(1),
register_date DATETIME,
PRIMARY KEY(id));

INSERT INTO users(first_name,last_name,e_mail,password,location,dept,is_admin,register_date) 
VALUES ('John','Doe','johndoe@gmail.com','1234567','London','Development',1,now());

select * from users;


INSERT INTO users (first_name, last_name, e_mail, password, location, dept,  is_admin, register_date) values ('Fred', 'Smith', 'fred@gmail.com', '123456', 'New York', 'design', 0, now()), ('Sara', 'Watson', 'sara@gmail.com', '123456', 'New York', 'design', 0, now()),('Will', 'Jackson', 'will@yahoo.com', '123456', 'Rhode Island', 'development', 1, now()),('Paula', 'Johnson', 'paula@yahoo.com', '123456', 'Massachusetts', 'sales', 0, now()),('Tom', 'Spears', 'tom@yahoo.com', '123456', 'Massachusetts', 'sales', 0, now());

select first_name,last_name FROM USERS;
select * from users where location='London' and dept='Development';

SELECT * FROM USERS WHERE IS_ADMIN>0;

DELETE FROM USERS WHERE id=6;
UPDATE USERS SET dept='development' WHERE id=1;

ALTER TABLE USERS
ADD age VARCHAR(3);

ALTER TABLE USERS
MODIFY COLUMN age INT(3);


SELECT * FROM USERS ORDER BY last_name desc;

SELECT CONCAT(first_name,' ',last_name) AS 'Name', dept From users;

select * from users;
SELECT DISTINCT location from users;
SELECT * FROM USERS WHERE age BETWEEN 20 AND 24;


SELECT * FROM USERS WHERE dept NOT LIKE 'd%';

SELECT * FROM USERS WHERE dept IN('design','sales');

CREATE INDEX LINDEX on Users(location);
DROP INDEX LINDEX on users;


CREATE TABLE posts(
id INT auto_increment,
user_id  INT,
title VARCHAR(100),
body text,
publish_date DATETIME default current_timestamp,
PRIMARY KEY(id),
FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO posts(user_id, title, body) VALUES (1, 'Post One', 'This is post one'),(3, 'Post Two', 'This is post two'),(1, 'Post Three', 'This is post three'),(2, 'Post Four', 'This is post four'),(5, 'Post Five', 'This is post five'),(4, 'Post Six', 'This is post six'),(2, 'Post Seven', 'This is post seven'),(1, 'Post Eight', 'This is post eight'),(3, 'Post Nine', 'This is post none'),(4, 'Post Ten', 'This is post ten');

select * from acme.posts;

SELECT
users.first_name,
users.last_name,
posts.title,
posts.publish_date
FROM USERS INNER JOIN POSTS ON users.id = posts.user_id
ORDER BY posts.title;

CREATE TABLE COMMENTS(
	id INT auto_increment,
    post_id INT,
    user_id INT,
    body TEXT,
    publish_date DATETIME DEFAULT current_timestamp,
    PRIMARY KEY(id),
    FOREIGN KEY(post_id) REFERENCES posts(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);


INSERT INTO comments(post_id, user_id, body) VALUES (1, 3, 'This is comment one'),(2, 1, 'This is comment two'),(5, 3, 'This is comment three'),(2, 4, 'This is comment four'),(1, 2, 'This is comment five'),(3, 1, 'This is comment six'),(3, 2, 'This is comment six'),(5, 4, 'This is comment seven'),(2, 3, 'This is comment seven');

select * from comments;

SELECT
comments.body,
posts.title
FROM comments
LEFT JOIN posts ON posts.id = comments.post_id
ORDER BY posts.title;

SELECT
comments.body,
posts.title,
users.first_name,
users.last_name
FROM comments
INNER JOIN posts ON posts.id = comments.post_id
INNER JOIN users ON users.id = comments.user_id
ORDER BY posts.title;


SELECT COUNT(id) FROM USERS;
SELECT MAX(age) FROM USERS;
SELECT MIN(AGE) FROM USERS;
SELECT SUM(AGE) FROM USERS;
SELECT ucase(first_name), lcase(last_name) FROM USERS;

SELECT AGE, COUNT(AGE) FROM USERS GROUP BY AGE;

SELECT LOCATION, COUNT(LOCATION) FROM USERS GROUP BY LOCATION;

SELECT LOCATION, COUNT(LOCATION) FROM USERS WHERE location='New York' GROUP BY LOCATION;



