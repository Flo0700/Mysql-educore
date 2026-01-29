--- delete_all_tables.sql ---
-- Delete all tables in correct order because of foreign key constraints

USE educore_flo_sony;

-- Drop tables with foreign keys first, then tables they reference
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS users;

-- Optionally drop the database entirely

-- DROP DATABASE IF EXISTS educore_flo_sony;

