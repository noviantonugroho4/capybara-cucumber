module Ios
  class SalesOrderDetailScreen < Appom::Page
    element :txt_sales_order_header, :accessibility_id, 'Order Detail'
    element :txt_transaction_no, :id, 'tvTransactionNo'
    element :txt_transaction_status, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[3]'
    element :txt_customer_name, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[2]'
    element :txt_transaction_date, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[5]'
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
    element :btn_back, :accessibility_id, 'ic back white'

    def verify_sales_order(order_details)
      aggregate_failures('Verify created sales order') do
        expect(txt_customer_name.text).to eql order_details[:customer_name]
        expect(txt_transaction_date.text).to eql order_details[:transaction_date]
        expect(txt_product_name.text).to eql order_details[:product_details][:product_name]
      end
    end
  end
end
