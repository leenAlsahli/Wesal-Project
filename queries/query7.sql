-- الفيدباكات مرتبه من اطول لاقصر كومنت
SELECT f_id,comment
FROM Feedback
ORDER BY LENGTH(comment) DESC;
--