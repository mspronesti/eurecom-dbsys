DROP TABLE IF EXISTS 
		author,
	        publication,
		wrote,
		article,
		book,
		incollection,
		inproceedings;

CREATE TABLE author ( 
	__id INTEGER PRIMARY KEY NOT NULL, 
	name TEXT,
	homepage TEXT
);

CREATE TABLE publication (
	__pubid NUMERIC NOT NULL,
	__pubkey TEXT UNIQUE NOT NULL PRIMARY KEY,
	title TEXT,
	year NUMERIC
);

CREATE TABLE wrote (
   __id INTEGER,
   __pubid TEXT,
   PRIMARY KEY (__id, __pubid),
   FOREIGN KEY (__id) REFERENCES author,
   FOREIGN KEY (__pubid) REFERENCES publication
);

CREATE TABLE article (
	__pubkey TEXT NOT NULL,
	journal TEXT,
	month INT,
	volume INT,
	_number INT,
	FOREIGN KEY (__pubkey) REFERENCES publication 
);

CREATE TABLE book (
	__pubkey TEXT PRIMARY KEY,
	publisher TEXT,
        isbn TEXT,
	FOREIGN KEY (__pubkey) REFERENCES publication
);

CREATE TABLE incollection (
      __pubkey TEXT PRIMARY KEY,	
      booktitle TEXT,
      publisher TEXT,
      isbn TEXT,
      FOREIGN KEY (__pubkey) REFERENCES publication 
);

CREATE TABLE inproceedings (
	__pubkey TEXT PRIMARY KEY,
	booktitle TEXT,
	editor TEXT,
	FOREIGN KEY (__pubkey) REFERENCES publication
);





