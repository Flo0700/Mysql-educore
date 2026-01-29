INSERT INTO users (username, email) VALUES
('john_doe', 'john@example.com'),('sali', 'sali@example.com'),
('charles', 'charles@example.com'),('flora', 'flora@example.com'),
('yann', 'yann@example.com'),('joe', 'joe@example.com'),
('nadiani', 'nadiani@example.com'),('louis', 'louis@example.com'),
('maurel', 'maurel@example.com'),('diby', 'diby@example.com'),
('jiji', 'jiji@example.com'),('sara_kolo', 'sara@example.com');

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
('Project Management Principles', 39.95);

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
(12, 4, 35);

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
(12, 4, 50.75);