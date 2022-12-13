from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


user_data = Blueprint('user_data', __name__)

# Get user data
@user_data.route('/user_data/<userID>', methods=['GET'])
def get_user(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select first_name, last_name, address_state, address_country, email_address from user_data where user_id = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get user data - total spent on movies
@user_data.route('/user_watchtime/<userID>', methods=['GET'])
def user_watchtime(userID):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT sum(watch_time) as watchtime FROM movie_purchase_data WHERE user_id = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# get all actors
@user_data.route('/actor_data', methods=['GET'])
def get_actor():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM actor_data')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#get all movies with genre id
@user_data.route('/all_genre_movies/<genreID>', methods=['GET'])
def get_movies_genre(genreID):
    print(genreID)
    cursor = db.get_db().cursor()
    cursor.execute('SELECT title, lang, runtime, maturity_rating, producer_name, release_date FROM movie_data WHERE genre_id = {0}'.format(genreID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#get all movies with director id
@user_data.route('/all_director_movies/<dirID>', methods=['GET'])
def get_movies_director(dirID):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT title, lang, runtime, maturity_rating, producer_name, release_date FROM movie_data WHERE directed_by = {0}'.format(dirID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#get all movies with critic rating greater than min
@user_data.route('/all_critic_movies/<minRating>', methods=['GET'])
def get_movies_rating(minRating):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT title, lang, runtime, maturity_rating, producer_name, release_date FROM movie_data WHERE critic_rating >= {0}'.format(minRating))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#get all movies with actor in it
@user_data.route('/all_actor_movies/<actorID>', methods=['GET'])
def get_movies_actor(actorID):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT title, lang, runtime, maturity_rating, producer_name, release_date FROM movie_actor_data join movie_data md on movie_actor_data.movie_id = md.movie_id WHERE actor_id = {0}'.format(actorID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#get all movies purchased by user
@user_data.route('/all_purchased/<userID>', methods=['GET'])
def get_purchases_from(userID):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT title, lang, runtime, maturity_rating, producer_name, release_date, price, user_rating FROM movie_data md join movie_purchase_data mpd on md.movie_id = mpd.movie_id WHERE user_id = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response




