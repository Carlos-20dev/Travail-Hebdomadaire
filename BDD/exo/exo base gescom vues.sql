
-- Réalisez les vues suivantes à partir de la base gescom/exo1.

CREATE VIEW v_Details 
AS SELECT pro_id AS 'code produit', SUM(ode_unit_price*ode_quantity) AS PrixTot, SUM(ode_quantity) AS QteTot 
FROM orders_details 
JOIN products 
ON orders_details.ode_pro_id = products.pro_id 
ORDER BY PrixTot, QteTot;



-- Exo2

CREATE VIEW v_Ventes_Zoom
AS SELECT * 
FROM products
JOIN orders_details
ON products.pro_id = orders_details.ode_pro_id
WHERE pro_ref = "ZOOM";


select * 
-- FROM products
-- WHERE pro_ref = "ZOOM";


-- SELECT *
-- FROM orders_details
-- WHERE ode_pro_id = 41


