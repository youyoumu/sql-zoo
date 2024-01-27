-- url: https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial

-- 1
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- 2
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature'

-- 3
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

-- 4
SELECT winner
FROM nobel
WHERE subject = 'peace' AND yr >= 2000

-- 5
SELECT yr, subject, winner
FROM nobel 
WHERE subject = 'literature' AND yr BETWEEN 1980 AND 1989

-- 6
SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt',
                  'Thomas Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

-- 7
SELECT winner FROM nobel
WHERE winner LIKE 'John_%'

-- 8
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'physics' AND yr = 1980) OR (subject = 'chemistry' AND yr = 1984)

-- 9
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND subject NOT IN('chemistry', 'medicine')

-- 10
SELECT yr, subject, winner 
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004)

-- 11
SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG'

-- 12
SELECT * FROM nobel
WHERE winner = "EUGENE O'NEILL"

-- 13
SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'SIR_%'
ORDER BY yr DESC, REPLACE(winner, 'Sir ', '')

-- 14
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN('chemistry', 'physics'), subject, winner


