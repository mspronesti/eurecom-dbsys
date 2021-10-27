/*
  this function retrieves a table (id, name, num_pubs)
  of the top N authors with the largest number of pubblications
  in conference . 
*/
CREATE OR REPLACE FUNCTION top_in_conference (
    N INTEGER, 
    conference TEXT
)
    RETURNS TABLE (
        id INT,
        name TEXT,
        num_pubs BIGINT
    )
    LANGUAGE plpgsql
    AS $$
    BEGIN
    RETURN QUERY
        SELECT
            author.__id, 
            author.name, 
            COUNT(*) as num_pubs
        FROM
            author JOIN wrote ON author.__id = wrote.__id
                   JOIN inproceedings ON wrote.__pubid = inproceedings.__pubid 
                                         AND inproceedings.booktitle = conference
        GROUP BY 
            author.__id 
        ORDER BY num_pubs DESC 
        LIMIT N; 
 END$$;