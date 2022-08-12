module Android
  class ProductDetailScreen < Appom::Page
    section :common_screen, CommonScreen, :id, 'android:id/content'
    element :details_tab, :accessibility_id, 'DETAILS'
    element :product_name, :id, 'name_product'
    element :product_code, :id, 'code_products'
    element :product_unit, :id, 'unit_products'
    element :product_desc, :id, 'tv_description_products'
    element :btn_back, :accessibility_id, '‎‏‎‎‎‎‎‏‎‏‏‏‎‎‎‎‎‎‏‎‎‏‎‎‎‎‏‏‏‏‏‏‏‏‏‏‎‏‎‎‎‏‏‎‏‎‎‎‏‏‎‎‎‏‏‏‏‎‏‎‎‎‎‏‏‎‏‏‎‏‎‎‏‎‎‏‎‎‎‎‎‎‏‎‏‎‎‎‎‏‏‏‎‎‎‎‎Navigate up‎‏‎‎‏‎'
    element :btn_more, :xpath, "//android.view.ViewGroup[@resource-id='id.jurnal.mobile:id/toolbar_product_detail']/androidx.appcompat.widget.LinearLayoutCompat/android.widget.ImageView[@content-desc='More options']"
    elements :btn_edit, :id, 'content'
    element :buying_price, :id, 'tv_buying_prices'
    element :selling_price, :id, 'tv_selling_price'

    def verify_details_product(details)
      wait_for { product_name.displayed? && !product_name.text.nil? }
      aggregate_failures('verifying product details') do
        expect(product_name.text).to eql details[:name]
        expect(product_code.text).to eql details[:code]
        expect(product_unit.text).to eql details[:unit]
        expect(product_desc.text).to eql details[:description]
        expect(convert_to_string(buying_price.text)).to eql 'Rp  ' + convert_to_string(details[:buy_price]) if has_buying_price?
        expect(convert_to_string(selling_price.text)).to eql 'Rp  ' + convert_to_string(details[:sell_price]) if has_selling_price?
      end
    end

    def convert_to_string(price)
      price = price.to_s
      price = price.delete('.')
      price = price.gsub(',00', '')
      price
    end
  end
end
