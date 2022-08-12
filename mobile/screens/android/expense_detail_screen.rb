module Android
  class ExpenseDetailScreen < Appom::Page
    section :common_screen, CommonScreen, :id, 'android:id/content'
    element :txt_title, :id, 'tvToolbarTile'
    element :btn_dropdown_menu, :id, 'ivOption'
    element :btn_edit, :id, 'tvEdit'
    element :btn_delete, :id, 'tvDelete'
    element :txt_transaction_no, :id, 'tvTransactionNo'
    element :txt_beneficiary_name, :id, 'tvUserName'
    element :txt_expense_status, :id, 'tvStatus'
    element :txt_balance_due, :id, 'tvBalanceDueVertical'
    element :txt_transaction_date, :id, 'tvTransactionDate'
    element :txt_due_date, :id, 'tvDueDate'
    element :txt_pay_from_account, :id, 'tvPayFrom'
    element :txt_expense_account, :id, 'tvExpenseName'
    element :txt_expense_amount, :id, 'tvExpenseDebit'
    element :txt_additional_info, :id, 'lnOtherInfoTitle'
    element :txt_expense_memo, :id, 'tvMemoContent'
    element :txt_expense_tags, :id, 'tvTag'
    element :btn_back, :id, 'ivBack'
    element :btn_confirm_delete, :xpath, '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.appcompat.widget.LinearLayoutCompat/android.widget.ScrollView/android.widget.LinearLayout/android.widget.Button[2]'
  end
end
