from models import User

def validate(json_data):
    try:
        firstname = json_data["firstname"]
        lastname = json_data["lastname"]
        username = json_data["username"]
        email = json_data["email"]
        password = json_data["password"]

    except Exception:
        return {"message": "Required fields aren't provided"}, 400


    user_check = User.query.filter_by(username=username).first()
    email_check = User.query.filter_by(email=email).first()


    if user_check:
        if email_check:
            return {"message": "Username and email are taken. Want to sign in?"}, 400
        else:
            return {"message": "A user with that username already exists"}, 400


    if email_check:
        return {"message": "this email address already exists. Have you forgotten your password?"}, 400


    if password in email:
        return {"message": "Email and Password too similar"}, 400

    if username in password:
        return {"message": "Username and password are too similar"}, 400

    return True