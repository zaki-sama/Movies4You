-- create database
CREATE DATABASE movies_4_you_db;

GRANT ALL PRIVILEGES on movies_4_you_db.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

USE movies_4_you_db;

-- analyst table
DROP TABLE IF EXISTS analyst_data;
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

-- user table
DROP TABLE IF EXISTS user_data;
CREATE TABLE user_data (
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

-- actor table
DROP TABLE IF EXISTS actor_data;
CREATE TABLE actor_data (
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

-- director table
DROP TABLE IF EXISTS director_data;
CREATE TABLE director_data (
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

-- preferences table
DROP TABLE IF EXISTS preferences_data;
CREATE TABLE preferences_data (
	set_id INTEGER NOT NULL,
	user_id INTEGER  NOT NULL,
	primary_lang VARCHAR(50)  NOT NULL,
	length_limit INTEGER  NOT NULL,
	max_maturity_rating VARCHAR(50) NOT NULL,
	min_critic_rating VARCHAR(50) NOT NULL,
	fav_director_id INTEGER NOT NULL,
	fav_actor_id INTEGER NOT NULL,
	fav_genre_id INTEGER NOT NULL,
	CONSTRAINT pref_pk PRIMARY KEY (set_id)
);

INSERT INTO preferences_data VALUES (20014, 11029, 'Spanish', 71, 'MA', 'PG', 06348, 43537, 66730);
INSERT INTO preferences_data VALUES (46255, 83170, 'Portuguese', 95, 'PG-13', 'G', 37644, 53633, 90920);
INSERT INTO preferences_data VALUES (28796, 06361, 'English', 128, 'X', 'G', 14300, 23552, 15265);
INSERT INTO preferences_data VALUES (46174, 46691, 'English', 140, 'R', 'G', 31776, 75986, 92111);
INSERT INTO preferences_data VALUES (37559, 07179, 'English', 154, 'PG', 'G', 99322, 51321, 01734);

-- preference trigger table
CREATE TABLE preference_trigger_data (
	set_id INTEGER NOT NULL,
	warning_name VARCHAR(50) NOT NULL,
	intensity_tolerance INT NOT NULL,
	CONSTRAINT pref_trig_pk PRIMARY KEY (set_id, warning_name),
    CONSTRAINT preference_trigger_fk_1 FOREIGN KEY (set_id) REFERENCES preferences_data (set_id)
);

INSERT INTO preference_trigger_data (set_id, warning_name, intensity_tolerance) VALUES (46174, 'Violence', 4);
INSERT INTO preference_trigger_data (set_id, warning_name, intensity_tolerance) VALUES (37559, 'Foul Language', 5);
INSERT INTO preference_trigger_data (set_id, warning_name, intensity_tolerance) VALUES (20014, 'Violence', 8);
INSERT INTO preference_trigger_data (set_id, warning_name, intensity_tolerance) VALUES (37559, 'Nudity', 2);
INSERT INTO preference_trigger_data (set_id, warning_name, intensity_tolerance) VALUES (28796, 'Sexual Content', 8);

-- submitter table
CREATE TABLE submitter_data (
	employee_id INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	salary VARCHAR(50) NOT NULL,
	address_street VARCHAR(50) NOT NULL,
	address_city VARCHAR(50) NOT NULL,
	address_state VARCHAR(50) NOT NULL,
	address_zip VARCHAR(50) NOT NULL,
	address_country VARCHAR(50) NOT NULL,
	supervisor_id INT,
    CONSTRAINT sub_pk PRIMARY KEY (employee_id)
);

INSERT INTO submitter_data VALUES (24249, 'Ali', 'Sankey', '$50777.14', '957 Jana Drive', 'Evansville', 'Indiana', '47725', 'United States', null);
INSERT INTO submitter_data VALUES (35913, 'Hoyt', 'Hartburn', '$49342.22', '6859 Del Sol Lane', 'Grand Forks', 'North Dakota', '58207', 'United States', 24249);
INSERT INTO submitter_data VALUES (78752, 'Barnaby', 'Starkings', '$96210.1', '07 4th Crossing', 'Corona', 'California', '92883', 'United States', 24249);
INSERT INTO submitter_data VALUES (54217, 'Evangelia', 'Sprull', '$78076.91', '1341 Maywood Parkway', 'Miami', 'Florida', '33169', 'United States', 35913);
INSERT INTO submitter_data VALUES (78330, 'Godiva', 'Petley', '$44464.69', '34027 Merchant Drive', 'Vienna', 'Virginia', '22184', 'United States', 35913);


-- email table
CREATE TABLE email_data (
	email_address VARCHAR(50) PRIMARY KEY NOT NULL,
	person_id INTEGER NOT NULL,
	description VARCHAR(50) NOT NULL
);

INSERT INTO email_data VALUES ('fgillis0@tuttocitta.it', 37013, 'Business');
INSERT INTO email_data VALUES ('jivoshin1@jiathis.com', 87839, 'Business');
INSERT INTO email_data VALUES ('dorpin2@phpbb.com', 15813, 'Business');
INSERT INTO email_data VALUES ('kbrockie3@cornell.edu', 33307, 'Business');
INSERT INTO email_data VALUES ('tbasset4@opera.com', 23286, 'Business');
INSERT INTO email_data VALUES ('dcarus5@house.gov', 24249, 'Business');
INSERT INTO email_data VALUES ('alambshine6@ebay.com', 778752, 'Business');
INSERT INTO email_data VALUES ('dbroadway7@businessinsider.com', 54217, 'Business');
INSERT INTO email_data VALUES ('bkelleway8@cloudflare.com', 35913, 'Business');
INSERT INTO email_data VALUES ('wguisby9@hhs.gov', 78330, 'Business');
INSERT INTO email_data VALUES ('jmathiasa@sciencedaily.com', 37013, 'Personal');
INSERT INTO email_data VALUES ('dbaineb@tripadvisor.com', 87839, 'Personal');
INSERT INTO email_data VALUES ('khasselbyc@unicef.org', 15813, 'Personal');
INSERT INTO email_data VALUES ('gmcinteed@paypal.com', 24249, 'Personal');

-- genre table
CREATE TABLE genre_data (
	genre_id INTEGER PRIMARY KEY,
	name VARCHAR(50)
);

INSERT INTO genre_data VALUES (73666, 'Thriller');
INSERT INTO genre_data VALUES (74570, 'Mystery');
INSERT INTO genre_data VALUES (23747, 'Children');
INSERT INTO genre_data VALUES (87626, 'Documentary');
INSERT INTO genre_data VALUES (85307, 'Crime');

-- movie table
CREATE TABLE movie_data (
	movie_id INT NOT NULL,
	title VARCHAR(50) NOT NULL,
	lang VARCHAR(50) NOT NULL,
	runtime INT NOT NULL,
	time_period VARCHAR(20) NOT NULL,
	critic_rating INT NOT NULL,
	maturity_rating VARCHAR(20) NOT NULL,
	producer_name VARCHAR(50) NOT NULL,
	release_date VARCHAR(50) NOT NULL,
	submitted_by INT NOT NULL,
	directed_by INT NOT NULL,
	genre_id INT NOT NULL,
	CONSTRAINT movie_pk PRIMARY KEY (movie_id)
);

INSERT INTO movie_data VALUES (21348, 'Lady, The', 'Zulu', 191, '1930s', 9, 'PG-13', 'Rutter Canny', '04-04-2000', 24249, 91399, 74570);
INSERT INTO movie_data VALUES (73215, 'King Kong', 'New Zealand Sign Language', 152, '1890s', 9, 'PG', 'Cassey Grzesiewicz', '04-04-1990', 24249, 91399, 74570);
INSERT INTO movie_data VALUES (63960, 'Cops and Robbersons', 'Arabic', 190, '2000s', 2, 'PG-13', 'Bartlett Halfhead', '18-04-1987', 24249, 85682, 74570);
INSERT INTO movie_data VALUES (44174, 'Blood: The Last Vampire', 'Finnish', 183, '1990s', 10, 'PG', 'Franzen Goldney', '04-12-2015', 24249, 75677, 74570);
INSERT INTO movie_data VALUES (62679, '8 Seconds', 'Estonian', 110, '1990s', 9, 'PG', 'Clara Thirkettle', '11-12-2007', 24249, 33006, 73666);
INSERT INTO movie_data VALUES (35474, 'Slave of Love, A (Raba lyubvi)', 'Croatian', 136, '1700s', 7, 'R', 'Dodi Janicijevic', '23-04-2006', 35913, 65725, 85307);
INSERT INTO movie_data VALUES (78959, 'Little Soldier (Lille soldat)', 'Korean', 152, '1940s', 4, 'PG-13', 'Carmina Brevetor', '19-05-1980', 35913, 91399, 73666);
INSERT INTO movie_data VALUES (36296, 'Pekka ja lumimiehen', 'Dhivehi', 101, '1920s', 8, 'X', 'Devinne Quadri', '20-01-2010', 35913, 38272, 85307);
INSERT INTO movie_data VALUES (57104, 'So Long Letty', 'Malayalam', 198, '2010s', 8, '2R', 'Regan Bamford', '06-04-2000', 35913, 50612, 87626);
INSERT INTO movie_data VALUES (39933, 'Happiness', 'Georgian', 168, '1860s', 9, 'G', 'Anastassia Baudy', '03-09-1984', 35913, 86404, 73666);
INSERT INTO movie_data VALUES (77110, 'Titanica', 'Luxembourgish', 132, '2000s', 10, 'X', 'Cassondra Saket', '26-07-2009', 78752, 99108, 73666);
INSERT INTO movie_data VALUES (37706, 'Grown Ups 2', 'Ndebele', 126, '62000s', 3, 'PG', 'Kristian Dirand', '26-08-1994', 78752, 80699, 23747);
INSERT INTO movie_data VALUES (67294, 'Friendship!', 'Estonian', 145, '2020s', 6, 'R', 'Bendick Doogue', '10-03-1991', 78752, 38272, 73666);
INSERT INTO movie_data VALUES (55745, 'Taxi', 'Malayalam', 191, '1970s', 8, 'R', 'Julie Artois', '05-07-1981', 54217, 00564, 23747);
INSERT INTO movie_data VALUES (16088, 'Divine Madness!', 'New Zealand Sign Language', 122, '1960s', 8, 'PG-13', 'Wit Oluwatoyin', '16-01-2000', 54217, 91399, 87626);
INSERT INTO movie_data VALUES (22485, 'Trek Nation', 'Hungarian', 141, '1650s', 9, 'PG-13', 'Corrina Daingerfield', '21-07-2020', 54217, 27562, 74570);
INSERT INTO movie_data VALUES (48639, 'Edge of Madness', 'Tamil', 110, '1800s', 10, 'PG', 'Erika Causton', '18-10-1994', 78330, 75677, 73666);
INSERT INTO movie_data VALUES (71658, 'Tom, Tom, the Piper''s Son', 'Hebrew', 176, 'R', 4, '1890s', 'Conney Birrel', '09-10-2021', 78330, 38272, 87626);
INSERT INTO movie_data VALUES (36138, 'Inquire Within', 'Kannada', 136, '1900s', 8, 'R', 'Dan McDade', '19-06-2020', 78330, 43668, 73666);
INSERT INTO movie_data VALUES (73463, 'Train of Shadows (Tren de sombras)', 'Tamil', 196, '2010s', 10, 'G', 'Candi Espinho', '19-06-1981', 78330, 15547, 85307);

-- triggerwarning table
CREATE TABLE trigger_warning_data (
	movie_id INTEGER,
    warning_name VARCHAR(50),
    intensity INTEGER,
    PRIMARY KEY (movie_id, warning_name),
    CONSTRAINT trigger_warning_fk_1 FOREIGN KEY (movie_id) REFERENCES movie_data (movie_id)
);

INSERT INTO trigger_warning_data VALUES (21348, 'Violence', 8);
INSERT INTO trigger_warning_data VALUES (21348, 'Foul Language', 1);
INSERT INTO trigger_warning_data VALUES (44174, 'Nudity', 7);
INSERT INTO trigger_warning_data VALUES (36296, 'Gun Violence', 3);
INSERT INTO trigger_warning_data VALUES (37706, 'Foul Language', 8);
INSERT INTO trigger_warning_data VALUES (37706, 'Sexual Content', 4);
INSERT INTO trigger_warning_data VALUES (71658, 'Sexual Content', 3);
INSERT INTO trigger_warning_data VALUES (36138, 'Nudity', 6);
INSERT INTO trigger_warning_data VALUES (73463, 'Sexual Assault', 3);
INSERT INTO trigger_warning_data VALUES (62679, 'Foul Language', 5);
INSERT INTO trigger_warning_data VALUES (77110, 'Foul Language', 9);
INSERT INTO trigger_warning_data VALUES (39933, 'Foul Language', 4);

-- movie purchase table
CREATE TABLE movie_purchase_data (
	movie_id INTEGER,
	user_id INTEGER,
	price VARCHAR(50),
	user_rating INTEGER,
	watch_time INTEGER
);

INSERT INTO movie_purchase_data (movie_id, user_id, price, user_rating, watch_time) VALUES (44174, 85739, '$0.50', 2, 95);
INSERT INTO movie_purchase_data (movie_id, user_id, price, user_rating, watch_time) VALUES (67294, 00087, '$8.71', 10, 71);
INSERT INTO movie_purchase_data (movie_id, user_id, price, user_rating, watch_time) VALUES (16088, 74803, '$1.81', 1, 71);
INSERT INTO movie_purchase_data (movie_id, user_id, price, user_rating, watch_time) VALUES (35474, 85739, '$6.48', 5, 136);
INSERT INTO movie_purchase_data (movie_id, user_id, price, user_rating, watch_time) VALUES (73463, 33845, '$8.43', 8, 62);


-- similar movie table
CREATE TABLE similar_movie_data (
	movie_id INT NOT NULL,
	similar_to_id INT NOT NULL,
    CONSTRAINT similar_movie_fk_1 FOREIGN KEY (movie_id) REFERENCES movie_data (movie_id),
    CONSTRAINT similar_movie_fk_2 FOREIGN KEY (similar_to_id) REFERENCES movie_data (movie_id)
);

INSERT INTO similar_movie_data VALUES (22485, 21348);
INSERT INTO similar_movie_data VALUES (21348, 22485);
INSERT INTO similar_movie_data VALUES (22485, 77110);
INSERT INTO similar_movie_data VALUES (77110, 22485);
INSERT INTO similar_movie_data VALUES (71658, 48639);
INSERT INTO similar_movie_data VALUES (48639, 71658);

-- movie actor table
CREATE TABLE movie_actor_data (
	movie_id INT NOT NULL,
	actor_id INTEGER NOT NULL,
	character_name VARCHAR(50) NOT NULL,
	CONSTRAINT movie_actor_pk PRIMARY KEY (movie_id, actor_id)
);
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (62679, 04947, 'Helyn');
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (62679, 67904, 'Helyn');
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (22485, 06853, 'Bart');
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (16088, 67904, 'Tabor');
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (36138, 04947, 'Renee');
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (44174, 20103, 'Sonnie');