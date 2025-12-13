--querey 4: الاستعلام عن التذاكر العاجله المسنده الى لين
select 
    t.ticket_id,  
    t.title as ticket_title,
    t.priority,
    u.first_name as user_name, 
    d.name as department
from public.ticket t

join users u on t.user_id = u.user_id
join support_agent sa on t.sagent_id = sa.sagent_id
join
    departments d on t.dept_id = d.dept_id
where 
    sa.f_name = 'Leen' 
    and t.priority = 'urgent';
--