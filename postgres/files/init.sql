-- Créer la base jwdb si elle n'existe pas
DO $$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'jwdb') THEN
      CREATE DATABASE jwdb;
   END IF;
END
$$;

-- Créer la base tomcat si elle n'existe pas
DO $$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'tomcat') THEN
      CREATE DATABASE tomcat;
   END IF;
END
$$;

-- Se connecter à la base tomcat pour créer la table de session
\connect tomcat

CREATE TABLE IF NOT EXISTS tomcat_sessions (
  session_id     VARCHAR(100) PRIMARY KEY,
  valid_session  CHAR(1) NOT NULL,
  max_inactive   INTEGER NOT NULL,
  last_access    BIGINT NOT NULL,
  app_name       VARCHAR(255),
  session_data   BYTEA
);

