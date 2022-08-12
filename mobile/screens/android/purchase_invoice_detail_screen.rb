module Android
  class PurchaseInvoiceDetailScreen < Appom::Page
    element :txt_purchase_invoice_header, :id, 'tvToolbarTile'
    element :txt_transaction_no, :id, 'tvTransactionNo'
    element :txt_transaction_status, :id, 'tvStatus'
    element :txt_vendor_name, :id, 'tvUserName'
    element :txt_transaction_date, :id, 'tvTransactionDate'
    element :txt_due_date, :id, 'tvDueDate'
    element :txt_term, :id, 'tvTerm'
    element :txt_product_name, :id, 'tvProductName'
    element :txt_product_price, :id, 'tvProductPrice'
    element :txt_balance_due, :id, 'tvBalanceDueVertical'
    element :txt_deposit, :id, 'tvDeposit'
    element :btn_back, :id, 'ivBack'
    element :btn_menu, :id, 'ivOption'
    element :btn_edit, :id, 'tvEdit'
    element :btn_menu_bottom, :xpath, "//android.view.ViewGroup[@resource-id='id.jurnal.mobile:id/fAMenu']/android.widget.ImageButton"
    element :btn_send_payment, :id, 'fSendPayment'
    element :btn_more_amount, :id, 'tvMoreAmount'

    def verify_purchase_invoice(invoice_details)
      sleep 5
      wait_for { txt_vendor_name.displayed? && txt_vendor_name.text != '' && !txt_vendor_name.text.nil? }
      aggregate_failures('Verify created purchase invoice') do
        expect(txt_vendor_name.text).to eql invoice_details[:vendor_name]
        expect(txt_transaction_date.text).to eql invoice_details[:transaction_date]
        expect(txt_product_name.text).to eql invoice_details[:product_details][:product_name]
      end
    end

    def verify_purchase_invoice_deposit(purchase_invoice_edit_deposit)
      wait_for { txt_deposit.displayed? }
      aggregate_failures('Verify edited deposit in purchase invoice') do
        deposit_amount = txt_deposit.text.to_s
        deposit_amount = deposit_amount.delete('.')
        expect(deposit_amount).to eql '-Rp  ' + purchase_invoice_edit_deposit[:deposit][:deposit_amount].to_s + ',00'
      end
    end
  end
end
