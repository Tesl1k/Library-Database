GO

USE Library;

GO


CREATE TABLE book
(id INT PRIMARY KEY IDENTITY,
book_name NVARCHAR(55) NOT NULL,
book_year DATE CHECK (YEAR(book_year) >= 1960),
amount INT CHECK (amount >= 0) NOT NULL
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
FOREIGN KEY (book_id)  REFERENCES book (Id)
);

INSERT INTO book(book_name) VALUES ('Муму');
INSERT INTO book(book_name) VALUES ('Живой труп');
INSERT INTO book(book_name) VALUES ('Война и мир');
INSERT INTO book(book_name) VALUES ('Дама с собачкой');
INSERT INTO book(book_name) VALUES ('Винт');
INSERT INTO book(book_name) VALUES ('Беглец');
INSERT INTO book(book_name) VALUES ('Дневной дозор');
INSERT INTO book(book_name) VALUES ('Клинки');
INSERT INTO book(book_name) VALUES ('Воспоминания сладострастника');

INSERT INTO author(surname, first_name) VALUES ('Толстой', 'Лев');
INSERT INTO author(surname, first_name) VALUES ('Чехов', 'Антон');
INSERT INTO author(surname, first_name) VALUES ('Тургенев', 'Иван');
INSERT INTO author(surname, first_name) VALUES ('Васильев', 'Владимир');
INSERT INTO author(surname, first_name) VALUES ('Лукьяненко', 'Сергей');

INSERT INTO book_author(book_id, author_id) VALUES (1, 3);
INSERT INTO book_author(book_id, author_id) VALUES (2, 1);
INSERT INTO book_author(book_id, author_id) VALUES (3, 1);
INSERT INTO book_author(book_id, author_id) VALUES (4, 2);
INSERT INTO book_author(book_id, author_id) VALUES (5, 2);
INSERT INTO book_author(book_id, author_id) VALUES (7, 4);
INSERT INTO book_author(book_id, author_id) VALUES (7, 5);
INSERT INTO book_author(book_id, author_id) VALUES (8, 4);
INSERT INTO book_author(book_id, author_id) VALUES (9, NULL);

INSERT INTO reader(surname, first_name, last_name, date_of_birth, home_address, contact_number) VALUES ('Карижский', 'Илья', 'Николаевич', '2000-03-06', 'г. Москва, ул. Ленина, д. 13, кв. 54', '89637658737');
INSERT INTO reader(surname, first_name, last_name, date_of_birth, home_address, contact_number) VALUES ('Жарков', 'Максим', 'Александрович', '2003-11-12', 'г. Кострома, ул. Пушкина, д. 125, кв. 16', '89108478129');
INSERT INTO reader(surname, first_name, last_name, date_of_birth, home_address, contact_number) VALUES ('Иванов', 'Вадим', 'Сергеевич', '1994-10-02', 'г. Воронеж, ул. Советская, д. 65, кв. 72', '89546478295');
INSERT INTO reader(surname, first_name, last_name, date_of_birth, home_address, contact_number) VALUES ('Петров', 'Константин', 'Романович', '1980-09-08', 'г. Пенза, ул. Первомайская, д. 91, кв. 38', '89159563754');

INSERT INTO ticket(reader_id, book_id) VALUES (1, 1);
INSERT INTO ticket(reader_id, book_id) VALUES (1, 3);
INSERT INTO ticket(reader_id, book_id) VALUES (3, 1);
INSERT INTO ticket(reader_id, book_id) VALUES (3, 2);
INSERT INTO ticket(reader_id, book_id) VALUES (3, 4);
INSERT INTO ticket(reader_id, book_id) VALUES (4, 7);