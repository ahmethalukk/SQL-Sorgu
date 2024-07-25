SELECT TOP 10 CustomerID, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID
ORDER BY OrderCount DESC;

SELECT TOP 1 ProductID, SUM(Quantity) AS TotalQuantitySold
FROM [Order Details]
GROUP BY ProductID
ORDER BY TotalQuantitySold DESC;

SELECT TOP 1 ProductID, SUM(UnitPrice * Quantity) AS TotalRevenue
FROM [Order Details]
GROUP BY ProductID
ORDER BY TotalRevenue DESC;

SELECT O.EmployeeID, E.FirstName, E.LastName, COUNT(OrderID) AS OrderCount
FROM Employees E JOIN Orders O ON E.EmployeeID= O.EmployeeID
GROUP BY O.EmployeeID,  E.FirstName, E.LastName
ORDER BY OrderCount DESC;

SELECT TOP 1 ShipCity, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY ShipCity
ORDER BY TotalOrders DESC;

SELECT SupplierID, SUM(od.Quantity) AS TotalQuantitySold, SUM(od.UnitPrice * od.Quantity) AS TotalRevenue
FROM [Order Details] od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY SupplierID;

SELECT c.CategoryID, SUM(od.Quantity) AS TotalQuantitySold, SUM(od.UnitPrice * od.Quantity) AS TotalRevenue
FROM [Order Details] od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID;

SELECT YEAR(OrderDate) AS OrderYear, SUM(od.Quantity) AS TotalQuantitySold, SUM(od.UnitPrice * od.Quantity) AS TotalRevenue
FROM [Order Details] od
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;

SELECT CustomerID, COUNT(o.OrderID) AS TotalOrders, SUM(od.UnitPrice * od.Quantity) AS TotalSpent, MAX(OrderDate) AS LastOrderDate
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY CustomerID;

SELECT EmployeeID, COUNT(o.OrderID) AS TotalOrders, SUM(od.Quantity) AS TotalQuantitySold, SUM(od.UnitPrice * od.Quantity) AS TotalRevenue
FROM Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY EmployeeID;
