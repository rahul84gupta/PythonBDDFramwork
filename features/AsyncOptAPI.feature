#Feature: Validate "Asynchronous Opt" API
#  @smoke
#  Scenario Outline: AsOpt:01 Validate the Valid response for email (non-retriable)
#    Given user details i.e <email>, <message_type>, <opt_status>, <program_id>, <source_id>, <trigger_type>, <address_1>, <address_2>, <city>, <country>, <first_name>, <last_name>, <phone>, <mobile>, <postal_cd>, <state>
#    When User hit "AsyncOpt" API
#    Then 200 status code should be received
#    Examples:
#      | email            | message_type          | opt_status | program_id                  | source_id | trigger_type | address_1 | address_2 | city | country | first_name | last_name | phone      | mobile     | postal_cd | state |
#      | v@addresstest.com | BBBY_US_Welcome_Event | I          | BBB_US_MASS_EMAIL_CAMPAIGNS | 12345     | BB_SIGNUP    | address 1 | address 2 | CO   | US     | TestFirst  |  TestLast | 1234567890 | 1234567890 | 90001     | CA   |
