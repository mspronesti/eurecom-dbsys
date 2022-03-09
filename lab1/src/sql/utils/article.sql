/*
 This file contains the query related
 to the table book defined in pubSchema.sql
*/

-- removing the fk constraint (performance)
ALTER TABLE article DROP CONSTRAINT art_fk CASCADE;

-- insert in the "article" table defined in the pubSchema
INSERT INTO Article (__pubid, journal, month, volume, _number) (
	SELECT DISTINCT ON (p.__pubid) 
        	p.__pubid, 
        	journal.v, 
        	month.v, 
        	volume.v, 
        	number.v
	FROM publication AS p 
        	JOIN pub ON (p.__pubkey = pub.k AND pub.p = 'article')
		LEFT OUTER JOIN field AS journal ON (p.__pubkey = journal.k AND journal.p = 'journal')
		LEFT OUTER JOIN field AS month ON (p.__pubkey = month.k AND month.p = 'month')
		LEFT OUTER JOIN field AS volume ON (p.__pubkey = volume.k AND volume.p = 'volume')
		LEFT OUTER JOIN field AS number ON (p.__pubkey = number.k AND number.p = 'number')
);

-- restore the fk constraint
ALTER TABLE article ADD CONSTRAINT art_fk FOREIGN KEY (__pubid) REFERENCES publication;
