module Android
  class PurchaseOrderDetailScreen < Appom::Page
    element :txt_purchase_order_header, :id, 'clToolbarTitle'
    element :txt_transaction_no, :id, 'tvTransactionNo'
    element :txt_transaction_status, :id, 'tvStatus'
    element :txt_vendor_name, :id, 'tvUserName'
    element :txt_transaction_date, :id, 'tvTransactionDate'
    element :txt_due_date, :id, 'tv_purchase_order_details_due'
    element :txt_term, :id, 'tv_purchase_order_details_term'
    element :txt_product_name, :id, 'tvProductName'
    element :txt_product_price, :id, 'tvProductPrice'
    element :txt_balance_due, :id, 'tvBalanceDueVertical'
    element :btn_back, :id, 'ivBack'

    def verify_purchase_order(order_details)
      wait_for { has_txt_vendor_name? }
      sleep 2
      aggregate_failures('Verify created purchase order') do
        expect(txt_vendor_name.text).to eql order_details[:vendor_name]
        expect(txt_transaction_date.text).to eql order_details[:transaction_date]
        expect(txt_product_name.text).to eql order_details[:product_details][:product_name]
      end
    end
  end
end
