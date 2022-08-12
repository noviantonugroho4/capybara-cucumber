class SalesQuoteRequirement
  include DataMagic

  def initialize
    DataMagic.load 'sales_quote.yml'
  end

  def load_sales_quote_details(key)
    data_for "sales_quote/#{key}"
  end
end
