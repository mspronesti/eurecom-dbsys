/*
  This file calls the required queries to map the pubSchema
  into the ER diagram designed in the first part of the assignment.  

  NOTES for the reader:
  the mapping into the ER diagram sits on 
  the following philosophy:
  > a certain number of temporary tables are
    created to extract required infos for later joins
  > these tables are joined appropriately depending
    on the data
  > if the table contains a foreign key, it's dropped
    before inserting
  > a PostgreSQL sequence is exploited to insert the
    result into the table
  > the tmp tables and the sequence are dropped
  > the dropped constraints (if any) are restored 

  The naming convention for the table entries follows
  the entries of the dataset (k, v, p, ...).
*/

\i utils/author.sql
\i utils/publication.sql
\i utils/wrote.sql
-- \i utils/article.sql
-- \i utils/book.sql
 \i utils/inproceedings.sql
-- \i utils/incollection.sql

