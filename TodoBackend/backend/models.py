from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy
from flask_sqlalchemy import sqlalchemy
from marshmallow_sqlalchemy import ModelSchema

ma = Marshmallow()
db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'users'
    # __table_args__ = tuple(db.UniqueConstraints('id', 'username', name="my_2uniq"))

    id = db.Column(db.Integer(), primary_key=True)
    username = db.Column(db.String(), unique=True)
    firstname = db.Column(db.String(255))
    lastname = db.Column(db.String(255))
    password = db.Column(db.String())
    email = db.Column(db.String())

    def __init__(self, username, firstname, lastname, password, email):
        self.firstname = firstname
        self.lastname = lastname
        self.username = username
        self.password = password
        self.email = email

    def __repr__(self):
        return f'id {self.id}'

    def serialize(self):
        return {
            'id': self.id,
            'username': self.username,
            'firstname': self.firstname,
            'lastname': self.lastname,
            'password': self.password,
            'email': self.email
        }
class UserSchema(ModelSchema):
    class Meta:
        model = User

user_schema = UserSchema()
