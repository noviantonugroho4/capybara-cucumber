@regression @forgot_password @android @post_deployment
Feature: Forgot Password Feature

  Background: User able to open jurnal forgot password page
    Given user go to forgot password screen

  @android
  Scenario Outline: User try to reset forgot_password
    When user send forgot password instruction as "<value>"
    Then user verify forgot password '<result>'
    Examples:
    | case_id | value                 | result  |
    | A91276  | user_invalid_email    | failed  |
    #| A91277  | user_unregistered     | success |
    | A97152  | user_empty_email      | failed  |
    #| A91275  | user_mobile_profile   | success |