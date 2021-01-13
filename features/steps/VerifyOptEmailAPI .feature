# Created by BB08503 at 1/13/2021
Feature: Validate "verify and Opt Email" API

  Scenario: Validate the Valid response for email (retriable) email
    Given user details i.e <email>, <message_type>, <opt_status>, <program_id>, <source_id>, <trigger_type>, <address_1>, <address_2>, <city>, <country>, <first_name>, <last_name>, <phone>, <mobile>, <postal_cd>, <state>
    When User hit "verify and Opt Email" API
    Then 200 status code should be received
