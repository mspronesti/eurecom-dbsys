/*
  this function retrieves a table (id, name)
  of the authors who published at least N
  papers in conf1 and never published in conf2
*/
CREATE OR REPLACE FUNCTION at_least_except (
    N INTEGER,  
    conf1 TEXT, 
    conf2 TEXT  
)
    RETURNS TABLE (
        id INT,
        name TEXT
    )
    LANGUAGE plpgsql
    AS $$
    BEGIN
    RETURN QUERY
        SELECT
            author.__id, author.name
        FROM
        author JOIN wrote ON author.__id = wrote.__id
               JOIN inproceedings ON wrote.__pubid = inproceedings.__pubid 
                                 AND inproceedings.booktitle = conf1
        GROUP By author.__id
        HAVING COUNT(*) >= N
        EXCEPT
        SELECT
            author.__id, 
            author.name
        FROM
            author JOIN wrote ON author.__id = wrote.__id
                   JOIN inproceedings ON wrote.__pubid = inproceedings.__pubid 
                                         AND inproceedings.booktitle = conf2;
END$$;