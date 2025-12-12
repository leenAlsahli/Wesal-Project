-- Query 3: حساب عدد الموظفين في كل قسم
SELECT
    d.name AS department_name,
    COUNT(e.user_id) AS total_employees
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.name
ORDER BY total_employees DESC;