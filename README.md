# run-behave-tests
A Github action to run Behave BDD (Behavioral Driven Development) tests for Python

## Tests

## Usage
### Example Project Structure
* example_project/
    * requirements.txt
    * behave.ini
    * my_class_to_test.py
    * features/
        * my_tests.feature
        * steps/
            * my_steps.py

### Minimal
```yaml
steps:
- uses: actions/checkout@v3
- uses: actions/setup-python@v4
  with:
    python-version: 3.10.5
- uses: actions/cryptic-wizard/run-behave-tests@v0.1.0
  with:
    project-path: example_project
    test-output-name: results.txt
 - uses: actions/upload-artifact@v2
   if: success() || failure()
   with:
    name: behave_results
    path: results.txt
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