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
    cursor.execute('select employee_id, last_name from submitter_data')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response



