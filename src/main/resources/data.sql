-- Clear existing data
DELETE FROM movie_actors;
DELETE FROM movie_genres;
DELETE FROM actors;
DELETE FROM genres;
DELETE FROM movies;

-- Insert Genres with explicit IDs for SQLite compatibility
INSERT INTO genres (id, name) VALUES (1, 'Action');
INSERT INTO genres (id, name) VALUES (2, 'Drama');
INSERT INTO genres (id, name) VALUES (3, 'Comedy');
INSERT INTO genres (id, name) VALUES (4, 'Sci-Fi');
INSERT INTO genres (id, name) VALUES (5, 'Thriller');
INSERT INTO genres (id, name) VALUES (6, 'Horror');
INSERT INTO genres (id, name) VALUES (7, 'Romance');
INSERT INTO genres (id, name) VALUES (8, 'Adventure');

-- Insert Actors with explicit IDs for SQLite compatibility
INSERT INTO actors (id, name, birth_date) VALUES (1, 'Tom Hanks', '1956-07-09');
INSERT INTO actors (id, name, birth_date) VALUES (2, 'Meryl Streep', '1949-06-22');
INSERT INTO actors (id, name, birth_date) VALUES (3, 'Leonardo DiCaprio', '1974-11-11');
INSERT INTO actors (id, name, birth_date) VALUES (4, 'Jennifer Lawrence', '1990-08-15');
INSERT INTO actors (id, name, birth_date) VALUES (5, 'Denzel Washington', '1954-12-28');
INSERT INTO actors (id, name, birth_date) VALUES (6, 'Emma Watson', '1990-04-15');
INSERT INTO actors (id, name, birth_date) VALUES (7, 'Robert Downey Jr.', '1965-04-04');
INSERT INTO actors (id, name, birth_date) VALUES (8, 'Scarlett Johansson', '1984-11-22');
INSERT INTO actors (id, name, birth_date) VALUES (9, 'Brad Pitt', '1963-12-18');
INSERT INTO actors (id, name, birth_date) VALUES (10, 'Angelina Jolie', '1975-06-04');
INSERT INTO actors (id, name, birth_date) VALUES (11, 'Morgan Freeman', '1937-06-01');
INSERT INTO actors (id, name, birth_date) VALUES (12, 'Samuel L. Jackson', '1948-12-21');
INSERT INTO actors (id, name, birth_date) VALUES (13, 'Natalie Portman', '1981-06-09');
INSERT INTO actors (id, name, birth_date) VALUES (14, 'Chris Hemsworth', '1983-08-11');
INSERT INTO actors (id, name, birth_date) VALUES (15, 'Chris Evans', '1981-06-13');

-- Insert Movies with explicit IDs for SQLite compatibility
INSERT INTO movies (id, title, release_year, duration) VALUES (1, 'The Shawshank Redemption', 1994, 142);
INSERT INTO movies (id, title, release_year, duration) VALUES (2, 'The Godfather', 1972, 175);
INSERT INTO movies (id, title, release_year, duration) VALUES (3, 'The Dark Knight', 2008, 152);
INSERT INTO movies (id, title, release_year, duration) VALUES (4, 'Pulp Fiction', 1994, 154);
INSERT INTO movies (id, title, release_year, duration) VALUES (5, 'Forrest Gump', 1994, 142);
INSERT INTO movies (id, title, release_year, duration) VALUES (6, 'Inception', 2010, 148);
INSERT INTO movies (id, title, release_year, duration) VALUES (7, 'The Matrix', 1999, 136);
INSERT INTO movies (id, title, release_year, duration) VALUES (8, 'Goodfellas', 1990, 146);
INSERT INTO movies (id, title, release_year, duration) VALUES (9, 'The Silence of the Lambs', 1991, 118);
INSERT INTO movies (id, title, release_year, duration) VALUES (10, 'Saving Private Ryan', 1998, 169);
INSERT INTO movies (id, title, release_year, duration) VALUES (11, 'The Avengers', 2012, 143);
INSERT INTO movies (id, title, release_year, duration) VALUES (12, 'Black Panther', 2018, 134);
INSERT INTO movies (id, title, release_year, duration) VALUES (13, 'Jurassic Park', 1993, 127);
INSERT INTO movies (id, title, release_year, duration) VALUES (14, 'Titanic', 1997, 195);
INSERT INTO movies (id, title, release_year, duration) VALUES (15, 'The Social Network', 2010, 120);
INSERT INTO movies (id, title, release_year, duration) VALUES (16, 'La La Land', 2016, 128);
INSERT INTO movies (id, title, release_year, duration) VALUES (17, 'Get Out', 2017, 104);
INSERT INTO movies (id, title, release_year, duration) VALUES (18, 'Mad Max: Fury Road', 2015, 120);
INSERT INTO movies (id, title, release_year, duration) VALUES (19, 'The Lion King', 1994, 88);
INSERT INTO movies (id, title, release_year, duration) VALUES (20, 'Spirited Away', 2001, 125);

-- Insert Movie-Genre relationships
INSERT INTO movie_genres (movie_id, genre_id) VALUES (1, 2);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (2, 2);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (3, 1);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (3, 5);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (4, 1);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (4, 5);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (5, 2);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (5, 3);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (6, 1);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (6, 4);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (7, 1);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (7, 4);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (8, 2);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (9, 5);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (10, 1);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (10, 2);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (11, 1);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (11, 4);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (12, 1);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (12, 4);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (13, 1);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (13, 4);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (14, 2);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (14, 7);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (15, 2);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (16, 2);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (16, 7);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (17, 5);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (17, 6);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (18, 1);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (18, 4);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (19, 3);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (19, 8);
INSERT INTO movie_genres (movie_id, genre_id) VALUES (20, 8);

-- Insert Movie-Actor relationships
INSERT INTO movie_actors (movie_id, actor_id) VALUES (1, 1);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (1, 11);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (5, 1);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (10, 1);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (6, 3);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (3, 7);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (7, 8);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (4, 9);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (9, 2);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (11, 7);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (11, 8);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (11, 14);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (11, 15);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (12, 5);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (14, 3);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (14, 8);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (15, 3);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (16, 4);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (17, 5);
INSERT INTO movie_actors (movie_id, actor_id) VALUES (18, 9);