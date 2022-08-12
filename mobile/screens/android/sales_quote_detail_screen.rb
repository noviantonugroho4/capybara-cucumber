module Android
  class SalesQuoteDetailScreen < Appom::Page
    element :txt_sales_quote_header, :id, 'tvToolbarTile'
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

    def verify_sales_quote(quote_details)
      aggregate_failures('Verify created sales quote') do
        expect(txt_customer_name.text).to eql quote_details[:customer_name]
        expect(txt_transaction_date.text).to eql quote_details[:transaction_date]
        expect(txt_product_name.text).to eql quote_details[:product_details][:product_name]
      end
    end
  end
end
