import socket
from flask import jsonify, current_app as app
from app import inc_dec

@app.route("/api/hello")
def hello():
  response_data = {}
  response_data["msg"] = "Hello from Python! " + socket.gethostname() 
  return jsonify(response_data)

@app.route("/api/inc")
def hello():
  response_data = {}
  response_data["msg"] = "Hello from Python! " + socket.gethostname() 
  return jsonify(response_data)

@app.route("/api/dec")
def hello():
  response_data = {}
  response_data["msg"] = "Hello from Python! " + socket.gethostname() 
  return jsonify(response_data)