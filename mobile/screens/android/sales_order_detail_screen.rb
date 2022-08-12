module Android
  class SalesOrderDetailScreen < Appom::Page
    section :common_screen, CommonScreen, 'id', 'android:id/content'
    element :txt_sales_order_header, :id, 'tvToolbarTile'
    element :txt_transaction_no, :id, 'tvTransactionNo'
    element :txt_transaction_status, :id, 'tvStatus'
    element :txt_customer_name, :id, 'tvUserName'
    element :txt_transaction_date, :id, 'tvTransactionDate'
    element :txt_due_date, :id, 'tvDueDate'
    element :txt_term, :id, 'tvTerm'
    element :txt_product_name, :id, 'tvProductName'
    element :txt_product_price, :id, 'tvProductPrice'
    element :txt_balance_due, :id, 'tvBalanceDueVertical'
    element :btn_back, :id, 'ivBack'
    element :btn_three_dot, :id, 'ivOption'
    element :btn_delete, :id, 'tvDelete'
    element :btn_cancel_delete, :id, 'android:id/button2'
    element :btn_yes_delete, :id, 'android:id/button1'
    element :text_message, :id, 'android:id/message'

    def verify_sales_order(order_details)
      wait_for { txt_customer_name.displayed? && !txt_customer_name.text.nil? && txt_customer_name.text != '' }
      aggregate_failures('Verify created sales order') do
        expect(txt_customer_name.text.downcase).to eql order_details[:customer_name].downcase
        expect(txt_transaction_date.text.downcase).to eql order_details[:transaction_date].downcase
        expect(txt_product_name.text.downcase).to eql order_details[:product_details][:product_name].downcase
      end
    end
  end
end
