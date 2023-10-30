USE kaamelott;

-- Le prénom, nom et âge des personnages

SELECT firstname, lastname,age
FROM Person;

-- Le prénom, nom des personnages ainsi que leur royaume, uniquement pour ceux étant reliés à un royaume

SELECT P.firstname, P.lastname, K.name
FROM Person AS P
JOIN Kingdom AS K ON P.kingdom_id = K.id
WHERE P.kingdom_id IS NOT NULL;

-- La même chose en incluant tous les personnages

SELECT P.firstname, P.lastname, K.name
FROM Person AS P
LEFT JOIN Kingdom AS K ON P.kingdom_id = K.id
WHERE P.kingdom_id IS NOT NULL;

-- La moyenne de l’âge des personnages

SELECT AVG(age) AS moyenne_age 
FROM Person;

-- La moyenne d'âge de tous les personnages n’ayant pas le rôle de magicien

SELECT AVG(P.age) AS moyenne_age
FROM Person P
JOIN Role R ON P.role_id = R.id
WHERE R.id = 1 OR R.id = 2;

-- Le nombre de personnage par royaume (inclure les royaumes n’ayant pas de personnage)

SELECT K.name AS kingdom_name, COUNT(P.id) AS nb_personnage
FROM Person P 
RIGHT JOIN Kingdom K ON P.kingdom_id = K.id
GROUP BY K.id;

-- La moyenne de l’âge par rôle

SELECT R.role, AVG(age) AS moyenne_age
FROM Person P 
JOIN Role R ON P.role_id = r.id
GROUP BY R.role;

-- La liste de tous les personnages avec leur rôle et royaume éventuels

SELECT CONCAT(P.firstname, ' ', P.lastname) AS full_name, R.role, K.name
FROM Person P
LEFT JOIN Role R ON P.role_id = R.id
LEFT JOIN Kingdom K ON P.kingdom_id = K.id;

-- La liste des royaumes ayant au moins 2 sujets

SELECT K.name AS kingdom_name, COUNT(P.id) AS nb_person
FROM Kingdom K
JOIN Person P ON K.id = P.kingdom_id
GROUP BY K.name
HAVING COUNT(P.id) >=2;
