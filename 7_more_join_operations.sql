-- url: https://sqlzoo.net/wiki/More_JOIN_operations

-- 1
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2
SELECT yr FROM movie
WHERE title = 'Citizen Kane'

-- 3
SELECT id, title, yr 
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

-- 4
SELECT id FROM actor
WHERE name = 'Glenn Close'

-- 5
SELECT id FROM movie
WHERE title = 'Casablanca'

-- 6
SELECT name
FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN movie
ON movie.id = casting.movieid
WHERE title ='Casablanca'

-- 7
SELECT name
FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN movie
ON movie.id = casting.movieid
WHERE title ='Alien'

-- 8
SELECT title
FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN movie
ON movie.id = casting.movieid
WHERE actor.name = 'Harrison Ford'

-- 9
SELECT title
FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN movie
ON movie.id = casting.movieid
WHERE actor.name = 'Harrison Ford' AND casting.ord != 1

-- 10
SELECT title, name
FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN movie
ON movie.id = casting.movieid
WHERE yr = 1962 AND casting.ord = 1

-- 11
SELECT yr, COUNT(title)
FROM movie 
JOIN casting 
ON movie.id=movieid
JOIN actor
ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12
SELECT title, name
FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN movie
ON movie.id = casting.movieid
WHERE casting.ord = 1 AND movie.id 
IN(SELECT movie.id 
FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN movie
ON movie.id = casting.movieid
WHERE name = 'Julie Andrews')
ORDER BY title

-- 13
SELECT name
FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN movie
ON movie.id = casting.movieid
WHERE ord = 1
GROUP BY name
HAVING COUNT(ord) >= 15

-- 14
SELECT title, COUNT(actorid)
FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN movie
ON movie.id = casting.movieid
WHERE yr = 1978
GROUP BY movie.id
ORDER BY COUNT(actorid) DESC, title

-- 15
SELECT name
FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN movie
ON movie.id = casting.movieid
WHERE movieid IN(
SELECT movieid
FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN movie
ON movie.id = casting.movieid
WHERE name = 'Art Garfunkel'
) 
AND name != 'Art Garfunkel'
