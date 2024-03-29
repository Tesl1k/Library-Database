CREATE DATABASE library

GO

USE Library;

GO


CREATE TABLE book
(id INT PRIMARY KEY IDENTITY,
book_name NVARCHAR(55) NOT NULL,
book_year DATE CHECK (YEAR(book_year) >= 1960),
total_books INT CHECK (total_books >= 0) NOT NULL,
books_now INT CHECK (books_now >= 0)
);

CREATE TABLE author
(id INT PRIMARY KEY IDENTITY, 
surname NVARCHAR(20) NOT NULL,
first_name NVARCHAR(20) NOT NULL,
);

CREATE TABLE book_author
(book_id INT,
author_id INT,
FOREIGN KEY (book_id)  REFERENCES book (Id),
FOREIGN KEY (author_id)  REFERENCES author (Id)
);

CREATE TABLE reader
(id INT PRIMARY KEY IDENTITY,
surname NVARCHAR(20) NOT NULL,
first_name NVARCHAR(20) NOT NULL,
last_name NVARCHAR(20) NOT NULL,
date_of_birth DATE NOT NULL,
home_address NVARCHAR(200) UNIQUE NOT NULL,
contact_number NVARCHAR(20) UNIQUE NOT NULL,
book_amount INT CHECK (book_amount >= 0 AND book_amount <=5)
);

CREATE TABLE ticket
(id INT PRIMARY KEY IDENTITY,
reader_id INT,
book_id INT,
date_of_issue DATE,
return_date DATE,
FOREIGN KEY (reader_id)  REFERENCES reader (Id),
FOREIGN KEY (book_id)  REFERENCES book (Id),
CONSTRAINT r_b UNIQUE (reader_id, book_id)
);

INSERT INTO book(book_name, book_year, total_books) VALUES ('����', '1976-02-11', 34);
INSERT INTO book(book_name, book_year, total_books) VALUES ('����� ����', '1980-02-11', 18);
INSERT INTO book(book_name, book_year, total_books) VALUES ('����� � ���', '1996-02-11', 21);
INSERT INTO book(book_name, book_year, total_books) VALUES ('���� � ��������', '1972-02-11', 28);
INSERT INTO book(book_name, book_year, total_books) VALUES ('����', '1968-02-11', 19);
INSERT INTO book(book_name, book_year, total_books) VALUES ('������', '2003-02-11', 25);
INSERT INTO book(book_name, book_year, total_books) VALUES ('������� �����', '1998-02-11', 31);
INSERT INTO book(book_name, book_year, total_books) VALUES ('������', '2008-02-11', 16);
INSERT INTO book(book_name, book_year, total_books) VALUES ('������������ ���������������', '1993-02-11', 29);

INSERT INTO author(surname, first_name) VALUES ('�������', '���');
INSERT INTO author(surname, first_name) VALUES ('�����', '�����');
INSERT INTO author(surname, first_name) VALUES ('��������', '����');
INSERT INTO author(surname, first_name) VALUES ('��������', '��������');
INSERT INTO author(surname, first_name) VALUES ('����������', '������');

INSERT INTO book_author(book_id, author_id) VALUES (1, 3);
INSERT INTO book_author(book_id, author_id) VALUES (2, 1);
INSERT INTO book_author(book_id, author_id) VALUES (3, 1);
INSERT INTO book_author(book_id, author_id) VALUES (4, 2);
INSERT INTO book_author(book_id, author_id) VALUES (5, 2);
INSERT INTO book_author(book_id, author_id) VALUES (7, 4);
INSERT INTO book_author(book_id, author_id) VALUES (7, 5);
INSERT INTO book_author(book_id, author_id) VALUES (8, 4);
INSERT INTO book_author(book_id, author_id) VALUES (9, NULL);

INSERT INTO reader(surname, first_name, last_name, date_of_birth, home_address, contact_number) VALUES ('���������', '����', '����������', '2000-03-06', '�. ������, ��. ������, �. 13, ��. 54', '89637658737');
INSERT INTO reader(surname, first_name, last_name, date_of_birth, home_address, contact_number) VALUES ('������', '������', '�������������', '2003-11-12', '�. ��������, ��. �������, �. 125, ��. 16', '89108478129');
INSERT INTO reader(surname, first_name, last_name, date_of_birth, home_address, contact_number) VALUES ('������', '�����', '���������', '1994-10-02', '�. �������, ��. ���������, �. 65, ��. 72', '89546478295');
INSERT INTO reader(surname, first_name, last_name, date_of_birth, home_address, contact_number) VALUES ('������', '����������', '���������', '1980-09-08', '�. �����, ��. ������������, �. 91, ��. 38', '89159563754');

INSERT INTO ticket(reader_id, book_id) VALUES (1, 1);
INSERT INTO ticket(reader_id, book_id) VALUES (1, 3);
INSERT INTO ticket(reader_id, book_id) VALUES (3, 1);
INSERT INTO ticket(reader_id, book_id) VALUES (3, 2);
INSERT INTO ticket(reader_id, book_id) VALUES (3, 4);
INSERT INTO ticket(reader_id, book_id) VALUES (4, 7);