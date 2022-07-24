Feature: calculator
Simple calculator for adding and subtracting **2** numbers

[calculator.feature](https://github.com/cryptic-wizard/run-behave-tests/blob/main/run_behave_tests/Features/Calculator.feature)
***Further read***: **[Learn more about how to use Behave with python](https://behave.readthedocs.io/en/stable/api.html)**

@mytag
Scenario Outline: Add two numbers
	Given the first number is <first>
	And the second number is <second>
	When the two numbers are added
	Then the result should be <result>

	Examples:
	| first | second | result |
	| 50    | 70     | 120    |
	| -5    | 7      | 2      |
	| 5     | -7     | -2     |
	| -5    | -7     | -12    |

Scenario Outline: Subtract two numbers
	Given the first number is <first>
	And the second number is <second>
	When the two numbers are subtracted
	Then the result should be <result>

	Examples:
	| first | second | result |
	| 50    | 70     | -20    |
	| -5    | 7      | -12    |
	| 5     | -7     | 12     |
	| -5    | -7     |   2    |