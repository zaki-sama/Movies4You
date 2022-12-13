from flask import Blueprint, request, jsonify, make_response, current_app
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
<<<<<<< HEAD
<<<<<<< HEAD
    cursor.execute('SELECT first_name, last_name, address_state, address_country, Count(submitted_by) as num_submission FROM submitter_data, movie_data WHERE employee_id = {0} AND submitted_by = {0}'.format(submitID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get submitter data
@submitter_data.route('/submitter_data/<submitID>/num_supervisees', methods=['GET'])
def get_submitter_supervisees(submitID):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT Count(employee_id) as num_supervisees FROM submitter_data WHERE supervisor_id = {0}'.format(submitID))
=======
    cursor.execute('select * from submitter_data where employee_id = {0}'.format(submitID))
>>>>>>> parent of 42178d0 (submitter post)
=======
    # cursor.execute('select * from submitter_data where employee_id = {0}'.format(submitID))
    cursor.execute('select * from movie_data where submitted_by = {0}'.format(submitID))
>>>>>>> parent of 2bb4ce9 (submitter queries)
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
@submitter_data.route("/movieform", methods = ['POST'])
def post_form():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    movie_id = request.form['Movie ID']
    title = request.form['Title']
    language = request.form['Language']
    runtime = request.form['Runtime (Minutes)']
    critic_rating = request.form['Critic Rating (1-10)']
    maturity_rating = request.form['Maturity Rating']
    producer = request.form['Producer Name']
    release_date = request.form['Release Date (dd-mm-yyyy)']
    submitted_by = request.form['Your ID']
    directed_by = request.form['Director ID']
    genre = request.form['Genre ID']
    query = f'INSERT INTO movie_data VALUES(\"{movie_id}\", \"{title}\", \"{language}\", \"{runtime}\", \"{critic_rating}\", \"{maturity_rating}\", \"{producer}\", \"{release_date}\", \"{submitted_by}\", \"{directed_by}\", \"{genre}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "New movie added"
   # return f'<h1>Employee {employee_id} has submitted {movie_title} on {date_inputted}.</h1>'


