WITH Book_2022_01_01 AS(
    SELECT book_id, SUM(sales) AS sales
    FROM book_sales
    WHERE sales_date like '2022-01%'
    GROUP BY book_id
)

SELECT b.author_id, a.author_name, b.category, SUM(ba.sales * price) AS total_sales
FROM book b
JOIN author a ON b.author_id = a.author_id
JOIN book_2022_01_01 ba ON ba.book_id = b.book_id
GROUP BY b.author_id, a.author_name, b.category
ORDER BY 1, 3 DESC