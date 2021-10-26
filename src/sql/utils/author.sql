/*
 This file contains the query related
 to the table author defined in pubSchema.sql
*/


-- pubkeys referring to homepages
CREATE TABLE __tmp1 AS(
    SELECT DISTINCT
        k AS pubkey
    FROM
        field
    WHERE
        p = 'title' AND
        v = 'Home Page'
);

-- join homepage pubkeys to corresponding URLs 
CREATE TABLE __tmp2 AS(
    SELECT 
        k as pubkey,
        v as homepage
    FROM 
        field JOIN __tmp1 ON field.k = __tmp1.pubkey
    WHERE 
        p = 'url'
);

-- unique authors names having an homepage
CREATE TABLE __tmp3 AS (
    SELECT DISTINCT ON (v)
        v as name,
        homepage 
    FROM 
        field LEFT JOIN __tmp2 ON field.k = __tmp2.pubkey
    WHERE 
        p='author'
);

-- insert into "author" table defined in PubSchema
CREATE SEQUENCE seq; 
INSERT INTO author (
	SELECT NEXTVAL('seq') 
	AS
        __id, name, homepage 
	FROM __tmp3
);
DROP SEQUENCE seq;

-- drop temporary tables
DROP TABLE IF EXISTS __tmp1, __tmp2, __tmp3 CASCADE; 