# Database Management Systems Implementation
## Lab1 : Data Pipeline
   * [specifications](doc/DBSysLab1_2021.pdf)
   * solution:
     - Database design
       - [ER diagram](lab1/doc/er.pdf)
       - [pubSchema](lab1/src/sql/createPubSchema.sql)
       - [Queries on raw data](lab1/src/sql/solution-raw.sql)
     - Data Transformation
       - [Author](lab1/src/sql/utils/author.sql)
       - [Publication](lab1/src/sql/utils/publication.sql)
       - [Wrote](lab1/src/sql/utils/wrote.sql)
       - [Article](lab1/src/sql/utils/article.sql)
       - [Incollection](lab1/src/sql/utils/incollection.sql)
       - [Inproceedings](lab1/src/sql/utils/inproceedings.sql)
       - [Book](lab1/src/sql/utils/book.sql)
     - Data Analysis
       - [Queries](lab1/src/sql/solution-analysis.sql)
       - [Data visualization](lab1/src/py/histogram.py)

## Lab2 : SimpleDB part I
Implement the core modules of the educational DBMS `SimpleDB`, such as tuples, fields, the Catalog, the BufferPool etc. See the [specifications](lab2/doc/DBSys_Lab2.pdf) for more.

## Lab3 : SimpleDB part II
Expand Lab 2 with join operators (e.g. SMJ, HJ), selection, insertion and deletion operators as well as aggregates. See the [specifications](lab3/doc/DBSys_Lab3.pdf) for more.