# Some set up for the application 

from flask import Flask
from flaskext.mysql import MySQL

# create a MySQL object that we will use in other parts of the API
db = MySQL()

def create_app():
    app = Flask(__name__)
    
    # secret key that will be used for securely signing the session 
    # cookie and can be used for any other security related needs by 
    # extensions or your application
    app.config['SECRET_KEY'] = 'someCrazyS3cR3T!Key.!'

    # these are for the DB object to be able to connect to MySQL. 
    app.config['MYSQL_DATABASE_USER'] = 'webapp'
    app.config['MYSQL_DATABASE_PASSWORD'] = open('/secrets/db_password.txt').readline()
    app.config['MYSQL_DATABASE_HOST'] = 'db'
    app.config['MYSQL_DATABASE_PORT'] = 3306
    app.config['MYSQL_DATABASE_DB'] = 'movies_4_you_db'  # Change this to your DB name

    # Initialize the database object with the settings above. 
    db.init_app(app)
    
    # Import the various routes
    from src.views import views
    from src.user_data.user_data import user_data
    from src.submitter_data.submitter_data  import submitter_data
    from src.analyst_data.analyst_data  import analyst_data

    # Register the routes that we just imported so they can be properly handled
    app.register_blueprint(views,       url_prefix='/movies4you')
    app.register_blueprint(user_data,   url_prefix='/movies4you')
    app.register_blueprint(submitter_data,    url_prefix='/movies4you')
    app.register_blueprint(analyst_data,    url_prefix='/movies4you')

    return app