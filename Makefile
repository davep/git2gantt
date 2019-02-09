.PHONY: setup
setup:
	pipenv install --dev

.PHONY: lint
lint:
	pipenv run pylint git2gantt

### Makefile ends here
