@regression @expense
Feature: Contact Without Transaction Feature

  Background: User login to jurnal mobile
    Given user login as 'user_mobile_contact_without_transaction'

  @android
  Scenario Outline: User should be able to create new contacts
    When user go to '<screen_name>' screen
    And user create new <type> using '<contact_detail>'
    Then customer should be successfully created
    Examples:
    | case_id                                                                                    | type     | contact_detail                       | screen_name   |
    | A97751,A97782,A97783,A97785,A97786,A97787,A97788,A97789,A97790,A97791,A97792,A97793,A97813 | customer | customer_without_transaction_default | customers tab |
    | A97847,A97878,A97879,A97881,A97882,A97883,A97884,A97885,A97886,A97887,A97888,A97893        | vendor   | vendor_without_transaction_default   | vendors tab   |

  @android @ios
  Scenario Outline: User should be able to edit customer  
    When user go to '<screen_name>' screen
    And user edit <type> using '<contact_detail>'
    Then customer should be successfully edited
    Examples:
    | case_id                                                                                                                                     | type     | contact_detail                            | screen_name   |
    | A97816,A97817,A97818,A97819,A97820,A97821,A97822,A97823,A97824,I95066,I95067,I95068,I95069,I95070,I95071,I95072,I95073,I95074,I95075,I95076 | customer | customer_edit_without_transaction_default | customers tab |

  @android @ios
  Scenario: A97896,A97897,A97898,A97899,A97900,A97901,A97902,A97903,A97904,A97909,A97910,A97911,I95149,I95150,I95151,I95152,I95153,I95154,I95155,I95156,I95157,I95158- User should be able to edit vendor
    When user go to 'vendors tab' screen
    And user edit customer using 'vendor_edit_without_transaction'
    Then vendor should be successfully edited

  @android
  Scenario: A97784,A97794,A97795,A97796,A97797- User unable to create new customer
    When user go to 'customers tab' screen
    And user create new customer using 'failed_create_customer'
    Then customer should not be created on contact details

  @android
  Scenario: A97880,A97889,A97890,A97891,A97892- User unable to create new vendor
    When user go to 'vendors tab' screen
    And user create new vendor using 'failed_create_vendor'
    Then vendor should not be created on contact details  