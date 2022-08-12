module Android
  class NotificationScreen < Appom::Page
    section :common_screen, CommonScreen, 'id', 'android:id/content'
    element :content_tour_close, :id, 'ivSkip'
    element :content_tour, :id, 'clTourContent'
    element :tab_approval, :accessibility_id, 'REQUIRE APPROVAL'
    element :tab_notification, :accessibility_id, 'NOTIFICATIONS'
    element :approval_sales, :id, 'clSalesApproval'
    element :approval_purchases, :id, 'clPurchaseApproval'
    element :approval_expenses, :id, 'clExpenseApproval'
    element :no_trans_approve, :id, 'tvEmptyTitle'
    element :btn_approve_trans, :id, 'btnApprove'
    element :txt_approval_confirmation_title, :id, 'alertTitle'
    element :btn_approve_confirmation, :id, 'android:id/button1'
    element :txt_transaction_status, :id, 'tvStatus'
    element :txt_transaction_no, :id, 'tvTransactionNo'
    element :btn_back, :accessibility_id, 'ic back white'
  end
end
