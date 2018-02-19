OS := $(shell uname)

# Variables
PYTHON=.env/bin/python3
PIP=.env/bin/pip


#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

install_venv:
ifeq ($(OS),Linux)
	sudo apt install python3-venv
	python3 -m venv .env
endif

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

install_requirements:
ifeq ($(OS),Linux)
	$(PIP) install -r requirements.txt
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
