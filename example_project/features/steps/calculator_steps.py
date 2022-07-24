'''
Tests the calculator.py class
'''
from behave import *
from sys import path

# Locally import of the calculator class from this project
path.append('../..')
from calculator import Calculator

def before_scenario(context):
    print()

def after_scenario(context):
    print()

@given('the first number is {first}')
def given_the_first_number_is_x(context, first):
    context.first = int(first)

@given('the second number is {second}')
def given_the_second_number_is_x(context, second):
    context.second = int(second)

@when('the two numbers are added')
def when_the_two_numbers_are_added(context):
    context.result = Calculator.add(context.first, context.second)

@when('the two numbers are subtracted')
def when_the_two_numbers_are_subtracted(context):
    context.result = Calculator.subtract(context.first, context.second)

@then('the result should be {result}')
def then_the_result_should_be_x(context, result):
    assert(int(result) == context.result)