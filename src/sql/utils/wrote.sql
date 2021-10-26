/*
 This file contains the query related
 to the table wrote defined in pubSchema.sql
*/


-- __tmp1 | pubkey | author 
CREATE TABLE __tmp1 AS(
    SELECT
        k AS pubkey,
        v AS name
    FROM
        field
    WHERE
        p = 'author'
);

-- join ids from author
CREATE TABLE __tmp2 AS(
    SELECT
        __tmp1.pubkey,
        __tmp1.name,
        author.__id
    FROM
        __tmp1 LEFT JOIN author ON __tmp1.name = author.name
);

-- join pubid using the pubkey
CREATE TABLE __tmp3 AS(
    SELECT
        __tmp2.__id,
        publication.__pubid
    FROM
        __tmp2 LEFT JOIN publication ON __tmp2.pubkey = publication.__pubkey
);

-- drop fk constraints (performance boost)
ALTER TABLE wrote DROP CONSTRAINT auth_fk;
ALTER TABLE wrote DROP CONSTRAINT pub_fk;

-- insertion in table "wrote" from PubSchema
INSERT INTO wrote (
    SELECT 
        __id, __pubid 
    FROM 
        __tmp3
);

-- restore fk constraint
ALTER TABLE wrote ADD CONSTRAINT auth_fk FOREIGN KEY (__id) REFERENCES author;
ALTER TABLE wrote ADD CONSTRAINT pub_fk FOREIGN KEY (__pubid) REFERENCES publication;

DROP TABLE IF EXISTS __tmp1, __tmp2, __tmp3 CASCADE;