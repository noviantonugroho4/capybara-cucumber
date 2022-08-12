@regression @sales_invoice
Feature: Sales Invoice Feature
  # Pre-requisites:
  #  - Have minimum 1 open sales invoice
  #  - Have minimum 1 overdue sales invoice
  #  - Have minimum 1 closed sales invoice (already paid)

  Background: User login to jurnal mobile
    Given user login as 'user_mobile_sales_invoice'

  @android @ios
  Scenario: A81295,A81296,A81297,A81298,A81299,A81300,A81301,A81302,A81303,A81304,A67409,I84725,I84726,I84727,I84728,I84729,I84730,I84731,I84732,I84733,I84734,I84723-User should be able to see information in overview screen
    Then user go to 'sales overview' screen

  @android @ios
  Scenario Outline: User search sales invoice
    When user go to 'sales invoice tab' screen
    And user search sales invoice with "<search_text>"
    Then sales invoice search result displayed on the list
    Examples:
      | case_id       | search_text                              |
      | A67362,I84982 | 10001                                    |
      | A67363,I84983 | My Customer                              |
      | A67364,I84984 | Sales                                    |
      | A67365,I84985 | sales invoice message from jurnal mobile |
      | A67366,I85005 | Jakarta                                  |
      | A80171,I84986 | sales invoice memo from jurnal mobile    |
      | A67373,I84993 | open                                     |
      | A67374,I84994 | paid                                     |
      | A67372,I84992 | overdue                                  |  

  @android @ios
  Scenario Outline: User should able to create sales invoice when clicking the "+" icon at overview screen
    When user go to '<screen_name>' screen
    And user create new sales invoice using 'sales_invoice_default' from '<screen_name>'
    Then sales invoice should be successfully created
  Examples:
    | case_id                                                 | screen_name       |
    | A67411,A67413,A81293,A67369,I85028,I85030,I84724,I84989 | sales overview    |
    | A67412,A67419,A67414,A67376,I85029,I85036,I85031,I84996 | sales invoice tab |

  @android @ios
  Scenario: A76040,A76043,A76041,A76044,A76045,A76046,A76049,A76051-User should able to create receive payment
    When user go to 'sales invoice tab' screen
    And user create new sales invoice using 'sales_invoice_new_customer_and_product' from 'sales invoice tab'
    Then sales invoice should be successfully created
    When user create new receive payment using 'receive_payment_default'
    Then receive payment should be successfully created
