@regression @sales_order
Feature: Sales Order Feature

  Background: User login and go to screen
    Given user login as 'user_sales_order'

  # Need transaction contains name, trans number, product, memo, message, status, address as search text
  @android @ios
  Scenario Outline: User search sales order
    When user go to 'sales order tab' screen
    Given user search sales order with "<search_text>"
    Then sales order search result displayed on the list
  Examples:
    | case_id                                   | search_text            |
    | A67442,I85090                             | kodok                  |
    | A67441,I85089                             | 10001                  |
    | A67447,I85095                             | #10001                 |
    | A67443,I85091                             | cebong                 |
    | A79345,I85109                             | testing memo           |
    | A67444,I85092                             | testing message        |
    | A67452,A67454,A67455,I85098,I85099,I85100 | open                   |
    | A67451,A67462,I85097,I85107               | closed                 |
    | A67461,A81135,I85106,I85110               | partially sent         |
    | A67445,I85093                             | tebet                  |

  @android
  Scenario: A67426,A67428,A67427,A67430,A67432,A67433,A67431,A67460,A67463,A67472,A67473,A67475,A67476-User validate sales order details overview
    When user go to 'sales order tab' screen
    Then user validate create new sales order
    And user validate delete sales order

  @android @post_deployment
  Scenario: A67434,A67429,A67448-User should able to create sales invoice when clicking the "+" icon at overview screen
    When user go to 'sales order tab' screen
    When user create new sales order using 'sales_order_default' from 'sales order'
    Then sales order should be successfully created

  @android 
  Scenario: A95196,A95197,A95205,A95198,A95206,A95200,A95200,A95201,A95207,A95203,A95204-User should able to select existing product
    When user go to 'sales order tab' screen
    When user create new sales order using existing product using 'sales_order_default' from 'sales order'
    Then sales order should be successfully created