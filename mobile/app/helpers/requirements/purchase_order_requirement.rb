class PurchaseOrderRequirement
  include DataMagic

  def initialize
    DataMagic.load 'purchase_order.yml'
  end

  def load_purchase_order_details(key)
    data_for "purchase_order/#{key}"
  end
end
