-- Désactiver les contraintes de clés étrangères
SET FOREIGN_KEY_CHECKS = 0;

-- Supprimer le contenu de toutes les tables
TRUNCATE TABLE payments;
TRUNCATE TABLE enrollments;
TRUNCATE TABLE courses;
TRUNCATE TABLE users;

-- Réactiver les contraintes de clés étrangères
SET FOREIGN_KEY_CHECKS = 1;
