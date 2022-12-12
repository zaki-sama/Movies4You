from flask import Blueprint, request, jsonify, make_response
import json
from src import db


user_data = Blueprint('user_data', __name__)

# Get all users from the DB
@user_data.route('/user_data', methods=['GET'])
def get_movies():
    cursor = db.get_db().cursor()
    cursor.execute('select title from movie_data')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@submitter_data.route("/userpreferences", methods=['POST'])
def post_form():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    fav_director_id = request.form['Favorite Director']
    fav_actor_id = request.form['Favorite Actor']
    fav_genre_id = request.form['Favorite Genre']
    primary_lang = request.form['Primary Language']
    length_limit = request.form['Length']
    time_period = request.form['Time Period']
    min_critic_rating = request.form['Critic Rating']
    max_maturity_rating = request.form['Maturity Rating']
    query = f'INSERT INTO preferences_data VALUES(\"{fav_director_id}\", \"{fav_actor_id}\", \"{fav_genre_id}\", \"{primary_lang}\", \"{length_limit}\", \"{time_period}\", \"{min_critic_rating}\", \"{max_maturity_rating}\",)'
    cursor.execute(query)
    db.get_db().commit()
    return "User info added"

#ADD PREFERENCES ROUTE
@submitter_data.route("/usertriggers", methods=['POST'])
def post_form():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    set_id = request.form['Preferences Set ID']
    warning_name = request.form['Warning Name']
    intensity_tolerance = request.form['Intensity Tolerance']
    query = f'INSERT INTO preference_trigger_data VALUES(\"{set_id}\", \"{warning_name}\", \"{intensity_tolerance}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "User Preferences added"




