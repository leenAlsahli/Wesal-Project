-- Query 1: الحصول على بيانات الموظفين
SELECT 
    u.user_id,
    u.first_name || ' ' || u.last_name AS full_name,
    u.email,
    e.job_title,
    d.name AS department_name,
    e.salary
FROM users u
JOIN employees e ON u.user_id = e.user_id
JOIN departments d ON e.dept_id = d.dept_id;
--