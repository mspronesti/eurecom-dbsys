DROP TABLE IF EXISTS 
		author,
	    publication,
		wrote,
		article,
		book,
		incollection,
		inproceedings;

CREATE TABLE author ( 
	__id INT PRIMARY KEY, 
	name TEXT,
	homepage TEXT
);

CREATE TABLE publication (
	__pubid INT PRIMARY KEY,
	__pubkey TEXT UNIQUE NOT NULL,
	title TEXT,
	year INT
);

CREATE TABLE wrote (
   __id INT,
   __pubid INT,
   CONSTRAINT auth_fk FOREIGN KEY (__id) REFERENCES author,
   CONSTRAINT pub_fk FOREIGN KEY (__pubid) REFERENCES publication
);

CREATE TABLE article (
	__pubid INT,
	journal TEXT,
	month TEXT,
	volume TEXT,
	_number TEXT,
	CONSTRAINT art_fk FOREIGN KEY (__pubid) REFERENCES publication 
);

CREATE TABLE book (
	__pubid INT,
	publisher TEXT,
    isbn TEXT,
	CONSTRAINT book_fk FOREIGN KEY (__pubid) REFERENCES publication
);

CREATE TABLE incollection (
      __pubid INT,	
      booktitle TEXT,
      publisher TEXT,
      isbn TEXT,
      CONSTRAINT inc_fk FOREIGN KEY (__pubid) REFERENCES publication 
);

CREATE TABLE inproceedings (
	__pubid INT,
	booktitle TEXT,
	editor TEXT,
	CONSTRAINT inp_fk FOREIGN KEY (__pubid) REFERENCES publication
);





