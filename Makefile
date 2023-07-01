SHELL=/bin/bash
PYTHON=python3.9
PYTHON_TESTING_ENV=envs/qa

# testing #####################################################################
$(PYTHON_TESTING_ENV)/.created: REQUIREMENTS.qa.txt
	rm -rf $(PYTHON_TESTING_DEV) && \
	$(PYTHON) -m venv $(PYTHON_TESTING_ENV) && \
	. $(PYTHON_TESTING_ENV)/bin/activate && \
	pip install pip --upgrade && \
	pip install -r ./REQUIREMENTS.qa.txt && \
	date > $(PYTHON_TESTING_ENV)/.created

qa: $(PYTHON_TESTING_ENV)/.created
	. $(PYTHON_TESTING_ENV)/bin/activate && \
	black --check --diff . && \
	flake8

