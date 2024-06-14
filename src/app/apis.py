import socket
from flask import current_app as app

@app.route("/")
def hello():
    return "Hello from Python! " + socket.gethostname()