/*
 This file contains the query related
 to the table book defined in pubSchema.sql
*/

-- removing the fk constraint (performance)
ALTER TABLE book DROP CONSTRAINT book_fk CASCADE;

INSERT INTO book (__pubid, publisher, isbn) 
(
	SELECT DISTINCT ON (p.__pubid) 
        	p.__pubid, 
        	publisher.v, 
        	isbn.v
	FROM publication AS p 
          JOIN pub ON (p.__pubkey = pub.k AND pub.p = 'book')
	  LEFT OUTER JOIN field AS publisher ON (p.__pubkey = publisher.k AND publisher.p = 'publisher')
	  LEFT OUTER JOIN field AS isbn ON (p.__pubkey = isbn.k AND isbn.p = 'isbn')
);

-- restore the fk constraint
ALTER TABLE book ADD CONSTRAINT book_fk FOREIGN KEY (__pubid) REFERENCES publication;
