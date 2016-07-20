DROP DATABASE IF EXISTS has_many_blogs;
DROP user IF EXISTS has_many_user;

CREATE user has_many_user;
CREATE DATABASE has_many_blogs OWNER has_many_user;

\connect has_many_blogs;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;

CREATE TABLE posts
(
  id serial,
  username character varying(90) NOT NULL,
  first_name character varying(90) DEFAULT NULL,
  last_name character varying(90) DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE  NOT NULL DEFAULT now(),
  PRIMARY KEY (id)
);

