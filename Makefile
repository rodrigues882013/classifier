OS := $(shell uname)

# Variables
PYTHON=.env/bin/python

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

install_venv:
ifeq ($(OS),Linux)
	sudo apt install python3-venv
	python3 -m venv .env
	pip install --upgrade pip
endif

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

install_requirements:
ifeq ($(OS),Linux)
	pip install -r requirements.txt
endif

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

dependencies:
	$(MAKE) install_venv
	$(MAKE) install_requirements

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

install:
	$(MAKE) dependencies

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

run:
	$(PYTHON) app.py
