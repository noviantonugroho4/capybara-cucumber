class ReceivePaymentRequirement
  include DataMagic

  def initialize
    DataMagic.load 'receive_payment.yml'
  end

  def load_payment_details(key)
    data_for "receive_payment/#{key}"
  end
end
