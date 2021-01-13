import requests
from behave import *
from utilities.configurations import *
from utilities.payloads.EmailVerifyPayload import *
from utilities.resources import *


@given(u'user details i.e <email>, <message_type>, <opt_status>, <program_id>, <source_id>, <trigger_type>, <address_1>, <address_2>, <city>, <country>, <first_name>, <last_name>, <phone>, <mobile>, <postal_cd>, <state>')
def step_impl(context):
    pass

@when(u'User hit "verify and Opt Email" API')
def step_impl(context):
    pass


