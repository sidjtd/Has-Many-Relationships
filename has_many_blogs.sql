DROP DATABASE IF EXISTS has_many_blogs;
DROP user IF EXISTS has_many_user;

CREATE user has_many_user;

CREATE DATABASE has_many_blogs OWNER has_many_user;

\connect has_many_blogs;

DROP TABLE IF EXISTS users;