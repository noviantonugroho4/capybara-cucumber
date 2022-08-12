module Ios
  class SalesQuoteDetailScreen < Appom::Page
    element :txt_sales_quote_header, :accessibility_id, 'Quote Detail'
    element :txt_transaction_no, :xpath, '//XCUIElementTypeOther[@name="Product"]/preceding-sibling::XCUIElementTypeCell/XCUIElementTypeStaticText[last()]'
    element :txt_transaction_status, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[3]'
    element :txt_customer_name, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[2]'
    element :txt_transaction_date, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[5]'
    element :txt_due_date, :xpath, '//XCUIElementTypeStaticText[@name="Expiry Date"]/following-sibling::XCUIElementTypeStaticText'
    element :txt_term, :xpath, '//XCUIElementTypeStaticText[@name="Term"]/following-sibling::XCUIElementTypeStaticText'
    element :txt_product_name, :xpath, '//XCUIElementTypeOther[@name="Product"]/following-sibling::XCUIElementTypeCell/XCUIElementTypeStaticText[last()]'
    element :txt_product_price, :xpath, '//XCUIElementTypeOther[@name="Product"]/following-sibling::XCUIElementTypeCell/XCUIElementTypeStaticText[1]'
    element :txt_balance_due, :xpath, '//XCUIElementTypeStaticText[@name="Balance due"]/following-sibling::XCUIElementTypeStaticText'
    element :btn_back, :accessibility_id, 'ic back white'

    def verify_sales_quote(quote_details)
      aggregate_failures('Verify created sales quote') do
        expect(txt_customer_name.text).to eql quote_details[:customer_name]
        expect(txt_transaction_date.text).to eql quote_details[:transaction_date]
        expect(txt_product_name.text).to eql quote_details[:product_details][:product_name]
      end
    end
  end
end
