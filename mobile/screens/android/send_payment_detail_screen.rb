module Android
  class SendPaymentDetailScreen < Appom::Page
    section :common_screen, CommonScreen, 'id', 'android:id/content'
    element :txt_transaction_status, :id, 'tvStatus'
    element :txt_vendor_name, :id, 'tvUserName'
    element :txt_payment_method, :id, 'tvTransactionDate'
    element :txt_transaction_date, :id, 'tvDueDate'
    element :txt_deposit_to, :id, 'tvTerm'
    element :txt_payment_amount, :id, 'tvTotalAmountVertical'
    element :title_detail, :id, 'tvToolbarTile'

    def verify_send_payment(payment_details)
      sleep 2
      wait_for { expect(title_detail.text).to eql 'Send Payment' }
      aggregate_failures('verifying send payment') do
        expect(txt_transaction_status.text.downcase).to eql 'paid'
        expect(txt_transaction_date.text).to eql payment_details['payment_details']['payment_date']
        expect(txt_payment_method.text).to eql payment_details['payment_details']['payment_method']
        expect(parse_currency(txt_payment_amount.text)).to eql payment_details['payment_details']['payment_amount']
      end
    end
  end
end
