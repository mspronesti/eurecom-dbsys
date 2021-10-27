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