-- create database
CREATE DATABASE movies_4_you_db;

GRANT ALL PRIVILEGES on movies_4_you_db.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

-- working inside database
USE movies_4_you_db;

DROP TABLE IF EXISTS analyst_data;
-- good
-- analyst table
CREATE TABLE analyst_data (
	company_id INTEGER PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	years_working INTEGER,
	salary VARCHAR(50)
);

INSERT INTO analyst_data VALUES (37013, 'Rafe', 'McAlister', 6, '$73659.82');
INSERT INTO analyst_data VALUES (23286, 'Irita', 'Brantzen', 4, '$71677.39');
INSERT INTO analyst_data VALUES (33307, 'Dayle', 'Reeken', 16, '$79994.43');
INSERT INTO analyst_data VALUES (87839, 'Meg', 'Roadnight', 21, '$97497.73');
INSERT INTO analyst_data VALUES (15813, 'Tisha', 'Morrallee', 17, '$97038.89');

DROP TABLE IF EXISTS user_data;
-- good
-- user table
create table user_data (
	user_id INTEGER PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	age INTEGER,
	address_state VARCHAR(50),
	address_country VARCHAR(50),
	email_address VARCHAR(50)
);

INSERT INTO user_data VALUES (85739, 'Ursuline', 'Torre', 29, 'Georgia', 'United States', 'utorre0@virginia.edu');
INSERT INTO user_data VALUES (11029, 'Ichabod', 'Ouver', 60, 'Massachusetts', 'United States', 'iouver1@forbes.com');
INSERT INTO user_data VALUES (00087, 'Marley', 'Ivachyov', 23, 'Colorado', 'United States', 'mivachyov2@sourceforge.net');
INSERT INTO user_data VALUES (74803, 'Clemence', 'Rahl', 46, 'Rhode Island', 'United States', 'crahl3@oracle.com');
INSERT INTO user_data VALUES (33845, 'Alyson', 'Vines', 18, 'Nebraska', 'United States', 'avines4@google.fr');

DROP TABLE IF EXISTS actor_data;
-- good
-- actor table
create table actor_data (
	actor_id INTEGER PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	active_since INTEGER,
	age INTEGER
);

INSERT INTO actor_data (actor_id, first_name, last_name, active_since, age) VALUES (04947, 'Rafaelia', 'Stanbury', 2007, 69);
INSERT INTO actor_data (actor_id, first_name, last_name, active_since, age) VALUES (20103, 'Shellysheldon', 'Yarwood', 1990, 60);
INSERT INTO actor_data (actor_id, first_name, last_name, active_since, age) VALUES (54608, 'Stephani', 'Ewin', 1995, 63);
INSERT INTO actor_data (actor_id, first_name, last_name, active_since, age) VALUES (06853, 'Ernie', 'Tigwell', 2010, 76);
INSERT INTO actor_data (actor_id, first_name, last_name, active_since, age) VALUES (67904, 'Trace', 'Sotham', 2008, 76);

DROP TABLE IF EXISTS director_data;
-- good
-- director table
create table director_data (
	director_id INTEGER NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	experience_level INT NOT NULL,
	CONSTRAINT dir_pk PRIMARY KEY (director_id)
);

INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (91399, 'Simone', 'Strutz', 9);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (79580, 'Freedman', 'Pittford', 7);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (85682, 'Darcie', 'Pratt', 4);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (75677, 'Mirella', 'Garrit', 4);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (65725, 'Clare', 'Fairtlough', 8);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (27562, 'Breena', 'Babar', 3);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (87452, 'Klement', 'MacPike', 8);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (15547, 'Carmella', 'Wassung', 9);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (47030, 'Earlie', 'Mougenel', 9);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (80699, 'Noelle', 'Neeson', 5);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (77438, 'Nikolos', 'Dower', 4);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (00564, 'Marrion', 'Elton', 7);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (86404, 'Monique', 'Wearn', 2);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (83007, 'Barny', 'Turland', 4);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (43668, 'Chevy', 'Villar', 9);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (99108, 'Jarret', 'Humphrey', 7);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (50612, 'Rudiger', 'Georgius', 6);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (38272, 'Lucina', 'Colbourn', 5);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (80903, 'Jocko', 'Sutherns',  6);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (33006, 'Lannie', 'Weatherup', 9);

DROP TABLE IF EXISTS preferences_data;
-- EMPTY
-- preferences table
create table preferences_data (
	set_id INTEGER NOT NULL,
	user_id INTEGER  NOT NULL,
	primary_lang VARCHAR(50)  NOT NULL,
	length_limit INTEGER  NOT NULL,
	max_maturity_rating VARCHAR(50)  NOT NULL,
	min_critic_rating VARCHAR(50)  NOT NULL,
	fav_director_id INTEGER  NOT NULL,
	fav_actor_id INTEGER  NOT NULL,
	fav_genre_id INTEGER  NOT NULL,
	CONSTRAINT pref_pk PRIMARY KEY (set_id),
    CONSTRAINT preferences_fk_2 FOREIGN KEY (user_id) REFERENCES user_data (user_id),
    CONSTRAINT preferences_fk_3 FOREIGN KEY (fav_actor_id) REFERENCES actor_data (actor_id),
    CONSTRAINT preferences_fk_1 FOREIGN KEY (fav_director_id) REFERENCES director_data (director_id)
);

INSERT INTO preferences_data VALUES (20014, 34030, 'Spanish', 71, 'MA', 'PG', 06348, 43537, 66730);
INSERT INTO preferences_data VALUES (46255, 83170, 'Portuguese', 95, 'PG-13', 'G', 37644, 53633, 90920);
INSERT INTO preferences_data VALUES (28796, 06361, 'English', 128, 'X', 'G', 14300, 23552, 15265);
INSERT INTO preferences_data VALUES (46174, 46691, 'English', 140, 'R', 'G', 31776, 75986, 92111);
INSERT INTO preferences_data VALUES (37559, 07179, 'English', 154, 'PG', 'G', 99322, 51321, 01734);
