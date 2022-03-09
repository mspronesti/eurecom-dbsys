/*
 This file contains the query related
 to the table wrote defined in pubSchema.sql
*/

-- author_pkeys | pubkey | author 
CREATE TABLE author_pkeys AS(
    SELECT
        k AS pubkey,
        v AS name
    FROM
        field
    WHERE
        p = 'author'
);

-- join ids from author
-- __tmp | pubkey | name | id
CREATE TABLE __tmp AS(
    SELECT
        author_pkeys.pubkey,
        author_pkeys.name,
        author.__id
    FROM
        author_pkeys LEFT JOIN author ON author_pkeys.name = author.name
);

-- drop fk constraints (performance boost)
ALTER TABLE wrote DROP CONSTRAINT auth_fk;
ALTER TABLE wrote DROP CONSTRAINT pub_fk;

-- insertion in table "wrote" from PubSchema
INSERT INTO wrote (
    SELECT
        __tmp.__id,
        publication.__pubid
    FROM
        __tmp LEFT JOIN publication ON __tmp.pubkey = publication.__pubkey
);

-- restore fk constraint
ALTER TABLE wrote ADD CONSTRAINT auth_fk FOREIGN KEY (__id) REFERENCES author;
ALTER TABLE wrote ADD CONSTRAINT pub_fk FOREIGN KEY (__pubid) REFERENCES publication;

DROP TABLE IF EXISTS author_pkeys, __tmp CASCADE;