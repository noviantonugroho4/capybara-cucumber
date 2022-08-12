module Ios
  class SalesInvoiceDetailScreen < Appom::Page
    element :txt_sales_invoice_header, :accessibility_id, 'Invoice Detail'
    element :txt_transaction_no, :id, 'tvTransactionNo'
    element :txt_transaction_status, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[3]'
    element :txt_customer_name, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[2]'
    element :txt_transaction_date, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[5]'
    element :txt_due_date, :id, 'tvDueDate'
    element :txt_term, :id, 'tvTerm'
    element :txt_product_name, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeStaticText[3]'
    element :txt_product_price, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeStaticText[1]'
    element :txt_balance_due, :id, 'tvBalanceDueVertical'
    element :btn_back, :accessibility_id, 'ic back white'

    def verify_sales_invoice(invoice_details)
      aggregate_failures('Verify created sales invoice') do
        expect(txt_customer_name.text).to eql invoice_details[:customer_name]
        expect(txt_transaction_date.text).to eql invoice_details[:transaction_date]
        expect(txt_product_name.text).to eql invoice_details[:product_details][:product_name]
      end
    end
  end
end
