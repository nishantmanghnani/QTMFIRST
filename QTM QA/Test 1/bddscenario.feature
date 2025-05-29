Feature: User authentication

  Background:
    Given the user is on the login page

  @smoke
  Scenario: Login with valid credentials
    When the user enters valid username and password
    And clicks the login button
    Then the user should be redirected to the dashboard

  Scenario Outline: Login with multiple credentials
    When the user enters "<dp881>" and "<dp882>"
    Then the login should "<dp883>"

    Examples:
      | dp881    | dp882    | dp883        |
      | user1    | pass123  | succeed      |
      | user2    | wrongpwd | fail         |