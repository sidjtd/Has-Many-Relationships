-- # Has Many Relationships

-- When connecting to your pg database, connect from this project directory.

-- To run sql statements from an external file, use the \i [filepath] command.

-- ### SQL 1-n Relationships and Joins Exercise in PostgreSQL


-- ## Setup schema and relationships



-- 1. Create a new postgres user named `has_many_user`
DROP DATABASE IF EXISTS has_many_blogs;

-- 1. Create a new database named `has_many_blogs` owned by `has_many_user`
DROP user IF EXISTS has_many_user;
CREATE user has_many_user;
CREATE DATABASE has_many_blogs OWNER has_many_user;
\connect has_many_blogs;

-- 1. Before each create table statement, add a drop table if exists statement.
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;

-- 1. In `has_many_blogs.sql` Create the tables (including any PKs, Indexes, and Constraints that you may need) to fulfill the requirements of the **has_many_blogs schema** below.
-- 1. Create the necessary FKs needed to relate the tables according to the **relationship table** below.
CREATE TABLE posts
( id serial,
  username character varying(90) NOT NULL,
  first_name character varying(90) DEFAULT NULL,
  last_name character varying(90) DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE  NOT NULL DEFAULT now(),
  PRIMARY KEY (id)
);

CREATE TABLE posts
( id serial,
  title character varying(180) DEFAULT NULL,
  url character varying(510) DEFAULT NULL,
  content text DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  user_id integer,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments
( id serial,
  body character varying(510) DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  user_id integer,
  posts_id integer,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (posts_id) REFERENCES posts(id)
);
-- 1. Run the provided `scripts/blog_data.sql`
\i scripts/blog_data.sql;