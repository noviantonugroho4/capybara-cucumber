@regression @setting @android
Feature: Setting Feature
  
  Scenario Outline: User register account 
    Given user login as 'user_mobile_setting_company'
    When user switch language to '<language>'
    Then verify user language changed
    Examples:
    | case_id | language |
    | A98114  | Bahasa   |
    | A98115  | English  |

  @wip
  # Prequisites: Simulator or device need to connect to mail first
  Scenario Outline: User register account 
    Given user login as 'user_mobile_setting_company'
    When  user go to '<menu>' screen
    Then verify user menu '<menu>'
    Examples:
    | case_id | menu            |
    | A98138  | Contact Us      |
    | A98140  | Guide Book      |
    | A98143  | Privacy Policy  |
    | A98146  | App Info        |

  @kill_app
  Scenario: A98091,A98092,A98089,A98093,A98095,A98096,A98097,A98098,A98099,A98100,A98101,A98102,A98103,A98104,A98105,A98106-User register account 
    Given user login as 'user_mobile_setting_company'
    And user switch to 'other' company
    When user edit company details as 'company_details'
    Then verify user updated company details

  @kill_app
  Scenario: A98107,A98108,A98112,A98113-User setting transaction
    Given user login as 'user_mobile_setting_company'
    When user edit setting transaction as 'setting_transaction'
    Then verify user updated setting transction details

  @reset_before
  Scenario Outline: User check transcation setting base on roles
    Given user login as '<user_name>'
    Then user verify transaction tab as '<user_name>'
    Examples:
    | case_id | user_name                                    |
    | A121446 | user_sales_invoice_return_roles              |
    | A121449 | user_sales_order_quote_roles                 |
    | A98109  | user_sales_payments_roles                    |
    | A121444 | user_sales_invoice_return_restricted_roles   |
    | A121445 | user_sales_order_quote_restricted_roles      |
    | A121448 | user_sales_payments_restricted_roles         |
    | A121450 | user_purchase_invoice_return_roles           |
    | A121447 | user_purchase_order_quote_roles              |
    | A98110  | user_purchase_payments_roles                 |
    | A121458 | user_purchase_invoice_restricted_roles       |
    | A121459 | user_purchase_order_restricted_roles         |
    | A121460 | user_purchase_payments_restricted_roles      |

  Scenario Outline: User set PIN on account
    Given user login as 'user_mobile_setting_security'
    When user set '<security_setting>' PIN
    Then verify user PIN screen
    Examples:
    | case_id       | security_setting             |
    | A98122,A98123 | security_no_pin              |
    | A98124        | security_pin_valid_not_match |
    | A98125,A98126 | security_pin_valid_match     |

  @kill_app
  Scenario Outline: User set PIN on account
    Given user login as 'user_mobile_setting_security'
    When user input '<security_setting>' PIN
    Then verify user inputted PIN
    Examples:
    | case_id       | security_setting             |
    | A98127,A98128 | security_pin_valid_not_match    |
    | A98129        | security_pin_valid_match  |
