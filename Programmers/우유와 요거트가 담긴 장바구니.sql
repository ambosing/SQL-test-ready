-- 코드를 입력하세요
WITH cart_yogurt AS(
    SELECT cart_id
    FROM cart_products
    WHERE name = 'Yogurt'
), cart_milk AS(
    SELECT cart_id
    FROM cart_products
    WHERE name = 'Milk'
)

SELECT DISTINCT y.cart_id
FROM cart_yogurt y
JOIN cart_milk m ON y.cart_id = m.cart_id
ORDER BY 1