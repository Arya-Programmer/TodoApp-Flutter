from flask_restful import Resource
from flask import request
from models import db, User, user_schema
from .validations import validate


class Register(Resource):
    def get(self):
        users = User.query.all()
        users = user_schema.dump(users, many=True).data
        return {
                   "status": "success", "data": users
               }, 200

    @property
    def post(self):
        json_data = request.get_json()
        print(json_data)
        if not json_data:
            return {"message": "No input data provided"}

        valid = validate(json_data)
        if valid != True:
            return valid




        ln = json_data['lastname']
        fn = json_data['firstname']
        un = json_data['username']
        passw = json_data['password']
        email = json_data['email']
        # username, email, password
        # check if username exists
        # check if email exists
        # create a user
        user = User(
            firstname=fn,
            lastname=ln,
            email=email,
            password=passw,
            username=un
        )
        db.session.add(user)
        db.session.commit()

        result = user_schema.dump(user).data

        return {
            "message": f"Registering {result['username']}"
        }
