USE sales_db;

-- =====================================================
-- 2. INNER JOIN: Orders with Customer Details
--    Validate by matching order counts
-- =====================================================

-- Orders combined with customer information
SELECT
    o.OrderID,
    o.OrderDate,
    c.CustomerID,
    c.CompanyName,
    c.Country
FROM orders o
INNER JOIN customers c
    ON o.CustomerID = c.CustomerID;

-- Validation: Order count should match total orders
SELECT COUNT(*) AS total_orders FROM orders;

SELECT COUNT(*) AS joined_orders
FROM orders o
INNER JOIN customers c
    ON o.CustomerID = c.CustomerID;


-- =====================================================
-- 3. LEFT JOIN: Customers who never placed orders
--    Useful for marketing and re-engagement
-- =====================================================

SELECT
    c.CustomerID,
    c.CompanyName,
    c.Country
FROM customers c
LEFT JOIN orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;


-- =====================================================
-- 4. Orders + Products: Total Revenue per Product
--    Identify high-performing SKUs
-- =====================================================

SELECT
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity * od.UnitPrice) AS total_revenue
FROM order_details od
INNER JOIN products p
    ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY total_revenue DESC;


-- =====================================================
-- 5. Category-wise Revenue Distribution
--    Used for product strategy decisions
-- =====================================================

SELECT
    cat.CategoryName,
    SUM(od.Quantity * od.UnitPrice) AS category_revenue
FROM order_details od
INNER JOIN products p
    ON od.ProductID = p.ProductID
INNER JOIN categories cat
    ON p.CategoryID = cat.CategoryID
GROUP BY cat.CategoryName
ORDER BY category_revenue DESC;


-- =====================================================
-- 6. WHERE conditions on joined tables
--    Example: Sales in Region X between Dates Y and Z
-- =====================================================

SELECT
    c.Region,
    o.OrderDate,
    SUM(od.Quantity * od.UnitPrice) AS total_sales
FROM orders o
INNER JOIN customers c
    ON o.CustomerID = c.CustomerID
INNER JOIN order_details od
    ON o.OrderID = od.OrderID
WHERE c.Region = 'WA'
  AND o.OrderDate BETWEEN '1997-01-01' AND '1997-12-31'
GROUP BY c.Region, o.OrderDate
ORDER BY o.OrderDate;


-- =====================================================
-- 8. Export final outputs to CSV
-- =====================================================

-- Export revenue per product
SELECT
    p.ProductName,
    SUM(od.Quantity * od.UnitPrice) AS total_revenue
FROM order_details od
JOIN products p
    ON od.ProductID = p.ProductID
GROUP BY p.ProductName;
