--Warby Parker Capstone
--Section 1.1

SELECT *
 FROM survey
 LIMIT 10;

--Section 1.2

 SELECT question, COUNT (question)
 FROM survey
 GROUP BY question;

--Section 1.4

 SELECT *
 FROM quiz
 LIMIT 5;
 
 SELECT *
 FROM home_try_on
 LIMIT 5;
 
 SELECT *
 FROM purchase
 LIMIT 5;

--Section 1.5

SELECT quiz.user_id, 
CASE
	WHEN home_try_on.user_id IS NOT NULL THEN 'true'
  ELSE 'false'
END AS 'is_home_try_on', 
  home_try_on.number_of_pairs, 
CASE
	WHEN purchase.user_id IS NOT NULL THEN 'true'
  ELSE 'false'
END AS 'is_purchase'
FROM quiz
LEFT JOIN home_try_on
	ON quiz.user_id = home_try_on.user_id
LEFT JOIN purchase
	ON quiz.user_id = purchase.user_id
LIMIT 10;

--Section 1.6

SELECT COUNT(quiz.user_id),
CASE
	WHEN home_try_on.user_id IS NOT NULL THEN 'true'
  ELSE 'false'
END as 'is_home_try_on',
home_try_on.number_of_pairs,
CASE
	WHEN purchase.user_id IS NOT NULL THEN 'true'
  ELSE 'false'
END AS 'is_purchase'
FROM quiz 
LEFT JOIN home_try_on
	ON quiz.user_id = home_try_on.user_id
LEFT JOIN purchase
	ON quiz.user_id = purchase.user_id
GROUP BY is_home_try_on, home_try_on.number_of_pairs, is_purchase;

--Section 1.6 Fit

SELECT fit, COUNT (fit) AS 'fit_count'
FROM quiz
GROUP BY fit
ORDER BY fit_count DESC;

--Section 1.6 Model and Color

SELECT model_name, COUNT (model_name) AS 'count_model', color
FROM purchase
GROUP BY model_name, color
ORDER BY count_model DESC;

