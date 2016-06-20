-- -- SECTION 1:

-- -- 1.1 query:
-- SELECT name FROM users;
-- -- 1.1 output:
-- --        name       
-- -- ------------------
-- --  Rick Henri
-- --  Jay Chetty
-- --  Keith Douglas
-- --  Ashleigh Adams
-- --  Euan Blackledge
-- --  Chris Flint
-- --  Nico di Lillo
-- --  Joe Maher
-- --  Marie Moyles
-- --  Iain Stewart
-- --  Megan Strachan
-- --  Russell Williams
-- --  Sam Werngren
-- --  Natalie Simpson
-- --  Davide de Lerma
-- --  Josh Kearns
-- --  Renwick Drysdale
-- --  Brian Morrice
-- -- (18 rows)

-- -- 1.2 query:
-- SELECT name, price FROM shows WHERE price < 15.00;
-- -- 1.2 output:
-- --              name             | price 
-- -- ------------------------------+-------
-- --  Le Haggis                    | 12.99
-- --  Paul Dabek Mischief          | 12.99
-- --  Best of Burlesque            |  7.99
-- --  Two become One               |  8.50
-- --  Urinetown                    |  8.50
-- --  Two girls, one cup of comedy |  6.00
-- -- (6 rows)


-- -- 1.3 query:
-- INSERT INTO users (name) VALUES ('Val Gibson');

-- -- 1.4 query:
-- SELECT id FROM users WHERE name = 'Val Gibson';
-- SELECT id FROM shows WHERE name = 'Two girls, one cup of comedy';
-- INSERT INTO shows_users (show_id, user_id) VALUES (12, 19);

-- -- 1.5 query:
-- UPDATE users SET name = 'Valerie Gibson' WHERE name = 'Val Gibson';

-- -- 1.6 query:
-- DELETE FROM users WHERE name = 'Valerie Gibson';

-- -- 1.7 query:
-- DELETE FROM shows_users WHERE show_id = 12 AND user_id = 19;

-- SECTION 2:

-- -- 2.1 query:
-- SELECT name, price FROM shows ORDER BY price ASC;
-- -- 2.1 output:
-- --                   name                   | price 
-- -- -----------------------------------------+-------
-- --  Two girls, one cup of comedy            |  6.00
-- --  Best of Burlesque                       |  7.99
-- --  Two become One                          |  8.50
-- --  Urinetown                               |  8.50
-- --  Paul Dabek Mischief                     | 12.99
-- --  Le Haggis                               | 12.99
-- --  Joe Stilgoe: Songs on Film – The Sequel | 16.50
-- --  Game of Thrones - The Musical           | 16.50
-- --  Shitfaced Shakespeare                   | 16.50
-- --  Aaabeduation – A Magic Show             | 17.99
-- --  Camille O'Sullivan                      | 17.99
-- --  Balletronics                            | 32.00
-- --  Edinburgh Royal Tattoo                  | 32.99
-- -- (13 rows)

-- -- 2.2 query:
-- SELECT avg(price) FROM shows;
-- -- 2.2 output:
-- --   avg         
-- -- ---------------------
-- --  15.9569230769230769
-- -- (1 row)

-- -- 2.3 query:
-- SELECT min(price) FROM shows;
-- -- 2.3 output:
-- --  min  
-- -- ------
-- --  6.00
-- -- (1 row)

-- 2.4 query:
SELECT sum(price) FROM shows;

-- -- 2.5
-- SELECT sum(price) FROM shows WHERE price < 20;

-- -- 2.6
-- SELECT name, price FROM shows WHERE price = (SELECT max(price) FROM shows);

-- -- 2.7
-- SELECT name, price FROM shows
-- WHERE price IN (SELECT min(price) FROM shows
-- WHERE price NOT IN (SELECT min(price) FROM shows));
-- -- OR:
-- SELECT name, price FROM shows ORDER BY price ASC LIMIT 1 OFFSET 1;

-- -- 2.8
-- SELECT name FROM users WHERE name LIKE 'N%';

-- -- 2.9
-- SELECT name FROM users WHERE name LIKE '%er%';

-- ##############################################################################

-- -- SECTION 3:

-- -- 3.1
-- SELECT "times"."time", "shows"."name" 
-- FROM "times"
-- INNER JOIN "shows" ON "shows".id = "times".show_id
-- WHERE "shows".name = 'Edinburgh Royal Tattoo';

-- -- 3.2
-- SELECT COUNT(users)
-- FROM shows_users
-- INNER JOIN users ON users.id = shows_users.user_id
-- INNER JOIN shows ON shows.id = shows_users.show_id
-- WHERE shows.name = 'Shitfaced Shakespeare';

-- -- 3.3
-- SELECT COUNT(shows.id), users.name
-- FROM shows_users 
-- INNER JOIN users ON users.id = shows_users.user_id
-- INNER JOIN shows ON shows.id = shows_users.show_id
-- GROUP BY users.name;

-- -- 3.4
-- SELECT users.name
-- FROM shows_users
-- INNER JOIN users ON shows_users.user_id = users.id
-- INNER JOIN "times" ON shows_users.show_id = "times".show_id
-- WHERE "times"."time" = '17:15';










