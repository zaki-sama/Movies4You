from flask import Blueprint, request, jsonify, make_response
import json
from src import db


submitter_data = Blueprint('submitter_data', __name__)

# Get all movies from the DB
@submitter_data.route('/submitter_data', methods=['GET'])
def get_users():
    cursor = db.get_db().cursor()
    cursor.execute('select * from movie_data')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get movie detail submitter by a specific submitters
@submitter_data.route('/submitter_data/<submitID>', methods=['GET'])
def get_submitter_movies(submitID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from submitter_data where employee_id = {0}'.format(submitID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Post request for submitter to input a movie they submitted
#@analyst_data.route("/movieform", methods = ['POST'])
#def post_form():
#   employee_id = request.form['Your ID']
#   movie_title = request.form['Movie']
 #  date_inputted = request.form['Date']
#   return f'<h1>Employee {employee_id} has submitted {movie_title} on {date_inputted}.</h1>'

