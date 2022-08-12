module Ios
  class PurchaseOrderDetailScreen < Appom::Page
    element :txt_purchase_order_header, :class_chain, '**/XCUIElementTypeStaticText[`label == "Order Detail"`]'
    element :txt_transaction_no, :xpath, '//XCUIElementTypeOther[@name="Product"]/preceding-sibling::XCUIElementTypeCell/XCUIElementTypeStaticText[last()]'
    element :txt_transaction_status, :class_chain, '**/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[3]'
    element :txt_vendor_name, :xpath, '//XCUIElementTypeStaticText[@name="To:"]/following-sibling::XCUIElementTypeStaticText'
    element :txt_transaction_date, :xpath, '//XCUIElementTypeStaticText[@name="Transaction Date"]/following-sibling::XCUIElementTypeStaticText'
    element :txt_due_date, :xpath, '//XCUIElementTypeStaticText[@name="Due Date"]/following-sibling::XCUIElementTypeStaticText'
    element :txt_term, :xpath, '//XCUIElementTypeStaticText[@name="Term"]/following-sibling::XCUIElementTypeStaticText'
    element :txt_product_name, :xpath, '//XCUIElementTypeOther[@name="Product"]/following-sibling::XCUIElementTypeCell/XCUIElementTypeStaticText[last()]'
    element :txt_product_price, :xpath, '//XCUIElementTypeOther[@name="Product"]/following-sibling::XCUIElementTypeCell/XCUIElementTypeStaticText[1]'
    element :txt_balance_due, :xpath, '//XCUIElementTypeStaticText[@name="Balance due"]/following-sibling::XCUIElementTypeStaticText'
    element :btn_back, :predicate, 'label == "ic back white"'

    def verify_purchase_order(order_details)
      sleep 2
      wait_for { txt_vendor_name.displayed? }
      aggregate_failures('Verify created purchase order') do
        expect(txt_vendor_name.text).to eql order_details[:vendor_name]
        expect(txt_transaction_date.text).to eql order_details[:transaction_date]
        expect(txt_product_name.text).to eql order_details[:product_details][:product_name]
      end
    end
  end
end
