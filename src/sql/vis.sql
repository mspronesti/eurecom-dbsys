/*
  This file contains a SQL query to produce a set (k,f(k))
  where k = 1, 2, 3, ... and f(k) = number of authors having k pubblications
  and exports these data to a csv file called set_pubs.csv
*/
DROP TABLE IF EXISTS set_pubs;

CREATE TABLE set_pubs AS (
    SELECT 
        k, COUNT(*) pub_count
    FROM (
        SELECT 
        __id, COUNT(*) AS k 
        FROM 
            wrote
        GROUP BY __id 
    ) as auth_pub
    GROUP BY k
    ORDER BY k 
);

\copy set_pubs to 'set_pubs.csv' csv header;
DROP TABLE IF EXISTS set_pubs;