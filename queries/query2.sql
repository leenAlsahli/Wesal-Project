-- Query 2: عرض الموظفين وتصنيفهم
SELECT 
    u.first_name, 
    u.email, 
    c.customer_type, 
    c.organization_name
FROM users u
JOIN customers c ON u.user_id = c.user_id
WHERE c.customer_type = 'Individual'; -- مثال: عرض الأفراد فقط
