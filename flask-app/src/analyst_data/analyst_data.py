from flask import Blueprint, request, jsonify, make_response
import json
from src import db


analyst_data = Blueprint('analyst_data', __name__)

# Get all users from the DB
@analyst_data.route('/analyst_data', methods=['GET'])
def get_users():
    cursor = db.get_db().cursor()
    cursor.execute('select * from user_data')
    cursor.connection.commit()
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get user detail for user with particular userID
@analyst_data.route('/analyst_data/<userID>', methods=['GET'])
def get_specific_user(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from user_data where user_id = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Look at the submitters and their employee ids
@analyst_data.route('/submitters', methods=['GET'])
def get_submitters():
    cursor = db.get_db().cursor()
    cursor.execute('select employee_id, first_name, last_name, salary, supervisor_id from submitter_data')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Look at the users
@analyst_data.route('/analyst/users', methods=['GET'])
def get_all_users():
    cursor = db.get_db().cursor()
    cursor.execute('select * from user_data')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Look at the users preferences
@analyst_data.route('/user_pref/<userID>', methods=['GET'])
def get_user_pref(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from preferences_data where user_id = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Look at the users purchases
@analyst_data.route('/user_purchase/<userID>', methods=['GET'])
def get_user_purchase(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from movie_purchase_data where user_id = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Look at the movies submitted by a submitter
@analyst_data.route('/movies_submitted_by/<submitterID>', methods=['GET'])
def get_movies_submitted_by(submitterID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from movie_data where submitted_by = {0}'.format(submitterID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response



