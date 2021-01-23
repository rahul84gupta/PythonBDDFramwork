import logging
import os

import requests
from behave import *
from utilities.configurations import *
from utilities.payloads.VerifyOptEmail import *
from utilities.resources import *


@given('user details i.e {email}, {message_type}, {opt_status}, {program_id}, '
       '{source_id}, {trigger_type}, {address_1}, {address_2}, {city}, {country}, {first_name}, '
       '{last_name}, {phone}, {mobile}, {postal_cd}, {state}')
def step_impl(context, email, message_type, opt_status, program_id, source_id, trigger_type, address_1, address_2, city, country, first_name, last_name, phone, mobile, postal_cd, state):
    context.url = getConfig()['API']['endpoint'] + ApiResources.verifyopt
    context.payload = verifyOpt(email, message_type, opt_status, program_id, source_id, trigger_type, address_1, address_2, city, country, first_name, last_name, phone, mobile, postal_cd, state)
    print(context.payload)


@when('User hit "verify and Opt Email" API')
def step_impl(context):
    # print(context.url)
    # print(context.payload)
    context.response = requests.post(context.url, json=context.payload, )
    # print(context.response.json())


@then(u'validate the {message} received in response')
def step_impl(context, message):
    print(message)
    print(context.response.json()["message"])
    assert context.response.json()["message"] == message


