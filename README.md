# Database Management Systems Implementation
## Lab1 : Data Pipeline
   * [requirements](doc/DBSysLab1_2021.pdf)
   * solution:
     - Database design
       - [ER diagram](doc/er.pdf)
       - [pubSchema](src/sql/createPubSchema.sql)
       - [Queries on raw data](src/sql/solution-raw.sql)
     - Data Transformation
       - [Author](src/sql/utils/author.sql)
       - [Publication](src/sql/utils/publication.sql)
       - [Wrote](src/sql/utils/wrote.sql)
       - [Article](src/sql/utils/article.sql)
       - [Incollection](src/sql/utils/incollection.sql)
       - [Inproceedings](src/sql/utils/inproceedings.sql)
       - [Book](src/sql/utils/book.sql)
     - Data Analysis
       - [Queries](src/sql/solution-analysis.sql)
       - [Data visualization](src/py/histogram.py)