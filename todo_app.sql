DROP USER IF EXISTS michael;

CREATE ROLE michael WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;

CREATE DATABASE todo_app;

\c todo_app

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP,
  completed BOOLEAN NOT NULL DEFAULT false
);

ALTER TABLE tasks
  DROP completed;

ALTER TABLE tasks
  ADD completed_at TIMESTAMP;

ALTER TABLE tasks
  ALTER updated_at SET NOT NULL;
ALTER TABLE tasks
  ALTER updated_at SET DEFAULT now();

INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this exercise');

INSERT INTO tasks VALUES (DEFAULT, 'Study PostgreSQL', 'Read all the documentation');

SELECT title FROM tasks WHERE completed_at is NULL;

UPDATE tasks
  SET completed_at = now()
  WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at is NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks (title, description) VALUES ('mistake 1', 'a test entry'),
  ('mistake 2', 'another test entry'),
  ('third mistake', 'another test entry');

SELECT title FROM tasks WHERE title LIKE '%mistake%';


-- SELECT * FROM tasks;
-- \d+ tasks;