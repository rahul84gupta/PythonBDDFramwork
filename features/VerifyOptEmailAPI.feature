# Created by BB08503 at 1/13/2021
Feature: Validate "verify and Opt Email" API
  @smoke
  Scenario Outline: OPT:01 Validate the Valid response for email (retriable) email
    Given user details i.e <email>, <message_type>, <opt_status>, <program_id>, <source_id>, <trigger_type>, <address_1>, <address_2>, <city>, <country>, <first_name>, <last_name>, <phone>, <mobile>, <postal_cd>, <state>
    When User hit "verify and Opt Email" API
    Then 200 status code should be received
    Examples:
      | email            | message_type          | opt_status | program_id                  | source_id | trigger_type | address_1 | address_2 | city | country | first_name | last_name | phone      | mobile     | postal_cd | state |
      | v@addresstest.com | BBBY_US_Welcome_Event | I          | BBB_US_MASS_EMAIL_CAMPAIGNS | 12345     | BB_SIGNUP    | address 1 | address 2 | CO   | US     | TestFirst  |  TestLast | 1234567890 | 1234567890 | 90001     | CA   |

  @smoke
  Scenario Outline: OPT:02 Validate the correct response received for invalid or  missing email (retriable)
    Given user details i.e <email>, <message_type>, <opt_status>, <program_id>, <source_id>, <trigger_type>, <address_1>, <address_2>, <city>, <country>, <first_name>, <last_name>, <phone>, <mobile>, <postal_cd>, <state>
    When User hit "verify and Opt Email" API
    Then 400 status code should be received
    And validate the status 101 in response
    And validate <error> message received
    And validate the <message> received in response
    Examples:
      | email       |error              |message                    | message_type          | opt_status | program_id                  | source_id | trigger_type | address_1 | address_2 | city | country | first_name | last_name | phone      | mobile     | postal_cd | state |
      | ""          |Invalid input parameters   |Invalid or missing email   | BBBY_US_Welcome_Event | I          | BBB_US_MASS_EMAIL_CAMPAIGNS | 12345     | BB_SIGNUP    | address 1 | address 2 | CO   | US     | TestFirst  |  TestLast | 1234567890 | 1234567890 | 90001     | CA   |


  @smoke
  Scenario Outline: OPT:03 Validate the Valid response for email (retriable) invalid or  missing sourceid
    Given user details i.e <email>, <message_type>, <opt_status>, <program_id>, <source_id>, <trigger_type>, <address_1>, <address_2>, <city>, <country>, <first_name>, <last_name>, <phone>, <mobile>, <postal_cd>, <state>
    When User hit "verify and Opt Email" API
    Then 400 status code should be received
    And validate the status 102 in response
    And validate <error> message received
    And validate the <message> received in response
    Examples:
      | email               |error                      |message                       | message_type          | opt_status | program_id                  | source_id | trigger_type | address_1 | address_2 | city | country | first_name | last_name | phone      | mobile     | postal_cd | state |
      | v@addresstest.com   |Invalid input parameters   |Invalid or missing sourceId   | BBBY_US_Welcome_Event | I          | BBB_US_MASS_EMAIL_CAMPAIGNS | ""     | BB_SIGNUP    | address 1 | address 2 | CO   | US     | TestFirst  |  TestLast | 1234567890 | 1234567890 | 90001     | CA   |


  @smoke
  Scenario Outline: OPT:04 Validate the Valid response for email (retriable) for Invalid or missing Opt Status
    Given user details i.e <email>, <message_type>, <opt_status>, <program_id>, <source_id>, <trigger_type>, <address_1>, <address_2>, <city>, <country>, <first_name>, <last_name>, <phone>, <mobile>, <postal_cd>, <state>
    When User hit "verify and Opt Email" API
    Then 400 status code should be received
    And validate the status 103 in response
    And validate <error> message received
    And validate the <message> received in response
    Examples:
      | email             |error                      |message                        | message_type          | opt_status       | program_id                  | source_id | trigger_type | address_1 | address_2 | city | country | first_name | last_name | phone      | mobile     | postal_cd | state |
      | v@addresstest.com |Invalid input parameters   |Invalid or missing optStatus   | BBBY_US_Welcome_Event | Invalid          | BBB_US_MASS_EMAIL_CAMPAIGNS | 12345     | BB_SIGNUP    | address 1 | address 2 | CO   | US     | TestFirst  |  TestLast | 1234567890 | 1234567890 | 90001     | CA   |


  @smoke
  Scenario Outline: OPT:05 Validate the Valid response for email (retriable) for Invalid or missing ProgramId
    Given user details i.e <email>, <message_type>, <opt_status>, <program_id>, <source_id>, <trigger_type>, <address_1>, <address_2>, <city>, <country>, <first_name>, <last_name>, <phone>, <mobile>, <postal_cd>, <state>
    When User hit "verify and Opt Email" API
    Then 400 status code should be received
    And validate the status 104 in response
    And validate <error> message received
    And validate the <message> received in response
    Examples:
      | email             |error                      |message                        | message_type          | opt_status       | program_id                  | source_id | trigger_type | address_1 | address_2 | city | country | first_name | last_name | phone      | mobile     | postal_cd | state |
      | v@addresstest.com |Invalid input parameters   |Invalid or missing programId   | BBBY_US_Welcome_Event | I                | ""                          | 12345     | BB_SIGNUP    | address 1 | address 2 | CO   | US     | TestFirst  |  TestLast | 1234567890 | 1234567890 | 90001     | CA   |


  @smoke
  Scenario Outline: OPT:06 Validate the Valid response for email (retriable) for Invalid or missing Trigger Type
    Given user details i.e <email>, <message_type>, <opt_status>, <program_id>, <source_id>, <trigger_type>, <address_1>, <address_2>, <city>, <country>, <first_name>, <last_name>, <phone>, <mobile>, <postal_cd>, <state>
    When User hit "verify and Opt Email" API
    Then 400 status code should be received
    And validate the status 105 in response
    And validate <error> message received
    And validate the <message> received in response
    Examples:
      | email             |error                      |message                           | message_type          | opt_status       | program_id                    | source_id | trigger_type | address_1 | address_2 | city | country | first_name | last_name | phone      | mobile     | postal_cd | state |
      | v@addresstest.com |Invalid input parameters   |Invalid or missing triggerType   | BBBY_US_Welcome_Event | I                | BBB_US_MASS_EMAIL_CAMPAIGNS   | 12345     | ""    | address 1 | address 2 | CO   | US     | TestFirst  |  TestLast | 1234567890 | 1234567890 | 90001     | CA   |

