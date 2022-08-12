class SendPaymentRequirement
  include DataMagic

  def initialize
    DataMagic.load 'send_payment.yml'
  end

  def load_payment_details(key)
    data_for "send_payment/#{key}"
  end
end
