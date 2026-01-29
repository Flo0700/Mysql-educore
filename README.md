# MySQL Educore Database - Guide d'utilisation

##  Fichiers disponibles

###  `complete_database_setup.sql`

**Utilisation :** Création complète de la base de données

```sql
-- Exécutez ce fichier en premier pour tout créer :
-- - Base de données educore_flo_sony
-- - 4 tables (users, courses, enrollments, payments)
-- - 30 utilisateurs, 30 cours, 30 inscriptions, 30 paiements
```

###  `delete_table.sql`

**Utilisation :** Suppression de toutes les tables

```sql
-- Exécutez ce fichier pour nettoyer la base de données
-- Supprime les tables dans le bon ordre (contraintes foreign keys)
```

###  `request_sql.sql`

**Utilisation :** Requêtes d'analyse et de contrôle

```sql
-- Contient toutes les requêtes des missions :
-- - Contrôle qualité (4 requêtes d'audit)
-- - Marketing (stats business)
-- - Pédagogie (progression et engagement)
```
##  Notes importantes

- **Ordre d'exécution** : Toujours exécuter `complete_database_setup.sql` en premier
- **Nettoyage** : Utiliser `delete_table.sql` avant de recréer la base
- **Tests** : Les requêtes de test sont commentées pour éviter les erreurs
- **Team** : Flo, Sony

##  Objectifs pédagogiques

Comprendre les concepts :

- Contraintes (PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK)
- Jointures (INNER JOIN, LEFT JOIN)
- Agrégation (COUNT, AVG, SUM)
- Filtrage (WHERE, HAVING)
- Tri (ORDER BY)
- Groupement (GROUP BY)
---

_Base de données éducative pour l'apprentissage SQL_
