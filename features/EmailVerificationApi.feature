# Created by BB08503 at 1/12/2021
Feature: Validate Email verify API
 # @smoke
  @regression123
  Scenario Outline: EVS:01 Validate the success response after verifying the valid NEW email using Email verify API
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as valid in response
    And validate the <email> received
    And validate blank error message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    And validate Correlation Id is received in response header
    Examples:
      | email                       | sourceId | fndg |
      |rahul84gupta@yahoo.com       |12345     | V    |


  @regression
  Scenario Outline: EVS:02 Validate the success response after verifying the EXISTING email using Email verify API
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as valid in response
    And validate the <email> received
    And validate blank error message received
    Examples:
      | email                       | sourceId |
      |vs@addresstest.com   |12345     |
#
  @regression
  Scenario Outline: EVS:03 Validate the Error response after verifying the invalid email using Email verify API
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    Examples:
      | email                                       | sourceId |
      |qarahulgupta311csdcsdcsdcsdcsdc0@gmail.com   |12345    |


#=============   Status Error Scenarios        =========

  @regression
  Scenario Outline: EVS:04 Validate the error response for invalid/incorrect format source id
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status 101 in response
    And validate <error> message received
    And validate <message> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
     | email                     | sourceId   |  fndg  | error                    |message                  |
     |rahul84guptagmail.com      |12345       |  E     | Invalid input parameters |Invalid or missing email |


  @regression
  Scenario Outline: EVS:05 Validate the error response for "Missing @" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status 102 in response
    And validate <error> message received
    And validate <message> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error                    |message                  |
      |rahul84guptagmail.com      |12345       |  E     | Invalid input parameters |Invalid or missing email |


  @regression
  Scenario Outline: EVS:06 Validate the error response for "Missing UserName" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                  | sourceId   |  fndg  | error            |
      |A2@addresstest.com      |12345       |  E     | missing username |



  @regression
  Scenario Outline: EVS:07 Validate the error response for "Missing Domain" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                  | sourceId   |  fndg  | error            |
      | A3@addresstest.com     |12345       |  E     | missing domain |



  @regression
  Scenario Outline: EVS:08 Validate the error response for "Multiple @" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 400 status code should be received
    And validate the status 101 in response
    And validate <error> message received
    And validate the <message> received in response
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error                    |message                  |
      |rahul84@@guptagmail.com    | 12345      |  E     | Invalid input parameters |Invalid or missing email |

  @regression
  Scenario Outline: EVS:09 Validate the error response for "Bad Character" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error                    |
      |C1@addresstest.com         | 12345      |  E     | bad character            |

  @regression
  Scenario Outline: EVS:10 Validate the error response for "double .com" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error                  |
      |CC@addresstest.com         | 12345      |  E     | double .com            |


  @regression
  Scenario Outline: EVS:11 Validate the error response for "Bad Top level domain" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error                   |
      |DT@addresstest.com         | 12345      |  E     | bad top level domain    |


  @regression
  Scenario Outline: EVS:12 Validate the error response for "Bad Length" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error         |
      |LN@addresstest.com         | 12345      |  E     | bad length    |


  @regression
  Scenario Outline: EVS:13 Validate the error response for "contains multiple typos" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error                      |
      |ML@addresstest.com         | 12345      |  E     | contains multiple typos    |


  @regression
  Scenario Outline: EVS:14 Validate the error response for "Ends with period" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error                 |
      |P2@addresstest.com         | 12345      |  E     | ends with a period    |

  @regression
  Scenario Outline: EVS:15 Validate the error response for "double period in domain" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error                      |
      |P3@addresstest.com         | 12345      |  E     | double period in domain    |

  @regression
  Scenario Outline: EVS:16 Validate the error response for "Period following @" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error                 |
      |P4@addresstest.com         | 12345      |  E     | period following @    |


  @regression
  Scenario Outline: EVS:17 Validate the error response for "Starts with a period" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error                   |
      |P5@addresstest.com         | 12345      |  E     | starts with a period    |

  @regression
  Scenario Outline: EVS:19 Validate the error response for "invalid email account" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                    | sourceId   |  fndg  | error                    |
      |B@addresstest.com         | 12345      |  W     | invalid email account    |

  @regression
  Scenario Outline: EVS:20 Validate the error response for "Bad Domain" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error         |
      |DC@addresstest.com         | 12345      |  W     | bad domain    |

  @regression
  Scenario Outline: EVS:21 Validate the error response for "Bogus" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error    |
      |XB@addresstest.com         | 12345      |  W     | bogus    |

  @regression
  Scenario Outline: EVS:22 Validate the error response for "Client Restricted" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error                |
      |XC@addresstest.com         | 12345      |  W     | client restricted    |

  @regression
  Scenario Outline: EVS:23 Validate the error response for "Disposable" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error         |
      |XD@addresstest.com         | 12345      |  W     | disposable    |

  @regression
  Scenario Outline: EVS:24 Validate the error response for "EMPS Suppression" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error               |
      |XE@addresstest.com         | 12345      |  W     | EMPS suppression    |

  @regression
  Scenario Outline: EVS:25 Validate the error response for "Frequent Complainer" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error                  |
      |XF@addresstest.com         | 12345      |  W     | frequent complainer    |

  @regression
  Scenario Outline: EVS:27 Validate the error response for "Language" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error       |
      |XL@addresstest.com         | 12345      |  W     | language    |

  @regression28
  Scenario Outline: EVS:28 Validate the error response for "Problematic" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error          |
      |XP@addresstest.com         | 12345      |  W     | problematic    |

  @regression
  Scenario Outline: EVS:29 Validate the error response for "Role Account" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error           |
      |XR@addresstest.com         | 12345      |  W     | role account    |

  @regression
  Scenario Outline: EVS:30 Validate the error response for "FCC Wireless" format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error           |
      |XW@addresstest.com         | 12345      |  W     | FCC wireless    |


  @regression
  Scenario Outline: EVS:31 Validate the error response for "Client Restricted " format.
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    And validate the status as invalid in response
    And validate <error> message received
    And validate the database entries created in vfyd_eml table for  <email> and <fndg>
    Examples:
      | email                     | sourceId   |  fndg  | error                |
      |XC@addresstest.com         | 12345      |  W     | client restricted    |