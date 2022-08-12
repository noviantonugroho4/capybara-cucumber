@regression @login
Feature: Login Feature

  @android @ios
  Scenario Outline: user should not be able to login
    Given user login as "<credential>"
    Then login should be failed
  Examples:
    | case_id       | credential            |
    | A78026,I83307 | user_invalid_password |
    | A78027,I83308 | user_invalid_email    |
    | A78028,I83309 | user_empty_password   |
    | A78029,I83310 | user_empty_email      |

  @android @ios
  Scenario: A78025,I83306-User should be able to login using valid credentials
    Given user login as 'user_mobile_profile'
    Then user is on 'dashboard' screen