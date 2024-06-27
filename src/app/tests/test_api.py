import json


# Test the API
def test_api_hello(client):
    resp = client.get("/api/hello")
    assert resp.status_code == 200
    assert resp.headers["Content-Type"] == "application/json"
    resp_payload = json.loads(resp.data)
    assert resp_payload["msg"].startswith("Hello from Python!")


def test_api_inc(client):
    number = 4
    resp = client.get("/api/inc?number=" + str(number))
    assert resp.status_code == 200
    assert resp.headers["Content-Type"] == "application/json"
    resp_payload = json.loads(resp.data)
    assert resp_payload["old"] == number
    assert resp_payload["new"] == number+1


def test_api_dec(client):
    number = 4
    resp = client.get("/api/dec?number=" + str(number))
    assert resp.status_code == 200
    assert resp.headers["Content-Type"] == "application/json"
    resp_payload = json.loads(resp.data)
    assert resp_payload["old"] == number
    assert resp_payload["new"] == number-1
