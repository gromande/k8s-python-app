# k8s-python-app
Simple python Flask application for Docker and K8s learning.

## Active Virtual Environment
```
cd app/
source .venv/bin/activate
```

## Running Locally
```
cd app/
docker build -f ../docker/Dockerfile -t guillermoroman/k8s-python-app:latest .
docker run -p 5000:5000 guillermoroman/k8s-python-app
```

## Run in Kubernetes
```
kubectl apply -f kubernetes/deployment.yaml
```