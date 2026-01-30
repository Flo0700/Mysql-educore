SELECT 
    user_id, 
    SUM(amount) AS total_spent
FROM payments
GROUP BY user_id;
