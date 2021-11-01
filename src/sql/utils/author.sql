/*
 This file contains the query related
 to the table author defined in pubSchema.sql
*/


-- pubkeys referring to homepages
CREATE TABLE homepages AS(
    SELECT DISTINCT
        k AS pubkey
    FROM
        field
    WHERE
        p = 'title' AND
        v = 'Home Page'
);

-- join homepage pubkeys to corresponding URLs 
CREATE TABLE homepages_urls AS(
    SELECT 
        k AS pubkey,
        v AS homepage
    FROM 
        field JOIN homepages ON field.k = homepages.pubkey
    WHERE 
        p = 'url'
);

-- unique authors names having an homepage
CREATE TABLE author_with_hp AS (
    SELECT DISTINCT ON (v)
        v AS name,
        homepage 
    FROM 
        field LEFT JOIN homepages_urls ON field.k = homepages_urls.pubkey
    WHERE 
        p ='author'
);

-- insert into "author" table defined in PubSchema
CREATE SEQUENCE seq; 
INSERT INTO author (
	SELECT NEXTVAL('seq') 
	AS
        __id, name, homepage 
	FROM author_with_hp
);
DROP SEQUENCE seq;

-- drop temporary tables
DROP TABLE IF EXISTS homepages, homepages_urls, author_with_hp CASCADE; 