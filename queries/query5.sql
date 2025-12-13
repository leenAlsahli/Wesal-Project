--querey 5: عد اجمالي التذاكر حسب الحالة
select
    Status as Ticket_Status, 
    COUNT(Ticket_ID) as Total_Count
from
    Ticket
group by
    Status;
    