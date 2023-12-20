DROP DATABASE craiglist;

CREATE DATABASE craiglist;

\c craiglist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region TEXT UNIQUE
);

CREATE TABLE user
(
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE,
    preferred_region INTEGER REFERENCES regions ON DELETE SET NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT UNIQUE
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    post_title TEXT,
    post_text TEXT,
    post_user INTEGER REFERENCES user ON DELETE SET NULL,
    post_location INTEGER REFERENCES categories ON DELETE SET NULL,
    post_region INTEGER REFERENCES regions ON DELETE SET NULL
);