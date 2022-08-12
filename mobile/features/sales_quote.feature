@regression @sales_quote
Feature: Sales Quote Feature

  Background: User login and go to screen
    Given user login as 'user_mobile_sales_quote'

  @android @ios
  Scenario: A63019,A63020,A63021,A63022,I95517,I95518,I95519,I95520-Sales quote tab
    When user go to 'sales quote tab' screen

  @android
  Scenario: A62972,A62973,A62974,A62975,A62976,A62977-Sales quote overview
    When user go to 'sales quote tab' screen  
    Then verify sales quote overview screen

  @android @ios @post_deployment
  Scenario Outline: User search sales quote
    When user go to 'sales quote tab' screen
    And user search sales quote with "<search_text>"
    Then sales quote search result displayed on the list
    Examples:
      | case_id                     | search_text                              |
      | A93721,I95526               | 10001                                    |
      | A93722,I95527               | My Customer                              |
      | A93724,I95529               | Sales                                    |
      | A93725,I95530               | Sales quote created from icebox mobile   |
      | A93726,I95531               | Sales quote created from icebox mobile   |
      | A93723,A63025,I95528,I95521 | open                                     |
      | A93727,I95532               | closed                                   |

  @android @post_deployment
  Scenario Outline: User create sales quote
    When user go to '<screen_name>' screen
    And user create new sales quote using '<sales_quote_detail>' from '<screen_name>'
    Then sales quote should be successfully created
  Examples:
    | case_id                                                                                                                                     | sales_quote_detail                   | screen_name     |
    | A64533,A63035,A63037,A63041,A63042,A63046,A63056,A63061,A63615,A63616,A63633,A63720,A64605,A64860,A63416,A63638,A63735,A63427,A63428        | sales_quote_default                  | sales overview  |
    | A63034,A63036,A63044,A63057,A63058,A63380,A63381,A63382,A63383,A63410,A63614,A63629,A63637,A63639,A63640,A63655,A63721,A82584,A63419,A63424 | sales_quote_new_customer_and_product | sales quote tab |

  @ios
  Scenario Outline: User create sales quote
    When user go to '<screen_name>' screen
    And user create new sales quote using '<sales_quote_detail>' from '<screen_name>'
    Then sales quote should be successfully created
  Examples:
    | case_id                                                                                                                                     | sales_quote_detail                   | screen_name     |
    | I95552,I95549,I95551,I95563,I95564,I95568,I95578,I95580,I95631,I95632,I95641,I95572,I95677,I95691,I95606,I95646,I95525,I95581,I95582        | sales_quote_default                  | sales overview  |
    | I95548,I95550,I95566,I95579,I95585,I95588,I95589,I95590,I95591,I95602,I95583,I95584,I95645,I95647,I95648,I95659,I95611,I95573,I95609,I95610 | sales_quote_new_customer_and_product | sales quote tab |

  @android @ios @post_deployment
  Scenario: A66954,A66951,A66952,A66953,A66966,A66967,A66968,A66969,A66971,I95700,I95701,I95702,I95715,I95716,I95717,I95718,I95719,I95720-User edit sales quote
    When user go to 'sales quote tab' screen
    And user edit sales quote using 'sales_quote_default' from 'sales quote tab'
    Then sales quote should be successfully edited