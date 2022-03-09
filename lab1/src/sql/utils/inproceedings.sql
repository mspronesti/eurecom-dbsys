/*
 This file contains the query related
 to the table inproceedings defined in pubSchema.sql
*/

-- removing the fk constraint (performance)
ALTER TABLE inproceedings DROP CONSTRAINT inp_fk CASCADE;

-- insert in the "inproceeding" table defined in the pubSchema
INSERT INTO inproceedings (__pubid, booktitle, editor) 
(
    SELECT DISTINCT ON (p.__pubid) 
        p.__pubid, 
        booktitle.v, 
        editor.v
    FROM publication AS p 
    JOIN pub ON (p.__pubkey = pub.k AND pub.p = 'inproceedings')
	LEFT JOIN field AS booktitle ON (p.__pubkey = booktitle.k AND booktitle.p = 'booktitle')
	LEFT JOIN field AS editor ON (p.__pubkey = editor.k AND editor.p = 'editor')
);

-- restore the fk constraint
ALTER TABLE inproceedings ADD CONSTRAINT inp_fk FOREIGN KEY (__pubid) REFERENCES publication;

