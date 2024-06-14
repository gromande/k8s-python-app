import socket
from flask import jsonify, current_app as app

@app.route("/hello")
def hello():
  response_data = {}
  response_data["msg"] = "Hello from Python! " + socket.gethostname() 
  return jsonify(response_data) 