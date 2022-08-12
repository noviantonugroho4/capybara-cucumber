module Ios
  class PurchaseInvoiceDetailScreen < Appom::Page
    element :txt_purchase_invoice_header, :class_chain, '**/XCUIElementTypeStaticText[`label == "Invoice Detail"`]'
    element :txt_transaction_no, :class_chain, '**/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[10]'
    element :txt_transaction_status, :class_chain, '**/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[3]'
    element :txt_vendor_name, :class_chain, '**/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[2]'
    element :txt_transaction_date, :class_chain, '**/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[5]'
    element :txt_due_date, :class_chain, '**/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[7]'
    element :txt_term, :class_chain, '**/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[9]'
    element :txt_product_name, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeStaticText[3]'
    element :txt_product_price, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeStaticText[1]'
    element :txt_balance_due, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeStaticText[2]'
    element :btn_back, :accessibility_id, 'ic back white'

    def verify_purchase_invoice(invoice_details)
      wait_for { txt_vendor_name.displayed? && txt_vendor_name.text != '' && !txt_vendor_name.text.nil? }
      aggregate_failures('Verify created purchase invoice') do
        expect(txt_vendor_name.text).to eql invoice_details[:vendor_name]
        expect(txt_transaction_date.text).to eql invoice_details[:transaction_date]
        expect(txt_product_name.text).to eql invoice_details[:product_details][:product_name]
      end
    end
  end
end
