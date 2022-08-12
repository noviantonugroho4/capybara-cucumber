@regression @purchase_order
Feature: Purchase Order Feature
  # Pre-requisites:
  #  - Have minimum 1 open purchase order
  #  - Have minimum 1 closed purchase order

  Background: User login to jurnal mobile
    Given user login as 'user_mobile_purchase_order'

  @android @ios
  Scenario Outline: User search purchase order
    When user go to 'purchase order tab' screen
    And user search purchase order with "<search_text>"
    Then purchase order search result displayed on the list
    Examples:
      | case_id       | search_text                               |
      | A83647,I86886 | 10001                                     |
      | A83648,I86887 | My Vendor                                 |
      | A83649,I86888 | My Product                                |
      | A83650,I86889 | purchase order message from jurnal mobile |
      | A83651,I86891 | Jakarta                                   |
      | A83652,I86890 | purchase order memo from jurnal mobile    |
      | A83653,I86892 | open                                      |
      | A83654,I86893 | closed                                    |  

  @android @ios @post_deployment
  Scenario Outline: User should able to create purchase order when clicking the "+" icon at overview screen
    When user go to '<screen_name>' screen
    And user create new purchase order using '<purchase_order_detail>' from '<screen_name>'
    Then purchase order should be successfully created
  Examples:
    | case_id                                                               | purchase_order_detail                 | screen_name        |
    | A83630,A83631,A83632,A83633,A83645,I86869,I86871,I86873,I86875,I86876 | purchase_order_default                | purchase overview  |
    | A83634,A83635,A83636,A83637,A83646,I86870,I86872,I86874,I86884,I86885 | purchase_order_new_vendor_and_product | purchase order tab |

  @android @ios @post_deployment
  Scenario Outline: User should able to create and edit purchase order 
    When user go to '<screen_name>' screen
    And user create new purchase order using '<purchase_order_detail>' from '<screen_name>'
    Then purchase order should be successfully created
  Examples:
    | case_id                                                                                     | purchase_order_detail                 | screen_name        |
    | A87132,A87133,A87134,A87152,A87137,A87138,A87139,I86869,I86871,I86873,I86875,I86876         | purchase_order_default                | purchase overview  |
    | A87140,A87141,A87142,A87153,A87143,A87144,A87145,A87154,I86870,I86872,I86874,I86884,I86885  | purchase_order_new_vendor_and_product | purchase order tab |

  @android @ios @post_deployment
  Scenario: A86634,A86640,A86641,A86643,A86644,A86655,A86658,A86661,I177423,I177428,I177433,I177434,I177435,I177436,I177446,I177449-  User edit selected data when create purchase order
    When user go to 'purchase overview' screen
    And user create new purchase order using 'purchase_order_before_edit' changed to 'purchase_order_default' from 'purchase overview'
    Then purchase order should be successfully created

  @android @ios @post_deployment @wip
  Scenario: A87149,A87151,A87155,A87156,A87157,A87158,A87159,I177480,I177482,I177486,I177487,I177488,I177489,177491-  User edit selected data when create purchase order
    When user go to 'purchase overview' screen
    And user edit purchase order changed data using 'purchase_order_default'
    Then purchase order should be successfully created
  