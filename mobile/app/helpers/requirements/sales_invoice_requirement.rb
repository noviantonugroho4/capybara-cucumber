class SalesInvoiceRequirement
  include DataMagic

  def initialize
    DataMagic.load 'sales_invoice.yml'
  end

  def load_sales_invoice_details(key)
    data_for "sales_invoice/#{key}"
  end
end
