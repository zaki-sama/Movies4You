

-- similar movie table
create table similar_movie_data (
	movie_id INTEGER,
	similar_to_id INTEGER,
    CONSTRAINT similar_movie_fk_1 FOREIGN KEY (movie_id) REFERENCES movie_data (movie_id),
    CONSTRAINT similar_movie_fk_2 FOREIGN KEY (similar_to_id) REFERENCES movie_data (movie_id)
);

INSERT INTO similar_movie_data VALUES (22485, 23704);
INSERT INTO similar_movie_data VALUES (21348, 20745);
INSERT INTO similar_movie_data VALUES (22485, 99498);
INSERT INTO similar_movie_data VALUES (67294, 87959);
INSERT INTO similar_movie_data VALUES (71658, 67950);


-- movie actor table
create table movie_actor_data (
	movie_id INTEGER,
	actor_id INTEGER,
	character_name VARCHAR(50),
	PRIMARY KEY (movie_id, actor_id),
    CONSTRAINT movie_actor_fk_1 FOREIGN KEY (movie_id) REFERENCES movie_data (movie_id),
    CONSTRAINT movie_actor_fk_1 FOREIGN KEY (actor_id) REFERENCES actor_data (actor_id)
);
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (62679, 04947, 'Helyn');
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (22485, 06853, 'Bart');
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (16088, 67904, 'Tabor');
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (36138, 04947, 'Renee');
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (44174, 20103, 'Sonnie');