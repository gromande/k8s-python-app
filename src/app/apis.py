import socket
from flask import request, jsonify, current_app as app
from app import inc_dec


@app.route("/api/hello")
def hello():
    response_data = {}
    response_data["msg"] = "Hello from Python! " + socket.gethostname()
    return jsonify(response_data)


@app.route("/api/inc")
def inc():
    response_data = {}
    number = int(request.args.get('number'))
    response_data["old"] = number
    response_data["new"] = inc_dec.increment(number)
    return jsonify(response_data)


@app.route("/api/dec")
def dec():
    response_data = {}
    number = int(request.args.get('number'))
    response_data["old"] = number
    response_data["new"] = inc_dec.decrement(number)
    return jsonify(response_data)
