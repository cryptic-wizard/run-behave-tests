# run-behave-tests
A Github action to run Behave [Behavioral Driven Development](https://behave.readthedocs.io/en/stable/philosophy.html) tests for Python

## Tests
[![Python 3.10.5 Minimal](https://github.com/cryptic-wizard/run-behave-tests/actions/workflows/python-minimal.yml/badge.svg)](https://github.com/cryptic-wizard/run-behave-tests/actions/workflows/python-minimal.yml)

[![Python 3.10.5 OS Matrix](https://github.com/cryptic-wizard/run-behave-tests/actions/workflows/python-os-matrix.yml/badge.svg)](https://github.com/cryptic-wizard/run-behave-tests/actions/workflows/python-os-matrix.yml)

[![Python 3.10.5 Feature Test](https://github.com/cryptic-wizard/run-behave-tests/actions/workflows/python-feature-test.yml/badge.svg)](https://github.com/cryptic-wizard/run-behave-tests/actions/workflows/python-feature-test.yml)

## Usage
### Example Project Structure
* example_project/
    * [requirements.txt](https://pip.pypa.io/en/stable/user_guide/#requirements-files)
    * [behave.ini](https://behave.readthedocs.io/en/stable/behave.html#configuration-files)
    * my_class_to_test.py
    * features/
        * [my_tests.feature](https://behave.readthedocs.io/en/stable/gherkin.html#gherkin-feature-testing-language)
        * steps/
            * [my_steps.py](https://behave.readthedocs.io/en/stable/api.html#step-functions)

### [Minimal](https://github.com/cryptic-wizard/run-behave-tests/blob/main/.github/workflows/python-minimal.yml)
```yaml
steps:
- uses: actions/checkout@v4
- uses: actions/setup-python@v5
  with:
    python-version: 3.10.5
- uses: cryptic-wizard/run-behave-tests@v0.4.0
  with:
    test-path: example_project
    test-output-name: results.txt
```
### [OS Matrix Testing](https://github.com/cryptic-wizard/run-behave-tests/blob/main/.github/workflows/python-os-matrix.yml)
```yaml
jobs:
  build:
    runs-on: ${{ matrix.os }}
    strategy:
      fail-fast: false
      matrix:
        os: [ubuntu-latest, macos-latest, windows-latest]
    
  steps:
  - uses: actions/checkout@v4
  - uses: actions/setup-python@v5
    with:
      python-version: 3.10.5
  - uses: cryptic-wizard/run-behave-tests@v0.4.0
    with:
      test-path: example_project
      test-output-name: ${{ matrix.os }}.txt
```
### [Complex Matrix Testing](https://github.com/cryptic-wizard/run-behave-tests/blob/main/.github/workflows/python-complex-matrix.yml)
```yaml
jobs:
  build:
    runs-on: ${{ matrix.os }}
    strategy:
      fail-fast: false
      matrix:
        os: [ubuntu-latest, macos-latest, windows-latest]
        python-version: ['3.8', '3.9', '3.10.5']
        exclude:
          - os: ubuntu-latest
            python-version: '3.9'
          - os: windows-latest
            python-version: '3.10.5'

  steps:
  - uses: actions/checkout@v4
  - uses: actions/setup-python@v5
    with:
      python-version: ${{ matrix.python-version }}
  - uses: cryptic-wizard/run-behave-tests@v0.4.0
    with:
      test-path: example_project
      test-output-name: ${{ matrix.os }}-${{ matrix.python-version }}.txt
```

## Features
#### Recently Added
* v0.4.0 - Update upload-artifact compatiblity, Fix test-output-name
```yaml
test-output-name: MyTestResults.txt
```

* v0.3.0 - Automatic artifact upload
* :warning: Deprecated November 30, 2024 with [actions/upload-artifact@v3](https://github.blog/changelog/2024-04-16-deprecation-notice-v3-of-the-artifact-actions/)
```yaml
upload-artifact: true by default
```
* v0.2.0 - Basic inputs
* :warning: Deprecated November 30, 2024 with [actions/upload-artifact@v3](https://github.blog/changelog/2024-04-16-deprecation-notice-v3-of-the-artifact-actions/)
```yaml
requirements-name:
test-path:
test-output-name:
```

#### Planned Automation Features
* Additional behave arguments

## Tools
* [Python 3.10.5](https://www.python.org/downloads/)
* [Behave](https://behave.readthedocs.io/en/stable/api.html)
* [Gherkin](https://cucumber.io/docs/gherkin/reference/)
* [Flake8](https://flake8.pycqa.org/en/latest/)
* [inkpot](https://pypi.org/project/inkpot/)

## License
* [MIT License](https://github.com/cryptic-wizard/run-behave-tests/blob/main/LICENSE.md)