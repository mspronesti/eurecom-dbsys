-- Find the top 20 authors with the largest number of publications 
SELECT 
	author.name, COUNT(*) as num_pubs 
FROM 
	wrote JOIN author ON wrote.__id = author.__id
GROUP BY 
	author.__id, author.name 
ORDER BY num_pubs DESC LIMIT 20;
/*
         name         | num_pubs 
----------------------+----------
 H. Vincent Poor      |     2317
 Mohamed-Slim Alouini |     1766
 Philip S. Yu         |     1631
 Wei Zhang            |     1593
 Wei Wang             |     1561
 Yu Zhang             |     1505
 Lajos Hanzo          |     1486
 Yang Liu             |     1482
 Lei Zhang            |     1387
 Lei Wang             |     1337
 Xin Wang             |     1337
 Zhu Han              |     1337
 Victor C. M. Leung   |     1323
 Wen Gao 0001         |     1317
 Dacheng Tao          |     1279
 Hai Jin 0001         |     1274
 Witold Pedrycz       |     1263
 Wei Li               |     1250
 Jun Wang             |     1229
 Luca Benini          |     1199
(20 rows)
*/


-- Find the top 20 authors with the largest number 
-- of pubblications in STOC. 

\i utils/top_in_conference.sql
SELECT top_in_conference(20, 'STOC');

/*
            top_in_conference            
-----------------------------------------
 (255178,"Avi Wigderson",58)
 (2162114,"Robert Endre Tarjan",33)
 (2107427,"Ran Raz",30)
 (1909714,"Noam Nisan",29)
 (1810568,"Moni Naor",29)
 (2611239,"Uriel Feige",28)
 (2087371,"Rafail Ostrovsky",27)
 (2262925,"Santosh S. Vempala",27)
 (2630499,"Venkatesan Guruswami",26)
 (1751534,"Mihalis Yannakakis",26)
 (788821,"Frank Thomson Leighton",25)
 (1925811,"Oded Goldreich 0001",25)
 (2048491,"Prabhakar Raghavan",24)
 (1757304,"Mikkel Thorup",24)
 (457853,"Christos H. Papadimitriou",24)
 (1814777,"Moses Charikar",23)
 (2810918,"Yin Tat Lee",23)
 (2176490,"Rocco A. Servedio",22)
 (1550363,"Madhu Sudan",22)
 (1912102,"Noga Alon",22)
 (20 rows)
*/

-- Repeat for one more conferences of your choice 
-- (e.g. SIGMOD or VLDB)
-- choice: SIGMOD (actual entry in the db 'SIGMOD Conference')
SELECT top_in_conference(20, 'SIGMOD Conference');
/*
          top_in_conference           
--------------------------------------
 (2465036,"Surajit Chaudhuri",59)
 (606844,"Divesh Srivastava",55)
 (1016385,"H. V. Jagadish",51)
 (1133378,"Jeffrey F. Naughton",46)
 (1727762,"Michael J. Carey 0001",44)
 (286357,"Beng Chin Ooi",44)
 (1728006,"Michael J. Franklin",43)
 (1736411,"Michael Stonebraker",42)
 (1172894,"Jiawei Han 0001",40)
 (553512,"David J. DeWitt",40)
 (618676,"Donald Kossmann",39)
 (1219270,"Johannes Gehrke",38)
 (943003,"Hector Garcia-Molina",38)
 (2089340,"Raghu Ramakrishnan",37)
 (2249433,"Samuel Madden",37)
 (2554543,"Tim Kraska",36)
 (891496,"Guoliang Li 0001",36)
 (535548,"Dan Suciu",36)
 (1269004,"Joseph M. Hellerstein",36)
 (1392714,"Kian-Lee Tan",33)
(20 rows)
*/

-- Find all authors who published at least 10 SIGMOD papers but
-- never published a PODS paper
\i utils/at_least_except.sql
SELECT at_least_except(10, 'SIGMOD Conference', 'PODS');
/*
          at_least_except           
------------------------------------
(1049500,"Ion Stoica")
(1177988,"Jignesh M. Patel")
(829880,"Georgia Koutrika")
(675330,"Elke A. Rundensteiner")
(308985,"Bin Cui 0001")
(1382474,"Kevin Chen-Chuan Chang")
(276712,"Barzan Mozafari")
(2235112,"Sailesh Krishnamurthy")
(1423832,"Krithi Ramamritham")
(605508,"Dirk Habich")
(178073,"AnHai Doan")
(481114,"Clement T. Yu")
(2662513,"Volker Markl")
(1355541,"Kaushik Chakrabarti")
(2419707,"Stanley B. Zdonik")
(1488323,"Lijun Chang")
(366982,"Carlos Ordonez 0001")
(1790758,"Mohamed F. Mokbel")
(323762,"Boon Thau Loo")
(896794,"Guy M. Lohman")
(1187192,"Jingren Zhou")
(811878,"Gao Cong")
(2525621,"Themis Palpanas")
(1727751,"Michael J. Cafarella")
(1047537,"Ioana Manolescu")
(1852633,"Nan Tang 0001")
(2452228,"Sudipto Das")
(2734640,"Xiaofang Zhou 0001")
(2554543,"Tim Kraska")
(1385372,"Kevin S. Beyer")
(199124,"Anthony K. H. Tung")
(920080,"Hans-Arno Jacobsen")
(322266,"Bolin Ding")
(28862,"Aditya G. Parameswaran")
(1884513,"Nick Roussopoulos")
(1251924,"Jorge-Arnulfo Quiané-Ruiz")
(715144,"Eugene Wu 0002")
(1033505,"Ihab F. Ilyas")
(2583865,"Torsten Grust")
(166637,"Andrew Pavlo")
(1167957,"Jiannan Wang")
(45542,"Ahmed K. Elmagarmid")
(2777665,"Yanlei Diao")
(2746102,"Xifeng Yan")
(117922,"Alvin Cheung")
(810836,"Gang Chen 0001")
(2806851,"Yinghui Wu")
(1181036,"Jim Gray 0001")
(2115399,"Raymond Chi-Wing Wong")
(1086026,"James Cheng")
(1294204,"Juliana Freire")
(618676,"Donald Kossmann")
(1466645,"Lei Chen 0002")
(2408954,"Sourav S. Bhowmick")
(861129,"Goetz Graefe")
(239922,"Ashraf Aboulnaga")
(1702871,"Meihui Zhang")
(2805071,"Yinan Li")
(362550,"Carlo Curino")
(2903528,"Zhifeng Bao")
(2899329,"Zhenjie Zhang")
(1256732,"José A. Blakeley")
(1165978,"Jianhua Feng")
(2686691,"Wei Wang 0011")
(264475,"Badrish Chandramouli")
(374282,"Carsten Binnig")
(1818098,"Mourad Ouzzani")
(1534456,"Luis Gravano")
(2760427,"Xu Chu")
(2457037,"Suman Nath")
(406384,"Chee Yong Chan")
(140664,"Anastasia Ailamaki")
(699658,"Eric Lo 0001")
(1118003,"Jayavel Shanmugasundaram")
(816843,"Gautam Das 0001")
(1311661,"Jun Yang 0001")
(2737622,"Xiaokui Xiao")
(342388,"Bruce G. Lindsay 0001")
(2643949,"Viktor Leis")
(1542150,"Lu Qin")
(99875,"Alfons Kemper")
(2720927,"Wook-Shin Han")
(749027,"Feifei Li 0001")
(2425356,"Stefano Ceri")
(2605439,"Ugur Çetintemel")
(351983,"Byron Choi")
(310441,"Bingsheng He")
(744530,"Fatma Özcan")
(2249433,"Samuel Madden")
(1736411,"Michael Stonebraker")
(2861,"Aaron J. Elmore")
(1426009,"K. Selçuk Candan")
(2372391,"Sihem Amer-Yahia")
(2073532,"Qiong Luo 0001")
(1168129,"Jian Pei")
(1135388,"Jeffrey Xu Yu")
(1167252,"Jianliang Xu")
(523716,"Daniel J. Abadi")
(1887031,"Nicolas Bruno")
(2360734,"Shuigeng Zhou")
(1172894,"Jiawei Han 0001")
(2751949,"Xin Luna Dong")
(409763,"Chengkai Li")
(233769,"Arun Kumar 0001")
(1041070,"Immanuel Trummer")
(487301,"Cong Yu 0001")
(1852896,"Nan Zhang 0004")
(2526704,"Theodoros Rekatsinas")
(891496,"Guoliang Li 0001")
(2005817,"Peter A. Boncz")
(2447577,"Stratos Idreos")
(1143262,"Jens Teubner")
(545674,"David B. Lomet")
(113 rows)
*/



-- Find all authors who published at least 5 PODS paper but never 
-- published a SIGMOD paper
SELECT at_least_except(5, 'PODS', 'SIGMOD Conference');
/*
          at_least_except           
------------------------------------
 (1677314,"Matthias Niewerth")
 (1407390,"Kobbi Nissim")
 (496341,"Cristian Riveros")
 (1750317,"Miguel Romero 0001")
 (2542062,"Thomas Schwentick")
 (614326,"Domagoj Vrgoc")
 (65545,"Alan Nash")
 (153201,"Andreas Pieris")
 (1731698,"Michael Mitzenmacher")
 (2124820,"Reinhard Pichler")
 (777194,"Francesco Scarcello")
 (2627457,"Vassos Hadzilacos")
 (1135925,"Jef Wijsen")
 (1890816,"Nicole Schweikardt")
 (1587031,"Marco A. Casanova")
 (248031,"Atri Rudra")
 (1337607,"Kari-Jouko Räihä")
 (2420648,"Stavros S. Cosmadakis")
 (855020,"Giuseppe De Giacomo")
 (1641605,"Martin Grohe")
 (1757886,"Mikolaj Bojanczyk")
 (1588380,"Marco Console")
 (1005321,"Hubie Chen")
 (1850515,"Nancy A. Lynch")
 (2413390,"Srikanta Tirthapura")
 (675303,"Eljas Soisalon-Soininen")
 (2110990,"Rasmus Pagh")
 (559780,"David P. Woodruff")
 (1912085,"Nofar Carmeli")
(29 rows)
*/

/* Extra credit:
   a decade is a sequence of ten consecutive years, e.g. 1982, 1983, ...,
   1991. For each decade, find the most prolific author in that decade 
   across all venue. Hint: you may want to first compute a temporary table,
   storing for each decade and each author the number of pubblications of 
   that author in that decade. Consider computing a temporary table of coauthors.
   This query will take a few minutes to run.
*/

/*
  NOTE for the reader:
  I interpreted the requirements as follows:
  "find FOR EACH POSSIBLE DECADE the top author(s)"
   hence I considered the decades
   1936-1945
   1937-1946
   1938-1947
   1939-1948
   ...
   2013-2022
*/

-- associate num_pubs to author id on each year
CREATE TABLE __tmp1 AS (
    SELECT 
        CAST(p.year AS INT), 
        wrote.__id id, 
        COUNT(__pubkey) num_pubs
    FROM 
        publication AS p 
    INNER JOIN wrote ON p.__pubid = wrote.__pubid
    WHERE 
        p.year IS NOT NULL
    GROUP BY p.year, wrote.__id
);


WITH __tmp2 AS (
    SELECT t1.year AS decade_start_year, 
           t1.id, 
           SUM(t2.num_pubs) AS total
    FROM 
        __tmp1 AS t1 
        INNER JOIN __tmp1 AS t2 ON t1.id = t2.id
    WHERE 
        t1.year <= t2.year AND t2.year < t1.year + 10 
    GROUP BY t1.year, t1.id
    )
    SELECT 
        decade_start_year, 
        id, 
        name,
        total
    FROM 
        __tmp2 JOIN author ON __tmp2.id = author.__id
    WHERE 
        (decade_start_year, total) IN (
            SELECT 
                decade_start_year, 
                MAX(total)
            FROM __tmp2
            GROUP BY decade_start_year
);

DROP TABLE IF EXISTS __tmp1;

/*
 decade_start_year |   id    |          name           | total 
-------------------+---------+-------------------------+-------
              1936 | 2703801 | Willard Van Orman Quine |    12
              1937 | 2703801 | Willard Van Orman Quine |    12
              1938 | 2703801 | Willard Van Orman Quine |    12
              1939 | 1120816 | J. C. C. McKinsey       |    10
              1940 | 2703801 | Willard Van Orman Quine |    10
              1941 |  791699 | Frederic Brenton Fitch  |    10
              1941 | 2703801 | Willard Van Orman Quine |    10
              1942 |  791699 | Frederic Brenton Fitch  |    10
              1943 | 1874249 | Nelson Goodman          |     5
              1943 | 2157085 | R. M. Martin            |     5
              1944 |  791699 | Frederic Brenton Fitch  |    10
              1945 | 2703801 | Willard Van Orman Quine |    14
              1946 | 2703801 | Willard Van Orman Quine |    13
              1947 | 2703801 | Willard Van Orman Quine |    13
              1948 |  927178 | Hao Wang 0001           |    14
              1949 |  475056 | Claude E. Shannon       |    11
              1949 | 1233522 | John R. Myhill          |    11
              1950 |  927178 | Hao Wang 0001           |    14
              1951 | 1233522 | John R. Myhill          |     9
              1952 |  927178 | Hao Wang 0001           |    12
              1952 | 1235894 | John W. Carr III        |    12
              1953 |  927178 | Hao Wang 0001           |    11
              1954 |  932762 | Harry D. Huskey         |    25
              1955 |  322119 | Boleslaw Sobocinski     |    32
              1956 |   64961 | Alan J. Perlis          |    20
              1956 | 1874377 | Nelson M. Blachman      |    20
              1957 | 2276334 | Saul Gorn               |    30
              1958 | 2311694 | Seymour Ginsburg        |    29
              1959 | 2311694 | Seymour Ginsburg        |    34
              1960 |  956934 | Henry C. Thacher Jr.    |    39
              1961 |  295270 | Bernard A. Galler       |    37
              1961 |  956934 | Henry C. Thacher Jr.    |    37
              1962 |  295270 | Bernard A. Galler       |    35
              1962 | 2311694 | Seymour Ginsburg        |    35
              1963 | 2311694 | Seymour Ginsburg        |    38
              1964 |  834959 | Gerard Salton           |    39
              1964 | 2311694 | Seymour Ginsburg        |    39
              1965 | 1133242 | Jeffrey D. Ullman       |    63
              1966 | 1133242 | Jeffrey D. Ullman       |    73
              1967 | 1133242 | Jeffrey D. Ullman       |    80
              1968 | 1133242 | Jeffrey D. Ullman       |    85
              1969 | 1133242 | Jeffrey D. Ullman       |    79
              1970 |  262805 | Azriel Rosenfeld        |    80
              1970 | 1133242 | Jeffrey D. Ullman       |    80
              1971 |  875752 | Grzegorz Rozenberg      |    99
              1972 |  875752 | Grzegorz Rozenberg      |   122
              1973 |  875752 | Grzegorz Rozenberg      |   138
              1974 |  262805 | Azriel Rosenfeld        |   151
              1975 |  262805 | Azriel Rosenfeld        |   157
              1976 |  262805 | Azriel Rosenfeld        |   157
              1977 |  262805 | Azriel Rosenfeld        |   158
              1978 |  262805 | Azriel Rosenfeld        |   158
              1979 |  262805 | Azriel Rosenfeld        |   164
              1980 |  262805 | Azriel Rosenfeld        |   172
              1981 |  262805 | Azriel Rosenfeld        |   183
              1982 |  262805 | Azriel Rosenfeld        |   175
              1983 |  262805 | Azriel Rosenfeld        |   165
              1984 | 1741360 | Micha Sharir            |   161
              1985 | 1741360 | Micha Sharir            |   180
              1986 | 1741360 | Micha Sharir            |   190
              1987 | 1741360 | Micha Sharir            |   198
              1988 |  553592 | David J. Evans 0001     |   220
              1989 |  553592 | David J. Evans 0001     |   235
              1990 | 2586517 | Toshio Fukuda           |   256
              1991 | 2586517 | Toshio Fukuda           |   284
              1992 | 2586517 | Toshio Fukuda           |   293
              1993 | 2586517 | Toshio Fukuda           |   301
              1994 | 2542191 | Thomas S. Huang         |   300
              1995 | 2542191 | Thomas S. Huang         |   327
              1996 | 2542191 | Thomas S. Huang         |   351
              1997 | 2542191 | Thomas S. Huang         |   386
              1998 | 2692080 | Wen Gao 0001            |   440
              1999 | 2692080 | Wen Gao 0001            |   502
              2000 | 2692080 | Wen Gao 0001            |   564
              2001 | 1016379 | H. Vincent Poor         |   625
              2002 | 1016379 | H. Vincent Poor         |   717
              2003 | 1016379 | H. Vincent Poor         |   798
              2004 | 1016379 | H. Vincent Poor         |   879
              2005 | 1016379 | H. Vincent Poor         |   961
              2006 | 1016379 | H. Vincent Poor         |  1004
              2007 | 1016379 | H. Vincent Poor         |  1108
              2008 | 1016379 | H. Vincent Poor         |  1152
              2009 | 1016379 | H. Vincent Poor         |  1181
              2010 | 1016379 | H. Vincent Poor         |  1214
              2011 | 1016379 | H. Vincent Poor         |  1401
              2012 | 1016379 | H. Vincent Poor         |  1484
              2013 | 1016379 | H. Vincent Poor         |  1381
              2014 | 1016379 | H. Vincent Poor         |  1280
              2015 | 1016379 | H. Vincent Poor         |  1174
              2016 | 1016379 | H. Vincent Poor         |  1057
              2017 | 2774398 | Yang Liu                |   937
              2018 | 2774398 | Yang Liu                |   846
              2019 | 2774398 | Yang Liu                |   719
              2020 | 2774398 | Yang Liu                |   526
              2021 | 2774398 | Yang Liu                |   285
              2022 |    2464 | Aaron D. Ames           |     6
(96 rows)

*/
