-- create "users" table
CREATE TABLE users (
  id BIGSERIAL NOT NULL,
  name VARCHAR(255) NOT NULL DEFAULT 'unknown',
  age BIGINT NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted_at TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL,
  PRIMARY KEY (id)
);
