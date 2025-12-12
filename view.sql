--  يعرض تذاكر العملاء فقط "المنظمات والأفراد" مع إظهار نوع العميل واسم المنظمة 

create view v_Customer_Support_View as 
   select T.Ticket_ID, 
   T.Title as Ticket_Subject,T.Priority,
    U.first_name as Customer_Name,
    C.customer_type, --  Individual او Organization نوع العميل اذا كان
    C.organization_name, -- Individual اسم المنظمة في حال كان  
    D.name as Assigned_Department,
    SA.F_name as Agent_Handling
from Ticket T
join users U ON T.user_id = U.user_id
join customers C ON U.user_id = C.user_id 
join departments D ON T.dept_id = D.dept_id
left join    Support_Agent SA ON T.SAgent_ID = SA.SAgent_ID;

-- فيو لاعلى الفيدباك من اربعه وفوق

CREATE VIEW highRatedFeedback as
SELECT 
f_id,
rating,
comment,
u_id
FROM Feedback
WHERE rating >= 4
