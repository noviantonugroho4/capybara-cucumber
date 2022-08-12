module Android
  class SalesInvoiceDetailScreen < Appom::Page
    section :common_screen, CommonScreen, 'id', 'android:id/content'
    element :txt_sales_invoice_header, :id, 'tvToolbarTile'
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
    element :btn_menu_bottom, :xpath, "//android.view.ViewGroup[@resource-id='id.jurnal.mobile:id/fAMenu']/android.widget.ImageButton"
    element :btn_receive_payment, :id, 'fReceivePayment'

    def verify_sales_invoice(invoice_details)
      aggregate_failures('Verify created sales invoice') do
        expect(txt_customer_name.text).to eql invoice_details[:customer_name]
        expect(txt_transaction_date.text).to eql invoice_details[:transaction_date]
        expect(txt_product_name.text).to eql invoice_details[:product_details][:product_name]
      end
    end
  end
end
