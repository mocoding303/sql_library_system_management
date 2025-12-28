


--- Creating Branch Table 
DROP TABLE if exists branch;

CREATE TABLE branch (

	branch_id varchar(10) PRIMARY KEY,
	manager_id varchar(10),
	branch_address varchar(15),
	contact_no varchar(15)
	
);

DROP TABLE if exists employess;
CREATE TABLE employees
(
	emp_id varchar(10) PRIMARY KEY,
	emp_name varchar(20),
	position varchar(15),
	salary Float ,
	branch_id varchar(10)


);


DROP TABLE if exists books;
CREATE TABLE books     
(
	isbn varchar(20) PRIMARY KEY,
	book_title varchar(60),
	category varchar(20),
	rental_price Float ,
	status varchar(10),
	author varchar(30),
	publisher varchar(30)


);


DROP table if exists members;
CREATE TABLE members (

	member_id varchar(10) primary key,
	member_name varchar(20),
	member_address varchar(20),
	reg_date date



);

DROP table if exists issued_status;
CREATE table issued_status
(

	issued_id varchar(10) primary KEY,
	issued_member_id varchar(10),
	issued_book_name varchar(60),
	issued_date date ,
	issued_book_isbn varchar(25),
	issued_emp_id varchar(10)


);

create table return_status (

return_id varchar(10) PRIMARY key,
issued_id varchar(10),
return_book_name varchar(70),
return_date date,
return_book_isbn varchar(20)

)
