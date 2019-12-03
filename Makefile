###############################################################################
# Common make values.
run  = pipenv run
lint = $(run) pylint

##############################################################################
# Show help by default.
.DEFAULT_GOAL := help

##############################################################################
# Setup/update packages the system requires.
.PHONY: setup
setup:				# Install development/tool dependencies
	pipenv sync --dev

.PHONY: resetup
resetup:			# Recreate the virtual environment from scratch
	rm -rf $(shell pipenv --venv)
	pipenv sync --dev

.PHONY: depsoutdated
depsoutdated:			# Show a list of outdated dependencies
	pipenv update --outdated

.PHONY: depsupdate
depsupdate:			# Update all dependencies
	pipenv update --dev

.PHONY: depsshow
depsshow:			# Show the dependency graph
	pipenv graph

##############################################################################
# Checking/testing/linting/etc.
.PHONY: lint
lint:				# Run pylint over the code.
	$(lint) git2gantt

##############################################################################
# Utility.
.PHONY: help
help:				# Display this help
	@grep -Eh "^[a-z]+:.+# " $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.+# "}; {printf "%-20s %s\n", $$1, $$2}'

### Makefile ends here
