import jwt
import time
import os
from dotenv import load_dotenv
from werkzeug.security import generate_password_hash, check_password_hash
from database import get_user_by_email, create_user
from models import User

load_dotenv()
SECRET_KEY = os.getenv('SECRET_KEY')

def signup(email, password):
    user = get_user_by_email(email)
    if user:
        return {"error": "User already exists"}, 400

    password_hash = generate_password_hash(password)
    new_user = User(email=email, password_hash=password_hash)
    create_user(new_user)

    return {"message": "User created successfully"}, 201

def login(email, password):
    user = get_user_by_email(email)
    if not user or not check_password_hash(user.password_hash, password):
        return {"error": "Invalid credentials"}, 401

    token = jwt.encode({"email": user.email, "exp": time.time() + 86400}, SECRET_KEY)
    return {"token": token}, 200
