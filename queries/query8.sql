-- (Lama مثال يوزر )جميع فيدباكات يوزر معين

SELECT 
f.f_id,
f.rating,
f.comment,
u.user_id,
u.first_name,
u.last_name
FROM Feedback as f
 JOIN users as u
on f.u_id = u.user_id
where f.u_id='1019876543'
order by f.f_id;
--