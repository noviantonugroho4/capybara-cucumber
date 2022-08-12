class ProductsRequirement
  include DataMagic

  def initialize
    DataMagic.load 'products.yml'
  end

  def load_product_details(key)
    data_for "products/#{key}"
  end
end
