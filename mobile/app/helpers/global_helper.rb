module GlobalHelper
  def parse_currency(currency_string)
    currency_string.gsub(/[^\d\,]/, '').to_i
  end
end
