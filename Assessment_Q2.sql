
/* Calculate the average number of transactions per customer per month and categorize them:
● "High Frequency" (≥10 transactions/month)
● "Medium Frequency" (3-9 transactions/month)
● "Low Frequency" (≤2 transactions/month) */
    
   SELECT
    user_id,
    CONCAT(first_name, ' ', last_name) AS customer_name,
    avg_transactions_per_month,
    CASE
        WHEN avg_transactions_per_month >= 10 THEN 'High Frequency'
        WHEN avg_transactions_per_month >= 3 AND avg_transactions_per_month < 10 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category
FROM
    (SELECT
        user_id,
        first_name,
        last_name,
        AVG(transactions) AS avg_transactions_per_month
    FROM
        (SELECT
            u.id AS user_id,
            u.first_name,
            u.last_name,
            DATE_FORMAT(s.transaction_date, '%Y-%m') AS month,
            COUNT(*) AS transactions
        FROM
            users_customuser u
        JOIN
            savings_savingsaccount s ON u.id = s.owner_id
        GROUP BY
            u.id, u.first_name, u.last_name, DATE_FORMAT(s.transaction_date, '%Y-%m')
        ) AS MonthlyTransactions
    GROUP BY
        user_id, first_name, last_name
    ) AS AverageTransactions
ORDER BY
    avg_transactions_per_month DESC;

