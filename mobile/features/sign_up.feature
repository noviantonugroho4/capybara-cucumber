@regression @sign_up
Feature: Sign Up Feature

  @reset_before
  Scenario Outline: User register account 
    Given user create new account with '<data>' data
    Then verify user account '<result>' to create
    Examples:
    | case_id             | data                   | result |
    | A91278              | empty_all              | failed |
    | A91279              | invalid_email          | failed |
    | A110931             | empty_full_name        | failed |
    | A111027             | empty_email            | failed |
    | A111028             | empty_phone_number     | failed |
    | A91281              | short_phone_number     | failed |
    | A91282              | long_phone_number      | failed |
    | A111586             | empty_password         | failed |
    | A91283              | password_not_match     | failed |
    | A91284              | no_term_and_agreement  | failed |
    | A91285              | yes_term_and_agreement | failed |
    | A91280,A91287       | registered_email       | failed |
    | A91286              | have_account           | failed |
