-- url: https://sqlzoo.net/wiki/NSS_Tutorial

-- 1
SELECT a_strongly_agree
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'

-- 2
SELECT institution, subject
FROM nss
WHERE question='Q15'
AND score = 100

-- 3
SELECT institution, score
FROM nss
WHERE question='Q15'
AND subject='(8) Computer Science'
AND score < 50

-- 4
SELECT subject, SUM(response)
FROM nss
WHERE (question='Q22'
AND subject='(8) Computer Science')
OR (question='Q22'
AND subject='(H) Creative Arts and Design')
GROUP BY subject

-- 5
SELECT subject, SUM(response*a_strongly_agree/100)
FROM nss
WHERE (question='Q22'
AND subject='(8) Computer Science')
OR (question='Q22'
AND subject='(H) Creative Arts and Design')
GROUP BY subject

-- 6
SELECT subject, ROUND(SUM(response*(a_strongly_agree/100))/SUM(response)*100, 0)
FROM nss
WHERE (question='Q22'
AND subject='(8) Computer Science')
OR (question='Q22'
AND subject='(H) Creative Arts and Design')
GROUP BY subject

-- 7
SELECT institution, ROUND(SUM(score/100*response)/SUM(response)*100, 0)
FROM nss
WHERE question='Q22'
AND (institution LIKE '%Manchester%')
GROUP BY institution
ORDER BY institution

-- 8
SELECT institution, SUM(sample), (
    SELECT sample 
    FROM nss x 
    WHERE x.institution = y.institution 
    AND subject = '(8) Computer Science' 
    AND question = 'Q01'
    ) AS comp
FROM nss y
WHERE question='Q01'
AND institution LIKE '%Manchester%'
GROUP BY institution


