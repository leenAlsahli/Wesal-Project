--querey 6: عرض جميع التذاكر مع اليوزر والوكيل المسؤول عنها والقسم
select T.Ticket_ID,
    T.Title as Ticket_Title,
    T.Priority,
    T.Status,
    U.first_name As Customer_Name, 
    D.name as Department_Name, 
    SA.F_name as Assigned_Agent_Name 
From Ticket T
join users U on T.user_id = U.user_id
Join departments D on T.dept_id = D.dept_id
left join Support_Agent SA On T.SAgent_ID = SA.SAgent_ID
order by
    T.Ticket_ID;
