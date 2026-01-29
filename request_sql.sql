-- ========================================
-- MISSION 1 - Tests de contraintes et contrôle qualité
-- ========================================

-- Étape 6 - Vérifications rapides (mini-tests)
USE educore_flo_sony;

-- Test 1: Insertion d'un user (doit réussir)
INSERT INTO users (username, email) VALUES 
('testuser', 'test@example.com');

-- Test 2: Email en double (doit échouer)
-- INSERT INTO users (username, email) VALUES 
-- ('testuser2', 'test@example.com');  -- Commenté pour éviter l'erreur

-- Test 3: Progress = 120 (doit échouer)
-- INSERT INTO enrollments (user_id, course_id, progress) VALUES 
-- (1, 1, 120);  -- Commenté pour éviter l'erreur


-- MISSION 2 - Contrôle qualité (4 requêtes d'audit)


-- 1. Compter chaque table
SELECT 'users' as table_name, COUNT(*) as record_count FROM users
UNION ALL
SELECT 'courses', COUNT(*) FROM courses
UNION ALL  
SELECT 'enrollments', COUNT(*) FROM enrollments
UNION ALL
SELECT 'payments', COUNT(*) FROM payments;

-- 2. Vérifier qu'aucun enrollment n'a progress <0 ou >100
SELECT COUNT(*) as invalid_progress_count
FROM enrollments 
WHERE progress < 0 OR progress > 100;

-- 3. Vérifier que chaque enrollment pointe un user et un course existants
SELECT COUNT(*) as orphan_enrollments
FROM enrollments e
LEFT JOIN users u ON e.user_id = u.id
LEFT JOIN courses c ON e.course_id = c.id
WHERE u.id IS NULL OR c.id IS NULL;

-- 4. Vérifier que les montants sont positifs
SELECT COUNT(*) as negative_payments
FROM payments 
WHERE amount < 0;


-- MISSION 3 - Marketing : stats business

-- Étape 1 - Cours les plus suivis
SELECT 
    c.title,
    COUNT(e.user_id) as nb_inscrits
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
GROUP BY c.id, c.title
ORDER BY nb_inscrits DESC;

-- Étape 2 - Cours les plus rentables (approche simple)
SELECT 
    c.title,
    COALESCE(SUM(p.amount), 0) as revenu_total
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
LEFT JOIN payments p ON e.user_id = p.user_id AND e.course_id = p.course_id
GROUP BY c.id, c.title
ORDER BY revenu_total DESC;

-- Étape 3 - Clients multi-achats
SELECT 
    u.username,
    u.email,
    COUNT(p.user_id) as nb_paiements
FROM users u
JOIN payments p ON u.id = p.user_id
GROUP BY u.id, u.username, u.email
HAVING COUNT(p.user_id) >= 2
ORDER BY nb_paiements DESC;

-- Étape 4 - Users qui n'ont jamais payé
SELECT 
    u.username,
    u.email
FROM users u
LEFT JOIN payments p ON u.id = p.user_id
WHERE p.user_id IS NULL
ORDER BY u.username;

-- MISSION 4 - Pédagogie : engagement & progression

-- Étape 1 - Progression moyenne par cours
SELECT 
    c.title,
    AVG(e.progress) as avg_progress,
    COUNT(e.user_id) as nb_inscrits
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
GROUP BY c.id, c.title
ORDER BY avg_progress DESC;

-- Étape 2 - Identifier les "abandons" (progress < 25)
SELECT 
    u.username,
    c.title,
    e.progress
FROM users u
JOIN enrollments e ON u.id = e.user_id
JOIN courses c ON e.course_id = c.id
WHERE e.progress < 25
ORDER BY e.progress, u.username;

-- Étape 3 - Cours "à risque" (moyenne < 50 ET au moins 3 inscrits)
SELECT 
    c.title,
    AVG(e.progress) as avg_progress,
    COUNT(e.user_id) as nb_inscrits
FROM courses c
JOIN enrollments e ON c.id = e.course_id
GROUP BY c.id, c.title
HAVING AVG(e.progress) < 50 AND COUNT(e.user_id) >= 3
ORDER BY avg_progress;
