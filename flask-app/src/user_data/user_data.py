from flask import Blueprint, request, jsonify, make_response
import json
from src import db


user_data = Blueprint('user_data', __name__)

# Get all users from the DB
# NOT LETTING ME ACCESS MOVIE_DATA
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

# Post request for user
#@user_data.route("/moviepurchase", methods = ['POST'])
#def post_form():
#   first_name = request.form['first']
#   last_name = request.form['last']
#   movie = request.form['movie title']
#   ship_state = request.form['select your state']
#   return f'<h1>Hello {first_name} {last_name}, you have purchased {movie}.</h1>'