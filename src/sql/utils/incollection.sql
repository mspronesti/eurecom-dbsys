/*
 This file contains the query related
 to the table incollections defined in pubSchema.sql
*/

-- removing the fk constraint (performance)
ALTER TABLE incollection DROP CONSTRAINT inc_fk CASCADE;

-- insert in the "incollection" table defined in the pubSchema
INSERT INTO incollection (__pubid, booktitle, publisher, isbn) (
	SELECT DISTINCT ON (p.__pubid) 
        p.__pubid, 
        booktitle.v, 
        publisher.v, 
        isbn.v
		FROM publication 
        AS p 
        JOIN pub ON (p.__pubkey = pub.k AND pub.p = 'incollection')
			LEFT OUTER JOIN field AS booktitle ON (p.__pubkey = booktitle.k AND booktitle.p = 'booktitle')
			LEFT OUTER JOIN field AS publisher ON (p.__pubkey = publisher.k AND publisher.p = 'publisher')
			LEFT OUTER JOIN field AS isbn ON (p.__pubkey = isbn.k AND isbn.p = 'isbn')
);


-- restore the fk constraint
ALTER TABLE incollection ADD CONSTRAINT inc_fk FOREIGN KEY (__pubid) REFERENCES publication;
