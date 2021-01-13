import requests
from behave import *
from utilities.configurations import *
from utilities.payloads.EmailVerifyPayload import *
from utilities.resources import *


@given('valid {email} and {sourceId} is provided')
def step_impl(context, email, sourceId):
    context.url = getConfig()['API']['endpoint'] + ApiResources.emailVerification
    context.payload = verifyEmailpayload(email, sourceId)


@when('When user hit email verify API')
def step_impl(context):
    print("I am in When")
    print(context.url)
    context.response = requests.post(context.url, json=context.payload, )


@then('200 status code should be received')
def step_impl(context):
    print(context.response)
    assert context.response == 200
    if context.response != 200:
        print(context.response)



