--CREATE DATABASE libesys
--USE libesys

CREATE TABLE tbl_publisher (
    publisher_name VARCHAR(100) PRIMARY KEY NOT NULL,
    publisher_address VARCHAR(100) NOT NULL,
    publisher_phone VARCHAR(20) NOT NULL
);

CREATE TABLE tbl_book (
    book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    book_title VARCHAR(200) NOT NULL,
    book_authorid INT,
    book_publisher VARCHAR(100) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_branch (
    branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    branch_name VARCHAR(100) NOT NULL,
    branch_address VARCHAR(100) NOT NULL,
);

CREATE TABLE tbl_author (
    author_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    author_name VARCHAR(100) NOT NULL
); 
/* Not connecting tbl_book.book_id to tbl_author despite assignment as it's more efficient if author names don't repeat */

CREATE TABLE tbl_borrower (
    borrower_cardno BIGINT PRIMARY KEY NOT NULL IDENTITY (10000000000000,1),
    borrower_name VARCHAR(100) NOT NULL,
    borrower_address VARCHAR(100) NOT NULL,
    borrower_phone VARCHAR(20) NOT NULL
);

CREATE TABLE tbl_copies (
    copies_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    copies_bookid INT NOT NULL CONSTRAINT fk_book_id2 FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
    copies_branchid INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
    copies_number INT NOT NULL
);

CREATE TABLE tbl_loans (
    loans_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    loans_bookid INT NOT NULL CONSTRAINT fk_book_id3 FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
    loans_branchid INT NOT NULL CONSTRAINT fk_branch_id2 FOREIGN KEY REFERENCES tbl_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
    loans_cardno BIGINT NOT NULL CONSTRAINT fk_borrower_cardno FOREIGN KEY REFERENCES tbl_borrower(borrower_cardno) ON UPDATE CASCADE ON DELETE CASCADE,
    loans_dateout DATE NOT NULL,
    loans_datedue DATE NOT NULL
);

INSERT INTO tbl_publisher
    (publisher_name, publisher_address, publisher_phone)
    VALUES
    ('MoonDance Press', '142 W 36th St, 4th Floor, New York, NY 10018', '+1.212.779.4972'),
    ('Mission Point Press', '2554 Chandler Rd, Traverse City, MI, 49696', '+1.231.421.9513'),
    ('Picador USA', '175 5th Ave, New York, NY 10010', '+1.800.221.7945'),
    ('Scribner', '1230 6th Ave, New York, NY 10020', '+1.212.698.7000'),
    ('Little, Brown and Company', '237 Park Ave, New York, NY 10017', '+1.800.759.0190'),
    ('Atheneum Books', '1230 6th Ave, New York, NY 10020', '+1.212.698.7000'),
    ('Skyhorse Publishing', '306 W 37th St #11, New York, NY 10018', '+1.212.643.6816'),
    ('Graywolf Press', '250 3rd Ave N, Minneapolis, MN 55401', '+1.651.641.0077'),
    ('Penguin Books', '375 Hudson St, New York, NY 10014', '+1.212.366.2000'),
    ('Ecco', '195 Broadway, New York, NY 10007', '+1.212.207.7000'),
    ('Henry Holt and Company', '175 5th Ave, New York, NY 10010', '+1.646.307.5095'),
    ('Mariner Books', '215 Park Ave S, New York, NY 10003', '+1.800.225.3362'),
    ('Random House', '1745 Broadway, New York, NY 10019', '+1.212.782.9000'),
    ('Simon and Schuster', '1230 6th Ave, New York, NY 10020', '+1.212.698.7000'),
    ('Harry N. Abrams', '195 Broadway, 9th Floor, New York, NY 10007', '+1.212.206.7715'),
    ('Spectra', '1745 Broadway, New York, NY 10019', '+1.212.782.9000'),
    ('Farrar, Straus and Giroux', '18 W 18th St, New York, NY 10011', '+1.212.741.6900'),
    ('Sofawolf Press', 'P.O. Box 11868, Saint Paul, MN 55111', '+1.651.252.4797'),
    ('Riverhead', '375 Hudson St, New York, NY 10014', '+1.212.366.2000'),
    ('Harper Perennial', '195 Broadway, New York, NY 10007', '+1.212.207.7000')
;

INSERT INTO tbl_book
    (book_title, book_authorid, book_publisher)
    VALUES
    ('Get the Scoop on Animal Blood: From Great White Sharks to Blood-Squirting Lizards, 251 Cool Facts', 1, 'MoonDance Press'),
    ('Inside Upnorth: The Complete Tour, Sport and Country Living Guide to Traverse City, Traverse City Area and Leelanau County', 2, 'Mission Point Press'),
    ('The Lost Tribe', 3, 'Picador USA'),
    ('On Writing: A Memoir of the Craft', 4, 'Scribner'),
    ('Theft by Finding', 5, 'Little, Brown and Company'),
    ('The Odyssey of Echo Company', 6, 'Scribner'),
    ('Tehanu', 7, 'Atheneum Books'),
    ('The Brick Bible: The Complete Set', 8, 'Skyhorse Publishing'),
    ('Pastoral', 9, 'Graywolf Press'),
    ('The Conference of the Birds', 10, 'Penguin Books'),
    ('Book of Longing', 11, 'Ecco'),
    ('In Harm''s Way: The Sinking of the U.S.S. Indianapolis and the Extraordinary Story of Its Survivors', 6, 'Henry Holt and Company'),
    ('Are You My Mother?', 12, 'Mariner Books'),
    ('Fear and Loathing in Las Vegas', 13, 'Random House'),
    ('Hell''s Angels: The Strange and Terrible Saga of the Outlaw Motorcycle Gangs', 13, 'Random House'),
    ('The Rum Diary', 13, 'Simon and Schuster'),
    ('Gonzo: A Graphic Biography', 14, 'Harry N. Abrams'),
    ('Doomsday Book', 15, 'Spectra'),
    ('Hild', 16, 'Farrar, Straus and Giroux'),
    ('Digger: The Complete Omnibus Edition', 17, 'Sofawolf Press'),
    ('The Brief Wondrous Life of Oscar Wao', 18, 'Riverhead'),
    ('Everyone''s an Aliebn When Ur a Aliebn Too: A Book', 19, 'Harper Perennial')
;

INSERT INTO tbl_branch
    (branch_name, branch_address)
    VALUES
    ('Sharpstown', '7760 Clarewood Dr, Houston, TX 77036'),
    ('Central', '1000 4th Ave, Seattle, WA 98104'),
    ('Columbia', '4721 Rainier Ave S, Seattle, WA 98118'),
    ('Lake City', '12501 28th Ave NE, Seattle, WA 98125')
;

INSERT INTO tbl_borrower
    (borrower_name, borrower_address, borrower_phone)
    VALUES
    ('Violent Orangutan', '13 Rue Morgue, Seattle, WA 98104', '+1.123.456.7890'),
    ('Hambrey Pabre', '4 Privet Dr, Seattle, WA 98104', '+1.012.345.6789'),
    ('Shadrack Helms', '221B Baker St, Seattle, WA 98118', '+1.901.234.5678'),
    ('Dotty Galp', '7 Yellow Brick Rd, Seattle, WA 98118', '+1.890.123.4567'),
    ('Frudu Bargains', '9 Bagshot Row, Seattle, WA 98125', '+1.789.012.3456'),
    ('Tweedy Sod', '186 Fleet St, Seattle, WA 98125', '+1.678.901.2345'),
    ('Aves Grandicus', '2 Sesame Street, Houston, TX 77036', '+1.567.890.1234'),
    ('B.A. Ninglish', '96 Avenue Q, Houston, TX 77036', '+1.456.789.0123'),
    ('Bellicose Loom', '7 Eccles St, Houston, TX 77036', '+1.345.678.9012'),
    ('Krispy Fronuts', '1428 Elm St, Houston, TX 77036', '+1.234.567.8901'),
    ('Phil Literate', 'Cant Rd, Houston, TX 77036', '+1.123.456.7891')
;

INSERT INTO tbl_author
    (author_name)
    VALUES
    ('Dawn Cusick'),
    ('Heather Shaw et al.'),
    ('Mark Lee'),
    ('Stephen King'),
    ('David Sedaris'),
    ('Doug Stanton'),
    ('Ursula K. LeGuin'),
    ('Brendan Powell Smith'),
    ('Carl Phillips'),
    ('Peter Sis'),
    ('Leonard Cohen'),
    ('Alison Bechdel'),
    ('Hunter S. Thompson'),
    ('Will Bingley'),
    ('Connie Willis'),
    ('Nicola Griffith'),
    ('Ursula Vernon'),
    ('Junot Diaz'),
    ('Jomny Sun')
;

INSERT INTO tbl_copies
    (copies_bookid, copies_branchid, copies_number)
    VALUES
    (1, 1, 3),
    (1, 2, 2),
    (1, 3, 2),
    (1, 4, 2),
    (2, 1, 3),
    (2, 2, 2),
    (2, 3, 2),
    (2, 4, 2),
    (3, 1, 3),
    (3, 2, 1),
    (3, 3, 2),
    (3, 4, 2),
    (4, 1, 2),
    (4, 2, 3),
    (4, 3, 2),
    (4, 4, 2),
    (5, 1, 2),
    (5, 2, 3),
    (5, 3, 2),
    (5, 4, 2),
    (6, 1, 2),
    (6, 2, 3),
    (6, 3, 2),
    (6, 4, 2),
    (7, 1, 2),
    (7, 2, 2),
    (7, 3, 2),
    (7, 4, 2),
    (8, 1, 2),
    (8, 2, 2),
    (8, 3, 2),
    (8, 4, 2),
    (9, 1, 2),
    (9, 2, 2),
    (9, 3, 2),
    (9, 4, 2),
    (10, 1, 2),
    (10, 2, 2),
    (10, 3, 2),
    (10, 4, 2),
    (11, 1, 2),
    (11, 2, 2),
    (11, 3, 2),
    (11, 4, 2),
    (12, 1, 2),
    (12, 2, 2),
    (12, 3, 2),
    (12, 4, 2),
    (13, 1, 2),
    (13, 2, 2),
    (13, 3, 2),
    (13, 4, 2),
    (14, 1, 2),
    (14, 2, 2),
    (14, 3, 2),
    (14, 4, 2),
    (15, 1, 2),
    (15, 2, 2),
    (15, 3, 2),
    (15, 4, 2),
    (16, 1, 2),
    (16, 2, 2),
    (16, 3, 2),
    (16, 4, 2),
    (17, 1, 2),
    (17, 2, 2),
    (17, 3, 2),
    (17, 4, 2),
    (18, 1, 2),
    (18, 2, 2),
    (18, 3, 2),
    (18, 4, 2),
    (19, 1, 2),
    (19, 2, 2),
    (19, 3, 2),
    (19, 4, 2),
    (20, 1, 2),
    (20, 2, 2),
    (20, 3, 2),
    (20, 4, 2),
    (21, 1, 2),
    (21, 2, 2),
    (21, 3, 2),
    (21, 4, 2),
    (22, 1, 2),
    (22, 2, 2),
    (22, 3, 2),
    (22, 4, 2)
;

INSERT INTO tbl_loans
    (loans_bookid, loans_branchid, loans_cardno, loans_dateout, loans_datedue)
    VALUES
    (1, 1, 10000000000000, '2017-11-6', '2017-11-27'),
    (2, 1, 10000000000000, '2017-11-6', '2017-11-27'),
    (3, 1, 10000000000000, '2017-11-6', '2017-11-27'),
    (4, 1, 10000000000000, '2017-11-6', '2017-11-27'),
    (5, 1, 10000000000000, '2017-11-6', '2017-11-27'),
    (6, 1, 10000000000000, '2017-11-6', '2017-11-27'),
    (7, 2, 10000000000001, '2017-11-7', '2017-11-28'),
    (8, 2, 10000000000001, '2017-11-7', '2017-11-28'),
    (9, 2, 10000000000001, '2017-11-7', '2017-11-28'),
    (10, 2, 10000000000001, '2017-11-7', '2017-11-28'),
    (11, 2, 10000000000001, '2017-11-7', '2017-11-28'),
    (12, 2, 10000000000001, '2017-11-7', '2017-11-28'),
    (13, 3, 10000000000002, '2017-11-27', '2017-12-19'),
    (14, 3, 10000000000002, '2017-11-27', '2017-12-19'),
    (15, 3, 10000000000002, '2017-11-27', '2017-12-19'),
    (16, 3, 10000000000002, '2017-11-27', '2017-12-19'),
    (17, 3, 10000000000002, '2017-11-27', '2017-12-19'),
    (18, 4, 10000000000003, '2017-11-27', '2017-12-19'),
    (19, 4, 10000000000003, '2017-11-27', '2017-12-19'),
    (20, 4, 10000000000003, '2017-11-27', '2017-12-19'),
    (21, 4, 10000000000003, '2017-11-27', '2017-12-19'),
    (22, 4, 10000000000003, '2017-11-27', '2017-12-19'),
    (1, 1, 10000000000004, '2017-11-27', '2017-12-19'),
    (2, 1, 10000000000004, '2017-11-27', '2017-12-19'),
    (3, 1, 10000000000004, '2017-11-27', '2017-12-19'),
    (4, 1, 10000000000004, '2017-11-27', '2017-12-19'),
    (5, 1, 10000000000004, '2017-11-27', '2017-12-19'),
    (6, 2, 10000000000005, '2017-11-27', '2017-12-19'),
    (7, 2, 10000000000005, '2017-11-27', '2017-12-19'),
    (8, 2, 10000000000005, '2017-11-27', '2017-12-19'),
    (9, 2, 10000000000005, '2017-11-27', '2017-12-19'),
    (10, 2, 10000000000005, '2017-11-27', '2017-12-19'),
    (11, 3, 10000000000006, '2017-11-27', '2017-12-19'),
    (12, 3, 10000000000006, '2017-11-27', '2017-12-19'),
    (13, 3, 10000000000006, '2017-11-27', '2017-12-19'),
    (14, 3, 10000000000006, '2017-11-27', '2017-12-19'),
    (15, 3, 10000000000006, '2017-11-27', '2017-12-19'),
    (16, 4, 10000000000007, '2017-11-27', '2017-12-19'),
    (17, 4, 10000000000007, '2017-11-27', '2017-12-19'),
    (18, 4, 10000000000007, '2017-11-27', '2017-12-19'),
    (19, 4, 10000000000007, '2017-11-27', '2017-12-19'),
    (20, 4, 10000000000007, '2017-11-27', '2017-12-19'),
    (21, 1, 10000000000008, '2017-11-27', '2017-12-19'),
    (22, 1, 10000000000008, '2017-11-27', '2017-12-19'),
    (1, 1, 10000000000008, '2017-11-27', '2017-12-19'),
    (2, 1, 10000000000008, '2017-11-27', '2017-12-19'),
    (3, 1, 10000000000008, '2017-11-27', '2017-12-19'),
    (4, 2, 10000000000009, '2017-11-27', '2017-12-19'),
    (5, 2, 10000000000009, '2017-11-27', '2017-12-19'),
    (6, 2, 10000000000009, '2017-11-27', '2017-12-19')
;

/*
SELECT * FROM tbl_publisher;
SELECT * FROM tbl_book;
SELECT * FROM tbl_branch;
SELECT * FROM tbl_borrower;
SELECT * FROM tbl_author;
SELECT * FROM tbl_copies;
SELECT * FROM tbl_loans;
*/

/* SPROC 1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */
CREATE PROC dbo.uspGetSharpstownLostTribeCopies AS
SELECT SUM(copies_number) AS 'Sharpstown copies of "The Lost Tribe"'
FROM tbl_copies
WHERE copies_bookid = 3 AND copies_branchid = 1;
GO

--EXEC dbo.uspGetSharpstownLostTribeCopies

/* 2. How many copies of the book titled "The Lost Tribe" are owned by each library branch? */
CREATE PROC dbo.uspGetLostTribeCopiesPerBranch AS
SELECT a1.copies_number AS 'Copies of "The Lost Tribe', a2.branch_name AS 'Branch Name'
FROM tbl_copies a1
INNER JOIN tbl_branch a2 ON a1.copies_branchid = a2.branch_id
WHERE copies_bookid = 3;
GO

--EXEC dbo.uspGetLostTribeCopiesPerBranch

/* 3. Retrieve the names of all borrowers who do not have any books checked out. */
CREATE PROC dbo.uspGetBooklessBorrowers AS
SELECT a1.borrower_name AS 'No Books Checked Out'
FROM tbl_borrower a1
LEFT OUTER JOIN tbl_loans a2 ON a1.borrower_cardno = a2.loans_cardno
WHERE a2.loans_cardno IS NULL;
GO

--EXEC dboPROC dbo.uspGetBooklessBorrowers

/* 4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address. */
CREATE PROC dbo.uspGetSharpstownDueBorrowers AS
SELECT a1.book_title AS 'Books Due Today at Sharpstown', a2.borrower_name AS 'Borrower', a2.borrower_address AS 'Borrower Address'
FROM tbl_borrower a2
INNER JOIN tbl_loans a3 ON a3.loans_cardno = a2.borrower_cardno
INNER JOIN tbl_book a1 ON a1.book_id = a3.loans_bookid
WHERE a3.loans_datedue = CAST(CURRENT_TIMESTAMP AS DATE);
GO

--EXEC dbo.uspGetSharpstownDueBorrowers

/* 5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch. */
CREATE PROC dbo.uspGetTotalLoansByBranch AS
SELECT a1.branch_name AS 'Branch Name', COUNT(a2.loans_bookid) AS 'Books Loaned Out'
FROM tbl_branch a1
RIGHT OUTER JOIN tbl_loans a2 ON a1.branch_id = a2.loans_branchid
GROUP BY a1.branch_name;
GO

--EXEC dbo.uspGetTotalLoansByBranch

/* 6. Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. */
CREATE PROC dbo.uspGetBorrowOverFiveNameAdress AS
SELECT a1.borrower_name AS 'Borrower Name', a1.borrower_address AS 'Borrower Address', COUNT(a2.loans_bookid) AS 'Books Borrowed'
FROM tbl_borrower a1
INNER JOIN tbl_loans a2 ON a1.borrower_cardno = a2.loans_cardno
GROUP BY a1.borrower_name, a1.borrower_address
HAVING COUNT(a2.loans_bookid) > 5;
GO

--EXEC dbo.uspGetBorrowOverFiveNameAdress

/* 7. For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central". */
CREATE PROC dbo.uspCentralGetKingTitleCopies AS
SELECT a1.book_title AS 'Stephen King Title', a2.copies_number AS '# of Copies at Central'
FROM tbl_book a1
INNER JOIN tbl_copies a2 ON a2.copies_bookid = a1.book_id
WHERE a2.copies_branchid = 2 AND a1.book_authorid = 4;
GO

--EXEC dbo.uspCentralGetKingTitleCopies