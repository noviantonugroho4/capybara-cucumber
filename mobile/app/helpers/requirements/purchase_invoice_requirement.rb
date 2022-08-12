class PurchaseInvoiceRequirement
  include DataMagic

  def initialize
    DataMagic.load 'purchase_invoice.yml'
  end

  def load_purchase_invoice_details(key)
    data_for "purchase_invoice/#{key}"
  end
end
