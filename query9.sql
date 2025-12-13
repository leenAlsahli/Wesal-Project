--عدد المرفقات الموجوده لكل تكت
SELECT T_id,COUNT(a_id) AS total_attachment
from Attachment
Group by T_id;
