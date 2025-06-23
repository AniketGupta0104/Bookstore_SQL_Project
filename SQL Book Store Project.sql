#Top 10 best-selling books
SELECT BookID, COUNT(*) AS total_sales
FROM Sales
GROUP BY BookID
ORDER BY total_sales DESC
LIMIT 10;

#Bottom 10 selling books 
SELECT BookID, COUNT(*) AS total_sales
FROM Sales
GROUP BY BookID
ORDER BY total_sales ASC
LIMIT 10;

#Average price and stock by genre
SELECT Genre, ROUND(AVG(Price), 2) AS Avg_Price, AVG(Stock) AS Avg_Stock
FROM Books
GROUP BY Genre;

#Total books published per author
SELECT a.Author_Name, COUNT(b.BookID) AS Total_Books
FROM Authors a
JOIN Books b ON a.AuthorID = b.AuthorID
GROUP BY a.Author_Name
ORDER BY Total_Books DESC;

#Monthly sales count
SELECT DATE_FORMAT(Sale_Date, '%Y-%m') AS Sale_Month, COUNT(*) AS Total_Sales
FROM Sales
GROUP BY Sale_Month
ORDER BY Sale_Month;

#Yearly trend of new customer signups
SELECT YEAR(Signup_Date) AS Year, COUNT(*) AS New_Customers
FROM Customers
GROUP BY Year
ORDER BY Year;

#Most loyal customers (by number of purchases)
SELECT CustomerID, COUNT(*) AS Total_Orders
FROM Sales
GROUP BY CustomerID
ORDER BY Total_Orders DESC
LIMIT 10;


#Sales distribution by store
SELECT Store_Location, COUNT(*) AS Num_Sales
FROM Sales
GROUP BY Store_Location
ORDER BY Num_Sales DESC;


#Total revenue per book (not accounting for discount logic)
SELECT b.Title, SUM(s.Quantity * b.Price) AS Revenue
FROM Sales s
JOIN Books b ON s.BookID = b.BookID
GROUP BY b.Title
ORDER BY Revenue DESC
LIMIT 10;

#Return rate by reason
SELECT Reason, COUNT(*) AS Num_Returns
FROM Returns
GROUP BY Reason
ORDER BY Num_Returns DESC;


#Most used payment methods
SELECT Payment_Mode, COUNT(*) AS Usage_Count
FROM Sales
GROUP BY Payment_Mode
ORDER BY Usage_Count DESC;


#Customers who only shop online
SELECT c.Name
FROM Customers c
WHERE CustomerID NOT IN (
  SELECT DISTINCT CustomerID
  FROM Sales
  WHERE Store_Location != 'Online');
  
#Authors with the highest average book price
SELECT a.Author_Name, ROUND(AVG(b.Price), 2) AS Avg_Price
FROM Authors a
JOIN Books b ON a.AuthorID = b.AuthorID
GROUP BY a.Author_Name
ORDER BY Avg_Price DESC
LIMIT 10;