--Query 1: Retrieve all customers
SELECT * FROM customers;

--Query 2: Filter USA customers
SELECT * FROM customers
WHERE Country='USA';

-- Query 3: Sort Customers Alphabetically

SELECT * FROM customers
ORDER BY LastName ASC;

-- Query 4: Count Customers by Country

SELECT Country,
COUNT(*) AS Total_Customers
FROM customers
GROUP BY Country
ORDER BY Total_Customers DESC;

-- Query 5: Calculate Average Invoice Value

SELECT AVG(Total) AS Average_Invoice_Value
FROM invoices;

-- Query 6: Calculate Total Revenue

SELECT SUM(Total) AS Total_Revenue
FROM invoices;

-- Query 7: Customer Invoice Analysis (INNER JOIN)

SELECT
c.FirstName,
c.LastName,
i.InvoiceDate,
i.Total
FROM customers c
INNER JOIN invoices i
ON c.CustomerId = i.CustomerId;

-- Query 8: Customer and Invoice Overview (LEFT JOIN)

SELECT
c.FirstName,
c.LastName,
i.InvoiceId
FROM customers c
LEFT JOIN invoices i
ON c.CustomerId = i.CustomerId;

-- Query 9: top 5 Customers by revenue

SELECT
    c.FirstName || ' ' || c.LastName AS Customer_Name,
    ROUND(SUM(i.Total),2) AS Total_Spent
FROM customers c
JOIN invoices i
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY Total_Spent DESC
LIMIT 5;

-- Query 10: VIP customers

SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    SUM(i.Total) AS Lifetime_Value
FROM customers c
JOIN invoices i
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
HAVING SUM(i.Total) > 40;

SELECT * FROM VIP_Customers;

-- Query 11:Employee Performance Dashboard Query

SELECT
    e.FirstName || ' ' || e.LastName AS Employee,
    COUNT(c.CustomerId) AS Customers_Managed
FROM employees e
LEFT JOIN customers c
ON e.EmployeeId = c.SupportRepId
GROUP BY e.EmployeeId
ORDER BY Customers_Managed DESC;

-- Query 12: Best-Selling Music Genres
SELECT
    e.FirstName || ' ' || e.LastName AS Employee,
    COUNT(c.CustomerId) AS Customers_Managed
FROM employees e
LEFT JOIN customers c
ON e.EmployeeId = c.SupportRepId
GROUP BY e.EmployeeId
ORDER BY Customers_Managed DESC;
