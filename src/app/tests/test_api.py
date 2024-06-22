import json

# Test the API
def test_api_hello(client):
    resp = client.get("/api/hello")

    assert resp.status_code == 200
    assert resp.headers["Content-Type"] == "application/json"
    resp_payload = json.loads(resp.data)
    assert resp_payload["msg"].startswith("Hello from Python!")
