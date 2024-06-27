IMAGE_REG ?= guillermoroman
IMAGE_REPO ?= k8s-python-app
IMAGE_TAG ?= 1.0

# Don't change
SRC_DIR := src

.DEFAULT_GOAL := help

help:  ## This help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

lint: venv  ## Lint & format, will not fix but sets exit code on error 
	. $(SRC_DIR)/.venv/bin/activate \
	&& black --check $(SRC_DIR) \
	&& flake8 src/app/ && flake8 src/run.py

lint-fix: venv  ## Lint & format, will try to fix errors and modify code
	. $(SRC_DIR)/.venv/bin/activate \
	&& black $(SRC_DIR)

run: venv  ## Run the server locally using Python & Flask
	. $(SRC_DIR)/.venv/bin/activate \
	&& python $(SRC_DIR)/run.py

test: venv  ## Unit tests for Flask app
	. $(SRC_DIR)/.venv/bin/activate \
	&& pytest -v

image:  ## Build container image from Dockerfile 
	docker build . --file build/Dockerfile \
	--tag $(IMAGE_REG)/$(IMAGE_REPO):$(IMAGE_TAG)

push:  ## Push container image to registry 
	docker push $(IMAGE_REG)/$(IMAGE_REPO):$(IMAGE_TAG)

clean:  ## Clean up project
	rm -rf $(SRC_DIR)/.venv
	rm -rf $(SRC_DIR)/app/__pycache__
	rm -rf $(SRC_DIR)/app/tests/__pycache__
##	rm -rf .pytest_cache
##	rm -rf $(SRC_DIR)/.pytest_cache

# ============================================================================

venv: $(SRC_DIR)/.venv/touchfile

$(SRC_DIR)/.venv/touchfile: $(SRC_DIR)/requirements.txt
	python3 -m venv $(SRC_DIR)/.venv
	. $(SRC_DIR)/.venv/bin/activate; pip install -Ur $(SRC_DIR)/requirements.txt
	touch $(SRC_DIR)/.venv/touchfile
