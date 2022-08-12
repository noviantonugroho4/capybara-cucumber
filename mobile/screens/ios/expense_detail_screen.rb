module Ios
  class ExpenseDetailScreen < Appom::Page
    element :txt_title, :class_chain, '**/XCUIElementTypeStaticText[`label == "Expense Detail"`]'
    element :btn_dropdown_menu, :class_chain, '**/XCUIElementTypeButton[`label == "ic dot white"`]'
    element :btn_edit, :accessibility_id, 'Edit'
    element :btn_delete, :accessibility_id, 'Delete'
    element :txt_transaction_no, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[10]'
    element :txt_beneficiary_name, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[1]'
    element :txt_expense_status, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[3]'
    element :txt_balance_due, :id, 'tvBalanceDueVertical'
    element :txt_transaction_date, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[5]'
    element :txt_due_date, :id, 'tvDueDate'
    element :txt_pay_from_account, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[9]'
    element :txt_payment_method, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[6]'
    element :txt_expense_account, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeStaticText[2]'
    element :txt_expense_amount, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeStaticText[1]'
    element :txt_additional_info, :id, 'lnOtherInfoTitle'
    element :txt_expense_memo, :id, 'tvMemoContent'
    element :txt_expense_tags, :id, 'tvTag'
    element :btn_back, :accessibility_id, 'btn_back_transaction_detail'
    element :btn_confirm_delete, :accessibility_id, 'btn_delete_transaction_detail'
  end
end
