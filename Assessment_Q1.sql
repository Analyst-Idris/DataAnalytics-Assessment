
--- Write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.

SELECT 
    u.id AS owner_id,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    COUNT(DISTINCT CASE WHEN p.is_regular_savings = TRUE THEN p.id END) AS savings_count,
    COUNT(DISTINCT CASE WHEN p.is_a_fund = TRUE THEN p.id END) AS investment_count,
    ROUND(SUM(s.confirmed_amount) / 100.0, 2) AS total_deposits
FROM 
    users_customuser u
INNER JOIN 
    plans_plan p ON u.id = p.owner_id
INNER JOIN 
    savings_savingsaccount s ON s.owner_id = u.id AND s.plan_id = p.id
WHERE 
    s.confirmed_amount > 0
GROUP BY 
    u.id, u.first_name, u.last_name
HAVING 
    COUNT(DISTINCT CASE WHEN p.is_regular_savings = TRUE THEN p.id END) >= 1
    AND COUNT(DISTINCT CASE WHEN p.is_a_fund = TRUE THEN p.id END) >= 1
ORDER BY 
    total_deposits DESC;

