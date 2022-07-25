# run-behave-tests
A Github action to run Behave BDD (Behavioral Driven Development) tests for Python

## Tests
[![Python 3.10.5](https://github.com/cryptic-wizard/run-behave-tests/actions/workflows/python.yml/badge.svg?branch=main)](https://github.com/cryptic-wizard/run-behave-tests/actions/workflows/python.yml)

## Usage
### Example Project Structure
* example_project/
    * [requirements.txt](https://pip.pypa.io/en/stable/user_guide/#requirements-files)
    * [behave.ini](https://behave.readthedocs.io/en/stable/behave.html#configuration-files)
    * my_class_to_test.py
    * features/
        * my_tests.feature
        * steps/
            * my_steps.py

### [Minimal](https://github.com/cryptic-wizard/run-behave-tests/blob/main/.github/workflows/python-minimal.yml)
```yaml
steps:
- uses: actions/checkout@v3
- uses: actions/setup-python@v4
  with:
    python-version: 3.10.5
- uses: cryptic-wizard/run-behave-tests@v0.1.1
  with:
    project-path: example_project
    test-path: example_project
    test-output-name: results.txt
 - uses: actions/upload-artifact@v3
   if: success() || failure()
   with:
    name: behave_results
    path: results.txt
```
### [Operating System Matrix Testing](https://github.com/cryptic-wizard/run-behave-tests/blob/main/.github/workflows/python-os-matrix.yml)
```yaml
jobs:
  build:
    strategy:
      fail-fast: false
      matrix:
        os: [ubuntu-latest, macos-latest, windows-latest]
    runs-on: ${{ matrix.os }}
    
  steps:
  - uses: actions/checkout@v3
  - uses: actions/setup-python@v4
    with:
      python-version: 3.10.5
  - uses: cryptic-wizard/run-behave-tests@v0.1.1
    with:
      project-path: example_project
      test-path: example_project
      test-output-name: ${{ matrix.os }}.txt
  - uses: actions/upload-artifact@v3
    if: success() || failure()
    with:
      name: behave_results
      path: ${{ matrix.os }}.html
```

## Features
#### Recently Added
* v0.1.0 - Basic inputs
```yaml
project-path:
requirements-name:
test-path:
test-output-name:
flake8-warnings:
```

#### Planned Automation Features
Features planned when ['uses' keyword is implemented in composite actions](https://github.com/actions/runner/issues/646)
* Checkout automatically
* Setup python automatically
* Upload artifacts automatically

#### Planned Documentation Features
* Add support for inkpot
* Add support for other documentation packages

## Tools
* [Python 3.10.5](https://www.python.org/downloads/)
* [Behave](https://behave.readthedocs.io/en/stable/api.html)
* [Gherkin](https://cucumber.io/docs/gherkin/reference/)
* [Flake8](https://flake8.pycqa.org/en/latest/)
* [inkpot](https://pypi.org/project/inkpot/)

## License
* [MIT License](https://github.com/cryptic-wizard/run-behave-tests/blob/main/LICENSE.md)