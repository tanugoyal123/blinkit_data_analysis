# 1. monthly user count

SELECT DATE_FORMAT(CreatedAt, '%Y-%m') AS SignupMonth,
  COUNT(*) AS UsersCount 
  From user 
  group by SignupMonth
  order by UsersCount DESC;
  
# 2. monthly order count 

SELECT DATE_FORMAT(CreatedAt, '%Y-%m') AS orderMonth,
  COUNT(*) AS orderCount 
  From orderr 
  group by orderMonth
  order by orderCount DESC;
  
  
# 3. Monthly Revenue 
SELECT DATE_FORMAT(CreatedAt, '%Y-%m') AS orderMonth,
  SUM(TotalAmount) AS TotalMonthlyAmount 
  From Orderr  
  group by orderMonth
  order by TotalMonthlyAmount DESC;

  
# 4. top 10 USER according to order

SELECT o.UserID, u.UserName,
COUNT(*) AS ordercount
FROM orderr o
JOIN user u on u.UserID = o.UserID
group by UserID
order by ordercount DESC
LIMIT 10;


# 5. top 10 USER according to REVENUE

SELECT o.UserID, u.username,
SUM(o.TotalAmount) AS Totalrevenue
FROM orderr o
JOIN user u on u.UserID=o.UserID
group by UserID
order by Totalrevenue DESC
LIMIT 10;

# 6. top20 selling Product item and there revenue

SELECT o.ProductID,  p.Name, SUM(o.Quantity) as TotalQuantity , SUM(P.Price*o.quantity) as TotalRevenue 
FROM orderitem o
JOIN product p on o.ProductID=P.ProductID
group by ProductID , p.Name
order by TotalQuantity desc
LIMIT 20;


# 7. Top20 product with high revenue
SELECT o.ProductID,  p.Name, SUM(o.Price*o.quantity) as TotalRevenue 
FROM orderitem o
JOIN product p on o.ProductID=P.ProductID
group by ProductID , p.Name
order by TotalRevenue desc
LIMIT 20;

# 8. Top categories by sales

SELECT 
p.Category , 
SUM(o.Quantity) as Quantity
FROM orderitem o
JOIN product p on o.ProductID=p.ProductID
group by p.Category
order by Quantity DESC
LIMIT 10;

# 9. Top categories by revenue

SELECT 
p.Category , 
SUM(o.Price * o.Quantity) as TotalRevenue
FROM orderitem o
JOIN product p on o.ProductID=p.ProductID
group by p.Category
order by TotalRevenue DESC
LIMIT 10;


# 10. late or early deliveries
SELECT 
  DeliveryStatus,
  COUNT(*) AS DeliveryCount
FROM (
  SELECT 
    CASE 
      WHEN ActualDeliveryTime <= EstimatedDeliveryTime THEN 'Early'
      ELSE 'Late'
    END AS DeliveryStatus
  FROM 
    delivery
) AS subquery
group by
  DeliveryStatus;
 
 
 # 11. Top Delivery Person by Number of Deliveries

  SELECT 
  d.DeliveryPersonID,
  dp.Name,
  COUNT(*) AS DeliveryCount
FROM delivery d
JOIN deliveryperson dp ON d.DeliveryPersonID = dp.DeliveryPersonID
group by d.DeliveryPersonID, dp.Name
order by DeliveryCount DESC
LIMIT 10;
  

