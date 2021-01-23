import requests
from behave import *
from behave.formatter import null
from utilities.configurations import *
from utilities.payloads.EmailVerifyPayload import *
from utilities.resources import *
from utilities.customLogger import *


@given('valid {email} and {sourceId} is provided')
def step_implement(context, email, sourceId):
    context.email = email
    context.url = getConfig()['API']['endpoint'] + ApiResources.emailVerification
    context.payload = verifyEmailpayload(email, sourceId)


@when('When user hit email verify API')
def step_impl(context):
    context.response = requests.post(context.url, json=context.payload, )


@then('{statuscode:d} status code should be received')
def step_impl(context, statuscode):
    # print("I am here")
    # print(context.response.json()["status"])
    # print(statuscode)
    assert context.response.status_code == statuscode


@then('validate the status as {valid} in response')
def step_impl(context, valid):
    # print('status code below')
    # print(context.response.json()["status"])
    # print(valid)
    assert context.response.json()["status"] == valid


@then(u'validate the status {statuscheck:d} in response')
def step_impl(context, statuscheck):
    assert context.response.json()["status"] == statuscheck


@then('validate blank error message received')
def step_impl(context):
    assert context.response.json()["error"] == ''


@then('validate the {email} received')
def step_impl(context, email):
    assert context.response.json()["email"] == email


@then('validate the database entries created in vfyd_eml table for  {email} and {fndg}')
def step_impl(context, email, fndg):
    print('pass')
    conn = getConnection()
    cursor = conn.cursor()
    sqlsyntax = "SELECT EMAIL_ADDR, FNDG, LAST_UPDTD_TS, VLD_UNTL FROM evsdb.vfyd_eml WHERE EMAIL_ADDR = " + "'" + context.email + "'"
    try:
        cursor.execute(sqlsyntax)
        row = cursor.fetchone()
    except:
        print("Error: unable to fetch data")
        assert ("test failed")
    finally:
        conn.close()
    context.logger = Logger.test_loggingDemo()
    context.logger.info("Verifying Database table")
    actualemail = row[0]
    actualfndg = row[1]
    assert actualemail == email
    assert actualfndg == fndg
    assert row[2] != null
    assert row[3] != null


@then(u'validate Correlation Id is received in response header')
def step_impl(context):
    print(context.response.headers)
    header = context.response.headers
    assert header['X-Correlation-Id'] != null


@then(u'validate {error} message received')
def step_impl(context, error):
    assert context.response.json()["error"] == error





