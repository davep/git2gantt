.PHONY: setup
setup:
	pipenv sync --dev

.PHONY: lint
lint:
	pipenv run pylint git2gantt

### Makefile ends here
