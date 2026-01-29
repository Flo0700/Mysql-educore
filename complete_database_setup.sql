-- ========================================
-- Database Initialization Script for educore_flo_sony
-- This script creates the database, tables, and inserts all data
-- Execute this entire script in MySQL Workbench
-- Team : Flo, Sony
-- ========================================

-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS educore_flo_sony;
USE educore_flo_sony;


-- Table Creation

-- Users table with primary key and unique constraints
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Courses table with primary key and unique constraints
CREATE TABLE IF NOT EXISTS courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    prix DECIMAL(10, 2) NOT NULL CHECK (prix >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Enrollments table with foreign key constraints and progress validation
CREATE TABLE IF NOT EXISTS enrollments (
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    progress INT DEFAULT 0 CHECK (progress BETWEEN 0 AND 100),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Payments table with foreign key constraints and amount validation
CREATE TABLE IF NOT EXISTS payments (
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount >= 0),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Data Insertion

-- Insert 30 users
INSERT INTO users (username, email) VALUES
('johndoe', 'john@example.com'),('sali', 'sali@example.com'),
('charles', 'charles@example.com'),('flora', 'flora@example.com'),
('yann', 'yann@example.com'),('joe', 'joe@example.com'),
('nadiani', 'nadiani@example.com'),('louis', 'louis@example.com'),
('maurel', 'maurel@example.com'),('diby', 'diby@example.com'),
('jiji', 'jiji@example.com'),('sarakolo', 'sara@example.com'),
('reamean', 'reamean@example.com'),('reaname', 'reaname@example.com'),
('alexmartin', 'alex@example.com'),('emmawilson', 'emma@example.com'),
('michaelbrown', 'michael@example.com'),('sophiadavis', 'sophia@example.com'),
('jamestaylor', 'james@example.com'),('oliviamartinez', 'olivia@example.com'),
('robertgarcia', 'robert@example.com'),('isabellarodriguez', 'isabella@example.com'),
('davidhernandez', 'david@example.com'),('mialopez', 'mia@example.com'),
('josephgonzalez', 'joseph@example.com'),('charlottewilson', 'charlotte@example.com'),
('thomasanderson', 'thomas@example.com'),('ameliaanderson', 'amelia@example.com');

-- Insert 30 courses
INSERT INTO courses (title, prix) VALUES
('Introduction to Python', 29.99),
('Web Development Basics', 35.50),
('Data Science Fundamentals', 45.00),
('Machine Learning 101', 50.75),
('Database Management Systems', 38.20),
('Cloud Computing Essentials', 42.00),
('Cybersecurity Basics', 33.33),
('Mobile App Development', 47.89),
('Digital Marketing Strategies', 30.00),
('Project Management Principles', 39.95),
('Advanced JavaScript Programming', 55.00),
('React.js Development', 52.50),
('Node.js Backend Development', 48.75),
('Python for Data Analysis', 41.25),
('Deep Learning with TensorFlow', 65.00),
('AWS Cloud Architecture', 58.00),
('DevOps Fundamentals', 43.80),
('Blockchain Technology', 72.50),
('UI/UX Design Principles', 36.00),
('Artificial Intelligence Ethics', 34.99),
('Full Stack Web Development', 89.99),
('Data Visualization with D3.js', 46.50),
('Kubernetes Container Orchestration', 61.25),
('Natural Language Processing', 54.75),
('Computer Vision Basics', 49.00),
('MongoDB Database Design', 37.50),
('Angular Framework Mastery', 51.25),
('Microservices Architecture', 56.80),
('GraphQL API Development', 44.99),
('Agile Software Development', 38.75);

-- Insert enrollments with repeated user_ids
INSERT INTO enrollments (user_id, course_id, progress) VALUES
(1, 1, 20),
(1, 2, 50),
(2, 3, 75),
(2, 4, 10),
(3, 5, 100),
(4, 6, 0),
(5, 7, 40),
(6, 8, 60),
(7, 9, 80),
(8, 10, 25),
(9, 1, 55),
(10, 2, 90),
(11, 3, 15),
(12, 4, 35),
(1, 11, 45),
(2, 12, 70),
(3, 13, 30),
(4, 14, 85),
(5, 15, 20),
(6, 16, 60),
(7, 17, 95),
(8, 18, 10),
(9, 19, 40),
(10, 20, 75),
(11, 21, 50),
(12, 22, 80),
(1, 23, 25),
(2, 24, 65),
(3, 25, 90),
(4, 26, 35),
(5, 27, 55),
(6, 28, 70);

-- Insert payments matching enrollments
INSERT INTO payments (user_id, course_id, amount) VALUES
(1, 1, 29.99),
(1, 2, 35.50),
(2, 3, 45.00),
(2, 4, 50.75),
(3, 5, 38.20),
(4, 6, 42.00),
(5, 7, 33.33),
(6, 8, 47.89),
(7, 9, 30.00),
(8, 10, 39.95),
(9, 1, 29.99),
(10, 2, 35.50),
(11, 3, 45.00),
(12, 4, 50.75),
(1, 11, 55.00),
(2, 12, 52.50),
(3, 13, 48.75),
(4, 14, 41.25),
(5, 15, 65.00),
(6, 16, 58.00),
(7, 17, 43.80),
(8, 18, 72.50),
(9, 19, 36.00),
(10, 20, 34.99),
(11, 21, 89.99),
(12, 22, 46.50),
(1, 23, 61.25),
(2, 24, 54.75),
(3, 25, 49.00),
(4, 26, 37.50),
(5, 27, 51.25),
(6, 28, 56.80);

-- Script Completion
SELECT 'Database initialization completed successfully!' as status;
SELECT COUNT(*) as total_users FROM users;
SELECT COUNT(*) as total_courses FROM courses;
SELECT COUNT(*) as total_enrollments FROM enrollments;
SELECT COUNT(*) as total_payments FROM payments;
