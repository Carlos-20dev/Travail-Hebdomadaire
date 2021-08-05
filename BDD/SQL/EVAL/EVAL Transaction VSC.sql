/----------EVAL SQL PARTIE TRANSACTION FINIE DS L'ORDRE---------------------



START TRANSACTION;
INSERT INTO posts (pos_libelle)
VALUES ('Retraité');
SET @idshop = (select sho_id from shops where sho_city = 'Arras');
SET @idretraite = (select pos_id from posts where pos_libelle = 'Retraité');
update employees set emp_pos_id = @idretraite where emp_lastname = 'HANNAH' AND  emp_firstname = 'Amity'AND emp_sho_id = @idshop;
SELECT pos_id FROM `posts` WHERE pos_libelle = 'Pépinieriste';
SELECT *
From Employees
JOIN posts ON emp_pos_id = posts.pos_id
WHERE pos_libelle = 'Pépiniériste' AND emp_sho_id = @idshop;
SET @id_new_manager = (SELECT emp_id
FROM employees 
JOIN posts ON emp_pos_id = posts.pos_id
WHERE pos_libelle = 'Pépiniériste' AND emp_sho_id = @idshop
ORDER BY emp_enter_date
limit 1);
SET @post_id_manager = (SELECT pos_id
FROM posts 
WHERE pos_libelle LIKE '%Manage%'
limit 1);
UPDATE employees
SET 
emp_salary = (emp_salary*1.05),
emp_pos_id = @post_id_manager 
WHERE emp_id = @id_new_manager;
SET @les_pepinieristes = (SELECT pos_id
FROM posts
WHERE pos_libelle = 'Pépinieriste');
SET @id_new_manager = (SELECT emp_id 
FROM employees 
WHERE emp_firstname = 'Dorian');
UPDATE employees
SET 
emp_superior_id = @id_new_manager
WHERE emp_pos_id = @les_pepinieristes;
COMMIT


/---------------------------------------------------------------------

-- START TRANSACTION;
-- INSERT INTO posts (pos_libelle)
-- VALUES ('Retraité');
-- SET @idshop = (select sho_id from shops where sho_city = 'Arras');
-- SET @idretraite = (select pos_id from posts where pos_libelle = 'Retraité');
-- update employees set emp_pos_id = @idretraite where emp_lastname = 'HANNAH' AND  emp_firstname = 'Amity'AND emp_sho_id = @idshop;
-- SELECT pos_id FROM `posts` WHERE pos_libelle = 'Pépinieriste';
-- SELECT *
-- From Employees
-- JOIN posts ON emp_pos_id = posts.pos_id
-- WHERE pos_libelle = 'Pépiniériste' AND emp_sho_id = @idshop;
-- SET @id_new_manager = (SELECT emp_id
-- FROM employees 
-- JOIN posts ON emp_pos_id = posts.pos_id
-- WHERE pos_libelle = 'Pépiniériste' AND emp_sho_id = @idshop
-- ORDER BY emp_enter_date
-- limit 1);
-- SET @post_id_manager = (SELECT pos_id
-- FROM posts 
-- WHERE pos_libelle LIKE '%Manage%'
-- limit 1);
-- UPDATE employees
-- SET 
-- emp_salary = (emp_salary*1.05),
-- emp_pos_id = @post_id_manager 
-- WHERE emp_id = @id_new_manager;
-- SET @les_pepinieristes = (SELECT pos_id
-- FROM posts
-- WHERE pos_libelle = 'Pépinieriste');
-- SET @id_new_manager = (SELECT emp_id 
-- FROM employees 
-- WHERE emp_firstname = 'Dorian');
-- UPDATE employees
-- SET 
-- emp_superior_id = @id_new_manager
-- WHERE emp_pos_id = @les_pepinieristes;