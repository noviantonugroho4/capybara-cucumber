@regression @approval_log
Feature: Approval Log Feature

  @android
  Scenario Outline: Approver should be able to approve draft sales using any and level 1 approval
    Given user login as '<login_account>'
    When accountant create new draft '<transaction>' using data '<data_detail>'
    Then new approval draft sucessfully created
    When user login as '<second_login_account>'
    And user approve draft '<transaction>' on approval log menu
    Then new approaval draft succesfully approved

    Examples:
    | case_id                                         | login_account                  | transaction   | data_detail            | second_login_account               |
    | A176013,A176014,A176015,A176032,A175959,A175960 | user_approval_log_buyer_role_1 | Sales Quote   | sales_quote_approval   | user_approval_log_approval_role_1  |
    | A176019,A176020,A176021,A176033,A175961,A175962 | user_approval_log_buyer_role_1 | Sales Order   | sales_order_approval   | user_approval_log_approval_role_1  |
    | A176025,A176026,A176027,A176034,A175963,A175954 | user_approval_log_buyer_role_1 | Sales Invoice | sales_invoice_approval | user_approval_log_approval_role_1  | 

    