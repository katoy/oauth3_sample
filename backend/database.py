from models import User, Base
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine('sqlite:///users.db')
Session = sessionmaker(bind=engine)

def initialize():
    Base.metadata.create_all(engine)

def create_user(user):
    session = Session()
    session.add(user)
    session.commit()

def get_user_by_email(email):
    session = Session()
    return session.query(User).filter(User.email == email).first()
