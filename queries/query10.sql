-- الفيدباك اللي الكومنت اطول من عشرة حروف
SELECT f_id , comment
FROM feedback
where LENGTH(comment)>10;