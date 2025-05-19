/*For each customer, assuming the profit_per_transaction is 0.1% of the transaction value, calculate:
● Account tenure (months since signup)
● Total transactions
● Estimated CLV (Assume: CLV = (total_transactions / tenure) * 12 * avg_profit_per_transaction)
● Order by estimated CLV from highest to lowest */

SELECT
    u.id AS customer_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    (DATEDIFF(CURDATE(), u.date_joined) / 30) AS tenure_month,
    COUNT(s.id) AS total_transactions,
    ((COUNT(s.id) / (DATEDIFF(CURDATE(), u.date_joined) / 30)) * 12 * 0.001 * SUM(s.new_balance)) AS estimated_clv
FROM
    users_customuser u
JOIN
    savings_savingsaccount s ON u.id = s.owner_id
GROUP BY
    u.id, u.first_name, u.last_name, u.date_joined
ORDER BY
    estimated_clv DESC;
