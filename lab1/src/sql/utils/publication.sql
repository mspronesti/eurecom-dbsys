/*
 This file contains the query related
 to the table publication defined in pubSchema.sql
*/

-- publications which are not homepages
CREATE TABLE pubs_not_hp AS(
    SELECT DISTINCT ON (k)
        k AS pubkey,
        v AS title
    FROM
        field
    WHERE 
        p = 'title' AND
        v <> 'Home Page'
);

-- join pubs_not_hp with Pub for publication type
CREATE TABLE pub_titles AS(
    SELECT DISTINCT ON (pubkey)
        pubkey,
        title
    FROM
        pubs_not_hp LEFT JOIN Pub ON pubs_not_hp.pubkey = Pub.k  
);

-- pub_years | pubkey | year
CREATE TABLE pub_years AS(
    SELECT
        k as pubkey,
        v AS year
    FROM
        field
    WHERE
        p = 'year'
);

-- join wrt year
CREATE TABLE tmp_pubs AS(
    SELECT DISTINCT ON (pub_titles.pubkey)
        pub_titles.pubkey,
        title,
        year
    FROM
        pub_titles LEFT OUTER JOIN pub_years ON pub_titles.pubkey = pub_years.pubkey  
);

-- insert into "publication" table defined in PubSchema
CREATE SEQUENCE seq;
INSERT INTO publication (
    SELECT NEXTVAL('seq') 
    AS 
        __pubid, 
        pubkey, 
        title, 
        CAST (year AS INTEGER)
    FROM tmp_pubs
);
DROP SEQUENCE seq; 

DROP TABLE IF EXISTS pubs_not_hp, pub_titles, pub_years, tmp_pubs CASCADE;
