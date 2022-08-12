@regression @expense
Feature: Expense Feature

  Background: User login to jurnal mobile
    Given user login as 'user_mobile_expense'

  @android
  Scenario: A80799,A80800,A80801,A80802-User should be able to see information in overview screen
    Then user go to 'expense overview' screen

  @android @ios
  Scenario Outline: User should be able to create new expenses
    When user go to '<screen_name>' screen
    And user create new expenses using '<expense_detail>' from '<screen_name>'
    Then expense should be successfully created
    Examples:
    | case_id                                                                                                | expense_detail                       | screen_name      |
    | A80803,A80878,A82585,A80880,A80881,A80889,A80890,A80892,A80914,A80919,A80974,A80976,A80816             | expense_default                      | expense overview |
    | A80822,A80879,A80883,A80885,A80886,A80887,A80888,A80904,A80905,A80915,A80975,A80814,A80982             | expense_with_new_vendor_and_paylater | expense tab      |
    | A80877,A80912,A80913,A80882,A80902,A80903                                                              | expense_with_edited_vendor           | expense tab      |
    | A80891,A80893,A80894,A80895,A80896,A80897,A80898,A80899,A80900,A80901,A80907,A80917,A81112,A90624      | expense_edited                       | expense tab      |

  @android
  Scenario Outline: User should not be able to create new expenses
    When user go to '<screen_name>' screen
    And user create new expenses using '<expense_detail>' from '<screen_name>'
    Then expense should not be created
    Examples:
      | case_id | expense_detail            | screen_name      |
      | A80917  | expense_empty_account     | expense overview |
      | A90623  | expense_empty_beneficiary | expense tab      |
#      | A80891  | expense_empty_amount      | expense tab      |
#      | A90624  | expense_zero_amount       | expense tab      |

  @android
  Scenario Outline: User search expense
    When user go to 'expense tab' screen
    And user search expense with '<search_keyword>'
    Then expense search result displayed on the list
    Examples:
    | case_id              | search_keyword |
    | A80810               | My Contact     |
    | A80806,A80813        | 10001          |
    | A80811,A80819,A80821 | Paid           |
    | A80812               | icebox_mobile  |

  @android @ios
  Scenario Outline: User should be able to edit open expenses to paid status
    When user go to '<screen_name>' screen
    And user edit open expense '<open_expense_detail>' to '<expense_detail>' from '<screen_name>'
    Then expense should be successfully edited
    Examples:
    | case_id                                    | expense_detail                       | screen_name |   open_expense_detail |
    | A80984,A176191,A176207,I81812,I81744       | open_expense_edited_to_paid          | expense tab |   open_expense_detail |

  @android @ios
  Scenario Outline: User should be able to create expenses with selecting expenses account only
    When user go to '<screen_name>' screen
    And user create expense using '<expense_detail>' from '<screen_name>'
    Then expense should be successfully created even selecting only expenses account
    Examples:
    | case_id                   | expense_detail                             | screen_name |
    | A176228,I81781            | expense_detail_with_expenses_only          | expense tab |            

  @android @ios
  Scenario Outline: User should be able to delete expenses
    When user go to '<screen_name>' screen
    And user delete expense '<expense_detail>' from '<screen_name>'
    Then expense should be successfully deleted
    Examples:
    | case_id                   | expense_detail          | screen_name |
    | A176210,I81763            | delete_expense          | expense tab |            


