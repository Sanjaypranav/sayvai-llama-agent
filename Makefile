# Variables
PYTHON = python3
PIP = $(PYTHON) -m pip
FLAKE8 = $(PYTHON) -m flake8
BLACK = $(PYTHON) -m black
ISORT = $(PYTHON) -m isort
PYTEST = $(PYTHON) -m pytest

# File patterns
PY_FILES = $(wildcard *.py)
TEST_FILES = $(wildcard test_*.py)

# Targets
.PHONY: format lint isort black pytest

format:
	@echo "Formatting code..."
	$(BLACK) $(PY_FILES)

lint:
	@echo "Linting code..."
	$(FLAKE8) $(PY_FILES)

isort:
	@echo "Sorting imports..."
	$(ISORT) $(PY_FILES)

black:
	@echo "Applying Black formatting..."
	$(BLACK) $(PY_FILES)

pytest:
	@echo "Running pytest..."
	$(PYTEST) $(TEST_FILES)

# Default target
all: format lint isort black pytest

compose:
	docker-compose up --build

build:
	docker build -t sayvai-llama-app .

run:
	docker run -it --rm -p 8000:8000 sayvai-llama-app

setup:
	pip install pipx
	pipx install poetry
	poetry install  


