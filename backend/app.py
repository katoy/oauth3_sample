from flask import Flask, request, jsonify
from flask_cors import CORS
import auth
import database

app = Flask(__name__)
CORS(app)

@app.route('/auth/signup', methods=['POST'])
def signup():
    data = request.get_json()
    email = data['email']
    password = data['password']
    return auth.signup(email, password)

@app.route('/auth/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data['email']
    password = data['password']
    return auth.login(email, password)

if __name__ == '__main__':
    database.initialize()
    app.run(debug=True)
