-- url: https://sqlzoo.net/wiki/Self_join

-- 1
SELECT COUNT(id) 
FROM stops

-- 2
SELECT id FROM stops WHERE name = 'Craiglockhart'

-- 3
SELECT id, name
FROM stops
JOIN route
ON id = stop
WHERE num = 4 AND company = 'LRT'
ORDER BY pos

-- 4
SELECT company, num, c
FROM
(SELECT company, num, COUNT(*) AS c
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num) a
WHERE c = 2

-- 5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart') AND b.stop = (SELECT id FROM stops WHERE name = 'London Road')

-- 6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='London Road'

-- 7
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket'
AND stopb.name='Leith'

-- 8
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='Tollcross'

-- 9
SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND a.company = 'LRT'

-- 10
SELECT anum, acom, middle, anum2, acom2
FROM (
SELECT a.company acom, a.num anum, stopa.name start, stopb.name middle
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart') c
JOIN (
SELECT a2.company acom2, a2.num anum2, stopa2.name start2, stopb2.name 
FROM route a2 JOIN route b2 ON
  (a2.company=b2.company AND a2.num=b2.num)
  JOIN stops stopa2 ON (a2.stop=stopa2.id)
  JOIN stops stopb2 ON (b2.stop=stopb2.id)
WHERE stopb2.name='Lochend') d
ON d.start2 = middle
ORDER BY anum, middle, anum2, acom2
