-- Fournisseur*****

CREATE PROCEDURE ajoutFournisseur(
    IN p_nom VARCHAR(50), 
    IN p_countries_id CHAR(2),  
    IN p_address VARCHAR(150),
    IN p_zipcode VARCHAR(5),  
    IN p_contact VARCHAR(100),  
    IN p_phone VARCHAR(10),  
    IN p_mail VARCHAR(75)
)

BEGIN
   DECLARE v_ville VARCHAR (50);
   SET v_ville = 'Amiens';   

   INSERT INTO suppliers(sup_name, sup_city, sup_countries_id, sup_address, sup_zipcode, sup_contact, sup_phone, sup_mail) VALUES (p_nom, v_ville, p_countries_id, p_address, p_zipcode, p_contact, p_phone, p_mail);
END |

DELIMITER ;


-- suivi de procédure avant ajout fournisseur(coe ajout Catégorie)

DELIMITER |

CREATE PROCEDURE listeClientParVille(IN p_ville VARCHAR(50))

BEGIN 
 
 SELECT cus_id, cus_lastname, cus_firstname, cus_address, cus_city, cus_countries_id
   FROM customers
   WHERE cus_countries_id = 'FR'



   -- Exercice 1 : création d'une procédure stockée sans paramètre

-- Créez la procédure stockée Lst_Suppliers correspondant à la requête afficher le nom des fournisseurs pour lesquels une commande a été passée.

DELIMITER |

CREATE PROCEDURE Lst_Suppliers()
BEGIN
    SELECT * FROM Suppliers;
END

DELIMITER ;

-- Exécutez la pour vérifier qu'elle fonctionne conformément à votre attente.
CALL Lst_Suppliers

-- Exécutez la commande SQL suivante pour obtenir des informations sur cette procédure stockée :
SHOW CREATE PROCEDURE Lst_Suppliers






-- Exercice 2 : création d'une procédure stockée avec un paramètre en entrée

DELIMITER |

CREATE PROCEDURE Lst_Rush_Orders(IN p_commande_urgente VARCHAR(50))

BEGIN
   SELECT ord_id, ord_order_date, ord_payement_date, ord_reception_date, ord_ship_date, ord_status 
   FROM orders
   WHERE ord_status = p_commande_urgente;
END |

DELIMITER ;
 
--  appeler ma procedure-- 
CALL Lst_Rush_Orders('commande_urgente')



-- Exercice 3 : création d'une procédure stockée avec plusieurs paramètres

DELIMITER |

CREATE PROCEDURE CA_Supplier(
    p_sup_adress VARCHAR(50),
    p_sup_city VARCHAR(50),
    p_sup_contat VARCHAR(50),
    p_sup_id INT(10),
    p_sup_mail VARCHAR(50),
    p_sup_name VARCHAR(50),
    p_sup_phone VARCHAR(50),
    p_sup_zipcode VARCHAR(50)
)

BEGIN
   INSERT INTO Supplier(sup_adress, sup_city, sup_contat, sup_id, sup_mail, sup_name, sup_phone, sup_zipcode) VALUES (p_sup_adress, p_sup_city, p_sup_contat, p_sup_id, p_sup_mail, p_sup_name, p_sup_phone, p_sup_zipcode);
END |

DELIMITER ;   






-- Eval SQL avancé du 11/02*****************/////////


-- EXo 1

CREATE VIEW v_catalogue_produits 
AS SELECT pro_id,pro_ref,pro_name,cat_id,cat_name 
FROM products 
JOIN categories 
ON products.pro_cat_id = categories.cat_id

-- Méthode 2****/

SELECT pro_id,pro_ref,pro_name,cat_id,cat_name 
FROM products, categories 
WHERE products.pro_cat_id = categories.cat_id


-- Exo2(Eval) Procédures Stockées

DELIMITER |

CREATE PROCEDURE facture(IN p_libelle VARCHAR(50),OUT p_montant_total INT)

BEGIN 

SELECT SUM(ode_unit_price * ode_quantity) INTO p_montant_total
FROM orders_details 
JOIN orders 
ON orders_details.ode_ord_id = orders.ord_id
WHERE ord_id = p_libelle;

END |
DELIMITER ;

-- APPELER LA COMMANDE
CALL facture(3, @p_total);
SELECT @p_total AS 'prix total';




-- Exo3(Eval) Triggers

-- CREATE TRIGGER after_products_update
-- AFTER INSERT
-- ON products
-- FOR EACH ROW
-- BEGIN
--    IF stock < stock_alert THEN 
--    DELETE FROM nom de la table (commander_article) WHERE codart =new.pro_id; 
--    INSERT INTO commander_articles (codart, date, qte) values('1', '12/02/2021', '2',new.pro_id)
--    INSERT INTO MATABLE (marub1, marub2) values ('valeurrub1', 12,new.pro_id)
--    END IF;
-- END


DELIMITER |
CREATE TRIGGER after_products_update
AFTER UPDATE
ON products
FOR EACH ROW
BEGIN
   IF new.pro_stock < new.pro_stock_alert THEN 
   DELETE FROM commander_articles WHERE codart = new.pro_id; 
   INSERT INTO commander_articles (codart, date, qte) values(new.pro_id, now(), new.pro_stock_alert);
   END IF;
END|
DELIMITER ;




-- TRansaction Eval

-- 6*/MIN(SET@idshop = (select sho_id from shops where sho_city = 'Arras');
-- SELECT MIN(emp_enter_date)
-- FROM employees 
-- JOIN posts ON emp_pos_id = posts.pos_id
-- WHERE pos_libelle = 'Pépiniériste' AND emp_sho_id = @idshop;)
-- SET@idPépinieriste= SELECT pos_id FROM `posts` WHERE pos_libelle = 'Pépinieriste'
-- SET @idshop = (select sho_id from shops where shop_city = 'Arras');

START TRANSACTION;
*--------------------1/--------------------
INSERT INTO posts (pos_libelle)
VALUES ('Retraité');

*-------------------2/---------------------
SET @idshop = (select shop_id from shops where shop_city = 'Arras')/--------Identification du Magasin d'Arras
SET @idretraite = (select pos_id from posts where pos_libelle = 'Retraité');/--------L'ID  du retraité
SELECT * FROM `shops` WHERE shop_city = 'Arras'

*-----------------------3/------------------------------
update employees set emp_pos_id = @idretraite where emp_lastname = 'HANNAH' AND  emp_firstname = 'Amity'AND emp_shop_id = @idshop;

*---------------------4/--------------------------------
SELECT pos_id FROM `posts` WHERE pos_libelle = 'Pépinieriste'

*-----------------------5/---------------------------------
Select *
From Employees
JOIN posts ON emp_pos_id = posts.pos_id
WHERE pos_libelle = 'Pépiniériste' AND emp_shop_id = @idshop;

*---------------6/-----------------------
SET @id_new_manager = (SELECT emp_id
FROM employees 
JOIN posts ON emp_pos_id = posts.pos_id
WHERE pos_libelle = 'Pépiniériste' AND emp_sho_id = @idshop
ORDER BY emp_enter_date
limit 1);
*//--------Sinon avec MIN
-- sinon avec MIN
-- SET @id_new_manager = (SELECT MIN(emp_enter_date)
-- FROM employees 
-- JOIN posts ON emp_pos_id = posts.pos_id
-- WHERE pos_libelle = 'Pépiniériste' AND emp_sho_id = @idshop);

/------------------------------------------------------------
SET @post_id_manager = (SELECT pos_id
FROM posts 
WHERE pos_libelle LIKE '%Manage%'
limit 1);

/----------------------7*-----------------------------------------------------

SET @id_new_manager = (SELECT emp_id -- id du monsieur que sera le nouveau manager
FROM employees 
JOIN posts ON emp_pos_id = posts.pos_id
WHERE pos_libelle = 'Pépiniériste' AND emp_sho_id = @idshop
ORDER BY emp_enter_date
limit 1);

SET @post_id_manager = (SELECT pos_id -- id du poste manager
FROM posts 
WHERE pos_libelle LIKE '%Manage%'
limit 1);

UPDATE employees
SET 
emp_salary = (emp_salary*1.05),
emp_pos_id = @post_id_manager -- affecter le nouveau id "comme manager"
WHERE emp_id = @id_new_manager;


*----------------------------8/-----------------------------
SET @les_pepinieristes = (SELECT pos_id
FROM posts
WHERE pos_libelle = 'Pépinieriste');

SET @id_new_manager = (SELECT emp_id -- id du monsieur que sera le nouveau manager
FROM employees 
WHERE emp_firstname = 'Dorian');

UPDATE employees
SET 
emp_superior_id = @id_new_manager
WHERE emp_pos_id = @les_pepinieristes;

----Verification-----

SELECT *
FROM employees
JOIN posts
ON pos_id = emp_pos_id
WHERE emp_superior_id = 10;











1/Créer une ligne 'employés retraités' dans la table "POSTS"
2/Sortir le Magasin d'Arras et aussi uniquement les employés de ce magasin "d'Arras"
3/Modifier la fiche de 'HANNAH' dans la table 'Employees"
4/Faire une requête pour sortir la liste avec l'ID des employés "Pépinieristes" dans la Table Posts
5/Nouvelle Requête avec SELECT(sortant tous les employés ayant pour poste Pépiniériste)
6/Trouver l'ancien Pépiniériste(avec date d'entrée en Entreprise "Emp_enter_date) en utilisant la fontion "MIN"
7/Recuperer ensuite cet ID(de l'ancien pépiniériste qui deviendra le nouveau Manager ,modifier sa fiche Emp_Salary en faisant un Update(Salaire X 1.5)
8/Update de nouveau sur tous les pépiniéristes pour mettre en valeur de la Rubrique "Emp_Superior" l'ID de leur nouveau Manager 










/******************************************************************------------------------------
SET @idshop = (select sho_id from shops where sho_city = 'Arras');
SET @id_new_manager = (SELECT emp_id
FROM employees 
JOIN posts ON emp_pos_id = posts.pos_id
WHERE pos_libelle = 'Pépiniériste' AND emp_sho_id = @idshop
ORDER BY emp_enter_date
limit 1);
*---------Verification du Résultat***************
SELECT @id_new_manager