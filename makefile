SRC=./joeutils/
TEST=./test/

.PHONY: lint tags ltags test all lintall codestyle docstyle lintsrc \
linttest doctest doc docs code linters_all codesrc codetest docsrc \
doctest paper build dist pypi-push-test pypi-push pypi-test pip-test pypi \
pip demo remove-previous-build install uninstall reinstall \
uninstall-everything pip-uninstall-everything pip-reinstall \
pip-reinstall-everything

# Batched Commands
# - Code & Style Linters
all: linters_all testall
lint: lintsrc codesrc docsrc
linters_all: doc code lintall

# Pylint Only
PYLINT_BASE =python3 -m pylint --output-format=colorized --reports=n
lintall: lintsrc linttest
lintsrc:
	${PYLINT_BASE} ${SRC}
linttest:
	${PYLINT_BASE} ${TEST}

# PyCodeStyle Only
PYCODESTYLE_BASE=python3 -m pycodestyle
codestyle: codestylesrc codestyletest
codesrc: codestylesrc
codetest: codestyletest
code: codestyle
codestylesrc:
	${PYCODESTYLE_BASE} ${SRC}
codestyletest:
	 ${PYCODESTYLE_BASE} ${TEST}

# PyDocStyle Only
PYDOCSTYLE_BASE=python3 -m pydocstyle
docstyle: docstylesrc docstyletest
docsrc: docstylesrc
doctest: docstyletest
docs: docstyle
docstylesrc:
	${PYDOCSTYLE_BASE} ${SRC}
docstyletest:
	${PYDOCSTYLE_BASE} ${TEST}
codetest:
	${CODE-test}
codeall: code codetest
doc: docstyle
doc:
	${DOC_SRC}

# Testing
test:
	python3 -m unittest discover -v
testdoc:
	python3 -m test.test --doctests-only
testall: test testdoc

# Package Management
remove-previous-build:
	rm -rf ./dist; 
	rm -rf ./build; 
	rm -rf ./*.egg-info
build: remove-previous-build
	python3 setup.py sdist bdist_wheel
dist: build
pypi-push-test: build
	twine upload --repository-url https://test.pypi.org/legacy/ dist/*
pypi-push:
	twine upload --repository-url https://upload.pypi.org/legacy/ dist/*; \
	make remove-previous-build
pypi-test: pypi-push-test
pip-test: pypi-push-test
pypi: pypi-push
pip: pypi-push

install-regular:
	pip install -r requirements-unlocked.txt; \
	pip freeze > requirements.txt
upgrade:
	pip install -r requirements-unlocked.txt --upgrade; \
	pip freeze > requirements.txt
install: install-regular
uninstall:
	bash -c "pip uninstall -y -r <(pip freeze)"
reinstall:
	make uninstall; \
	make install
uninstall-everything: uninstall
pip-uninstall-everything: uninstall
pip-reinstall: reinstall
pip-reinstall-everything: reinstall
