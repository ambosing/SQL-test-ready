-- 코드를 입력하세요
SELECT category, SUM(s.sales) AS TOTAL_SALES
FROM book b
JOIN book_sales s ON b.book_id = s.book_id
WHERE sales_date LIKE '2022-01%'
GROUP BY category
ORDER BY 1  