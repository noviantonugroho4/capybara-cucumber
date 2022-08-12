module Android
  class SettingTransactionScreen < Appom::Page
    section :common_screen, CommonScreen, :id, 'android:id/content'
    element :btn_save, :id, 'btn_save_transaction'
    element :dd_invoice_term, :id, 'tiet_options_transaction_sales_term'
    element :dd_sales_shipping_fee_account, :id, 'tiet_options_transaction_sales_shipping'
    element :input_sales_message, :id, 'tiet_options_transaction_sales_message'
    element :input_delivery_message, :id, 'tiet_options_transaction_sales_slip'
    element :cb_sales_shipping_info, :id, 'cb_option_transaction_sales_shipping'
    element :cb_sales_discount_perlines, :id, 'cb_option_transaction_sales_per_line'
    element :cb_sales_discount, :id, 'cb_option_transaction_sales_discount'
    element :cb_sales_deposit, :id, 'cb_option_transaction_sales_deposit'
    element :cb_sales_not_sell_insufficient, :id, 'cb_option_transaction_sales_quantity'
    element :dd_purchase_term, :id, 'tiet_options_transaction_purchase_term'
    element :dd_purchase_shipping_fee_account, :id, 'tiet_options_transaction_purchase_shipping'
    element :input_po_message, :id, 'tiet_options_transaction_purchase_message'
    element :cb_purchase_shipping_info, :id, 'cb_option_transaction_purchase_shipping'
    element :cb_purchase_discount_perlines, :id, 'cb_option_transaction_purchase_per_line'
    element :cb_purchase_discount, :id, 'cb_option_transaction_purchase_discount'
    element :cb_purchase_deposit, :id, 'cb_option_transaction_purchase_deposit'

    def filling_setting_details(details)
      btn_save.click
      expect(common_screen.has_no_progress_bar_loading?).to be true
      # sales
      select_dropdown dd_invoice_term, details['sales']['term']
      input_sales_message.send_keys details['sales']['def_sales_msg']
      input_delivery_message.send_keys details['sales']['def_delivery_slip_msg']
      cb_sales_shipping_info.click if !details['sales']['cb']['ship_info'].nil? && (cb_sales_shipping_info['checked'] != details['sales']['cb']['ship_info'])
      cb_sales_discount_perlines.click if !details['sales']['cb']['disc_per_line'].nil? && (cb_sales_discount_perlines['checked'] != details['sales']['cb']['disc_per_line'])
      cb_sales_discount.click if !details['sales']['cb']['disc'].nil? && (cb_sales_discount['checked'] != details['sales']['cb']['disc'])
      cb_sales_deposit.click if !details['sales']['cb']['deposit'].nil? && (cb_sales_deposit['checked'] != details['sales']['cb']['deposit'])
      swipe_until_find('up', cb_purchase_deposit_params)
      # purchase
      select_dropdown dd_purchase_term, details['purchase']['term']
      input_po_message.send_keys details['purchase']['def_po_msg']
      cb_purchase_shipping_info.click if !details['purchase']['cb']['ship_info'].nil? && (cb_purchase_shipping_info['checked'] != details['purchase']['cb']['ship_info'])
      cb_purchase_discount_perlines.click if !details['purchase']['cb']['disc_per_line'].nil? && (cb_purchase_discount_perlines['checked'] != details['purchase']['cb']['disc_per_line'])
      cb_purchase_discount.click if !details['purchase']['cb']['disc'].nil? && (cb_purchase_discount['checked'] != details['purchase']['cb']['disc'])
      cb_purchase_deposit.click if !details['purchase']['cb']['deposit'].nil? && (cb_purchase_deposit['checked'] != details['purchase']['cb']['deposit'])
      btn_save.click
    end

    def verify_setting_transaction_details(details)
      aggregate_failures('Verifying setting transaction details') do
        expect(dd_invoice_term.text).to eq details['sales']['term']
        expect(input_sales_message.text).to eq details['sales']['def_sales_msg']
        expect(input_delivery_message.text).to eq details['sales']['def_delivery_slip_msg']
        expect(cb_sales_shipping_info['checked']).to eq details['sales']['cb']['ship_info'] unless details['sales']['cb']['ship_info'].nil?
        expect(cb_sales_discount_perlines['checked']).to eq details['sales']['cb']['disc_per_line'] unless details['sales']['cb']['disc_per_line'].nil?
        expect(cb_sales_discount['checked']).to eq details['sales']['cb']['disc'] unless details['sales']['cb']['disc'].nil?
        expect(cb_sales_deposit['checked']).to eq details['sales']['cb']['deposit'] unless details['sales']['cb']['deposit'].nil?
        swipe_until_find('up', cb_purchase_deposit_params)
        expect(dd_purchase_term.text).to eq details['purchase']['term']
        expect(input_po_message.text).to eq details['purchase']['def_po_msg']
        expect(cb_purchase_shipping_info['checked']).to eq details['purchase']['cb']['ship_info'] unless details['purchase']['cb']['ship_info'].nil?
        expect(cb_purchase_discount_perlines['checked']).to eq details['purchase']['cb']['disc_per_line'] unless details['purchase']['cb']['disc_per_line'].nil?
        expect(cb_purchase_discount['checked']).to eq details['purchase']['cb']['disc'] unless details['purchase']['cb']['disc'].nil?
        expect(cb_purchase_deposit['checked']).to eq details['purchase']['cb']['deposit'] unless details['purchase']['cb']['deposit'].nil?
      end
    end
  end
end
