@regression @purchase_invoice
Feature: Purchase Invoice Feature
  # Pre-requisites:
  #  - Have minimum 1 open purchase invoice
  #  - Have minimum 1 overdue purchase invoice
  #  - Have minimum 1 closed purchase invoice (already paid)
  #  - Activate shipping

  Background: User login to jurnal mobile
    Given user login as 'user_mobile_purchase_invoice'

  @android @ios
  Scenario: A79482,A79483,A79484,A79485,A79486,A79487,A79488,A79489,A79490,A81267,A81268,A81269,I86854,I86855,I86856,I86857,I86858,I86859,I86860,I86861,I86862,I86863,I86864,I86865-User should be able to see information in overview screen
    Then user go to 'purchase overview' screen


  @android @ios
  Scenario Outline: User search sales invoice
    When user go to 'purchase invoice tab' screen
    And user search purchase invoice with "<search_text>"
    Then purchase invoice search result displayed on the list
    Examples:
      | case_id       | search_text                                 |
      | A82486,I86841 | 10001                                       |
      | A82487,I86842 | My Vendor                                   |
      | A82488,I86843 | Sales                                       |
      | A82489,I86844 | purchase invoice message from jurnal mobile |
      | A82490,I86845 | Jakarta                                     |
      | A82491,I86846 | purchase invoice memo from jurnal mobile    |
      | A82492,I86847 | open                                        |
      | A82493,I86848 | paid                                        |
      | A82494,I86849 | overdue                                     |

  @android @ios @post_deployment
  Scenario Outline: User should able to create and edit purchase invoice
    When user go to '<screen_name>' screen
    And user create new purchase invoice using '<purchase_invoice_detail>' from '<screen_name>'
    Then purchase invoice should be successfully created

  Examples:
    | case_id                                                                                                                       | purchase_invoice_detail                 | screen_name          |
    | A81258,A81260,A81262,A81264,A82458,A86146,A86166,A86151,A86152,A86153,A86167,A86171,A86172,I86824,I86826,I86828,I86830,I86839 | purchase_invoice_default                | purchase overview    |
    | A81259,A81261,A81263,A81265,A82459,A86148,A86155,A86157,A86159,A86147,A86168,A86169,A86174,I86825,I86827,I86829,I86831,I86840 | purchase_invoice_new_vendor_and_product | purchase invoice tab |

  @android @post_deployment
  Scenario: A87273,A87274,A87280,A87350,A87351,A87310,A87318,A87320-User should able to create send payment
    When user go to 'purchase invoice tab' screen
    And user create new purchase invoice using 'purchase_invoice_new_vendor_and_product' from 'purchase invoice tab'
    Then purchase invoice should be successfully created
    When user create new send payment using 'send_payment_default'
    Then send payment should be successfully created

  @android @ios @post_deployment
  Scenario Outline: User should able to create purchase invoice when clicking the "+" icon at overview screen
    When user go to '<screen_name>' screen
    And user create new purchase invoice using '<purchase_invoice_detail>' from '<screen_name>'
    Then purchase invoice should be successfully created
    
    Examples:
    | case_id                                                                                                                                                    | purchase_invoice_detail                 | screen_name          | purchase_invoice_edit_detail                 |
    | A85485,A85488,A85490,A85492,A85494,A85496,A85498,A85499,A85502,A85504,A85506,I86046,I86048,I86050,I86052,I86054,I86056,I86058,I86059,I86062,I86064,I86066  | purchase_invoice_default                | purchase overview    | purchase_invoice_edit_new_vendor_and_product |
    | A85487,A85489,A85491,A85493,A85495,A85497,A85501,A85500,A85503,A8555,I86047,I86049,I86051,I86053,I86055,I86057,I86061,I86060,I86063,I86065                 | purchase_invoice_new_vendor_and_product | purchase invoice tab | purchase_invoice_edit_default                |

  @android @post_deployment
  Scenario: A87353,A87354,A87355,A87356,A87369,A87357,A87370,A87373,A87371,A87372,A87358,A87359,A87360,A87361,A87362-User should able to create and edit send payment
    When user go to 'purchase invoice tab' screen
    And user create new purchase invoice using 'purchase_invoice_new_vendor_and_product' from 'purchase invoice tab'
    Then purchase invoice should be successfully created
    When user create new send payment using 'send_payment_default'
    Then send payment should be successfully created

  @android
  Scenario Outline: User should able to edit purchase invoice
    When user go to '<screen_name>' screen
    And user create new purchase invoice using '<purchase_invoice_detail>' from '<screen_name>'
    Then purchase invoice should be successfully created
    When user edit purchase invoice using '<purchase_invoice_edit_detail>'
    Then purchase invoice should be successfully edited

    Examples:
    | case_id                                    | purchase_invoice_detail                 | screen_name          |    purchase_invoice_edit_detail              |
    | A85511,A85518,A85519,A85520,A85521         | purchase_invoice_default                | purchase overview    | purchase_invoice_edit_new_vendor_and_product |
    | A85522,A85523,A85599,A85602                | purchase_invoice_new_vendor_and_product | purchase invoice tab | purchase_invoice_edit_default                |    

  @android @ios
  Scenario: A88162,A88164,A88167,A88168,A88177,A88178,A88179,A88180,A98584,I88182,I88183,I88184,I88185,I88186,I88187,I88188,I88189,I98583- User should able to view purchase payment
    When user go to 'purchase invoice tab' screen
    And user create new purchase invoice using 'purchase_invoice_new_vendor_and_product' from 'purchase invoice tab'
    Then purchase invoice should be successfully created
    When user create new send payment using 'send_payment_default'
    Then view send payment information
    Then send payment should be successfully created

  @android @post_deployment
  Scenario: A85663,A86156,A86160,A86162- Create new purchase invoice clicking create and new button 
    When user go to 'purchase invoice tab' screen
    And user create new purchase invoice using 'purchase_invoice_default' from 'purchase invoice tab' clicking create new button
    Then user create new purchase invoice using 'purchase_invoice_new_vendor_and_product' from 'purchase invoice form'
    Then purchase invoice should be successfully created

  @android
  Scenario: A86163- User should be able to edit Deposit that is added
    When user go to 'purchase invoice tab' screen
    And user create purchase invoice using 'purchase_invoice_with_deposit' from 'purchase invoice tab' then edit deposit with 'purchase_invoice_edit_deposit'
    Then purchase invoice with deposit should be successfully edited

  @android
  Scenario: A86165- User should be able to delete Deposit that is added
    When user go to 'purchase invoice tab' screen
    And user create purchase invoice using 'purchase_invoice_with_deposit' from 'purchase invoice tab' 
    Then delete deposit of purchase invoice
    Then purchase invoice with deposit should be successfully edited with no deposit
