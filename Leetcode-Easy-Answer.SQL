#175. Combine Two Tables

SELECT FirstName, LastName, City, State
FROM Person P
LEFT JOIN Address A
ON P.PersonId = A.PersonId

--------------------------------------------------------------------------------------------------------
#181. Employees Earning More Than Their Managers

--As this table has the employee's manager information, we probably need to select information from it twice.
--So it need to use inner join. When you use 'Inner Join', don't use ON clause. 
--Self inner join can also be FROM Employee E1, Employee E2. Then follow WHERE condition.

SELECT E1.Name AS Employee
FROM Employee AS E1
INNER JOIN Employee AS E2
WHERE E1.ManagerId = E2.Id AND E1.Salary > E2.Salary

--------------------------------------------------------------------------------------------------------
#183. Customers Who Never Order

SELECT C.Name AS Customers
FROM Customers C
WHERE C.Id NOT IN (SELECT CustomerId
                   FROM Orders)
                   
--------------------------------------------------------------------------------------------------------
#176. Second Highest Salary

--IFNULL(expression, alt_value)

SELECT IFNULL((SELECT DISTINCT Salary
              FROM Employee
              ORDER BY Salary DESC
              LIMIT 1 OFFSET 1), NULL) AS SecondHighestSalary

--------------------------------------------------------------------------------------------------------
#196. Delete Duplicate Emails

--DELETE FROM table_name WHERE condition

DELETE P1 FROM Person P1, Person P2
WHERE P1.Email = P2.Email AND P1.Id > P2.Id
--------------------------------------------------------------------------------------------------------
#1322. Ads Performance

--ENUM type is a special "class" that represents a group of constants.

SELECT ad_id,
        IFNULL(ROUND(SUM(
            CASE 
            WHEN action = 'Clicked' THEN 1 
            ELSE 0 
            END)/
            SUM(CASE 
                WHEN action = 'Clicked' THEN 1
                WHEN action = 'Viewed' THEN 1 
                ELSE 0 
                END) * 100,2),0) as ctr
FROM ads
GROUP BY ad_id
ORDER BY ctr DESC, ad_id ASC
--------------------------------------------------------------------------------------------------------
#











