# Don't change
SRC_DIR := src

run: venv  ## Run the server locally using Python & Flask
	. $(SRC_DIR)/.venv/bin/activate \
	&& python $(SRC_DIR)/run.py

test: venv  ## Unit tests for Flask app
	. $(SRC_DIR)/.venv/bin/activate \
	&& pytest -v

clean:  ## Clean up project
	rm -rf $(SRC_DIR)/.venv
	rm -rf $(SRC_DIR)/app/__pycache__
## rm -rf $(SRC_DIR)/app/tests/__pycache__
##	rm -rf .pytest_cache
##	rm -rf $(SRC_DIR)/.pytest_cache

# ============================================================================

venv: $(SRC_DIR)/.venv/touchfile

$(SRC_DIR)/.venv/touchfile: $(SRC_DIR)/requirements.txt
	python3 -m venv $(SRC_DIR)/.venv
	. $(SRC_DIR)/.venv/bin/activate; pip install -Ur $(SRC_DIR)/requirements.txt
	touch $(SRC_DIR)/.venv/touchfile
