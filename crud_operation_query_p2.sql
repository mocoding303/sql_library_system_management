SELECT * from books;

SELECT * from return_status


---PROJECT TASK 

--- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"


INSERT into  books(isbn,book_title,category,rental_price, status, author, publisher)

VALUES('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic',6.00,'yes','Harper Lee','J.B. Lippincott & Co')

SELECT * from books


---Task 2: Update an Existing Member's Address

update members
set member_address ='125 Main st'
where member_id = 'C101'
SELECT * FROM members

---Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.


delete from issued_status
where issued_id = 'IS121'
select * from issued_status

---Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.

select * from issued_status
where issued_emp_id = 'E101'

---Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT issued_member_id,
       count(*) as num_issued_books
from issued_status
group by 1
having count(*) >1


---CTAS
----Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

CREATE TABLE book_counts 

as 

SELECT b.isbn,

b.book_title,

count(ist.issued_id) as no_issued


FROM books as b

JOIN issued_status as ist

ON ist.issued_book_isbn = b.isbn

GROUP by 1,2


SELECT * FROM book_counts


---Task 7. Retrieve All Books in a Specific Category:

SELECT * FROM books
where category = 'Fantasy'


---Task 8: Find Total Rental Income by Category:

select b.category,
       sum (b.rental_price),
	   count(*)

from books as b

join issued_status as ist
on b.isbn = ist.issued_book_isbn
group by 1;

select * from books

where category = 'Dystopian'

--- List Members Who Registered in the Last 180 Days:

SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL '180 days';

insert into members (member_id,member_name,member_address,reg_date)
VALUES ('c119', 'sami' , ' Main street','2025-11-12')


---List Employees with Their Branch Manager's Name and their branch details:

SELECT emp1.*,
     br.manager_id,
	  emp2.emp_name as Manager_name

FROM employees as emp1

JOIN branch as br

ON br.branch_id = emp1.branch_id

JOIN employees as emp2 
ON emp2.emp_id = br.manager_id 

--- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold:

SELECT * FROM books
DROP table if exists expensive_books;
CREATE TABLE expensive_books
as 
(
	select *
	FROM books
	where rental_price > 3
)

SELECT * from expensive_books



---Task 12: Retrieve the List of Books Not Yet Returned


SELECT 
      distinct (ist.issued_book_name)
FROM issued_status as ist
LEFT join return_status as rs
ON ist.issued_id = rs.issued_id
WHERE rs.return_id is null 
