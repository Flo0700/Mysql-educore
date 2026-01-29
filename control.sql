SELECT 'users', COUNT(*) AS total_users FROM users;

SELECT id, user_id, course_id, progress
FROM enrollments WHERE progress < 0 OR progress > 100;
