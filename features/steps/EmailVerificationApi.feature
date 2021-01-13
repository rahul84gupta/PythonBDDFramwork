# Created by BB08503 at 1/12/2021
Feature: Validate Email verify API

  Scenario Outline: Validate the success response after verifying the valid email using Email verify API
    Given valid <email> and <sourceId> is provided
    When When user hit email verify API
    Then 200 status code should be received
    Examples:
      | email                       | sourceId |
      | qarahulgupta3110@gmail.com  | 12345    |
