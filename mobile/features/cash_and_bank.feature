@regression @cash_and_bank
Feature: Cash and Bank Feature

  Background: User login to jurnal mobile
    Given user login as 'user_mobile_cash_and_bank'

  @android
  Scenario: A93301,A93302,A93303,A93304-User should be able to see information on in overview screen
    Then user go to 'cash and bank overview' screen

  Scenario Outline: User should be able to to create new transactions in cash and bank
    When user go to 'cash and bank overview' screen  
    And user create new cash and bank transactions using '<cash_and_bank_type>' from '<screen_name>'
    Then cash and bank transactions should be successfully created
    When user edit cash and bank transactions using '<cash_and_bank_type>'
    Then cash and bank transactions successfully edited
    When user delete cash and bank transactions using '<cash_and_bank_type>'
    Then cash and bank transactions successfully deleted

  Examples:
    | case_id               | cash_and_bank_type  | screen_name               |
    | A93306,A93307,A93443  | Transfer Funds      | cash and bank overview    |
    | A93444,A93445,A93446  | Recieve Money       | cash and bank overview    |
    | A93447,A93448,A93449  | Transfer Funds      | cash and bank overview    |