class SalesOrderRequirement
  include DataMagic

  def initialize
    DataMagic.load 'sales_order.yml'
  end

  def load_sales_order_details(key)
    data_for "sales_order/#{key}"
  end
end
