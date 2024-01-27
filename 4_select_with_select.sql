-- url: https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

-- 1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- 2
SELECT name FROM world
WHERE gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom') AND continent = 'Europe'

-- 3
SELECT name, continent FROM world
WHERE continent IN((SELECT DISTINCT continent FROM world WHERE name IN('Argentina')), (SELECT DISTINCT continent FROM world WHERE name IN('Australia')))

-- 4
SELECT name, population FROM world
WHERE population
> (SELECT population FROM world
WHERE name = 'United Kingdom')
AND population
< (SELECT population FROM world
WHERE name = 'Germany')

-- 5
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100), '%') as percentage
FROM world
WHERE continent = 'Europe'

-- 6
SELECT name FROM world
WHERE gdp > ALL(SELECT gdp FROM world WHERE gdp IS NOT NULL AND continent = 'Europe')

-- 7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND population>0)

-- 8

