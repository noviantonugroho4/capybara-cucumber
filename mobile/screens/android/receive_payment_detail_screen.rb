module Android
  class ReceivePaymentDetailScreen < Appom::Page
    section :common_screen, CommonScreen, 'id', 'android:id/content'
    element :txt_transaction_status, :id, 'tvStatus'
    element :txt_customer_name, :id, 'tvUserName'
    element :txt_payment_method, :id, 'tvTransactionDate'
    element :txt_transaction_date, :id, 'tvDueDate'
    element :txt_deposit_to, :id, 'tvTerm'
    element :txt_payment_amount, :id, 'tvTotalAmountVertical'

    def verify_receive_payment(payment_details)
      aggregate_failures('verifying receive payment') do
        expect(txt_transaction_status.text.downcase).to eql 'paid'
        expect(txt_transaction_date.text).to eql payment_details['payment_details']['payment_date']
        expect(txt_payment_method.text).to eql payment_details['payment_details']['payment_method']
        expect(parse_currency(txt_payment_amount.text)).to eql payment_details['payment_details']['payment_amount']
      end
    end
  end
end
