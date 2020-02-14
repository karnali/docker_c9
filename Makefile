setup:
	python3 -m venv ~/.docker_c9

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb
	
validate-circleci:
	# See https://circleci.com/docs/2.0/local-cli/#processing-a-config
	circleci config process .circleci/config.yml

lint:
	hadolint Dockerfile 
	pylint --disable=R,C,W1203 app.py

all: install lint test
