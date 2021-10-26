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

-- join pubs_not_hp with pub for publication type
CREATE TABLE __tmp1 AS(
    SELECT DISTINCT ON (pubkey)
        pubkey,
        title,
        pub.p AS type
    FROM
        pubs_not_hp LEFT JOIN pub ON pubs_not_hp.pubkey = pub.k  
);

-- __tmp2 | pubkey | year
CREATE TABLE __tmp2 AS(
    SELECT
        k as pubkey,
        v AS year
    FROM
        field
    WHERE
        p = 'year'
);

-- join wrt year
CREATE TABLE __tmp3 AS(
    SELECT DISTINCT ON (__tmp1.pubkey)
        __tmp1.pubkey,
        title,
        year,
    FROM
        __tmp1 LEFT JOIN __tmp2 ON __tmp1.pubkey = __tmp2.pubkey  
);

-- insert into "publication" table defined in PubSchema
CREATE SEQUENCE seq;
INSERT INTO publication (
    SELECT nextval('seq') as 
        __pubid, 
        __pubkey, 
        title, 
        CAST (year AS INTEGER), 
        from __tmp3
);
DROP SEQUENCE seq; 

DROP TABLE IF EXISTS pubs_not_hp, __tmp1, __tmp2, __tmp3 CASCADE;