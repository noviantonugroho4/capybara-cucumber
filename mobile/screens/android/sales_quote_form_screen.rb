module Android
  class SalesQuoteFormScreen < Appom::Page
    element :txt_new_quote_title, :id, 'tvToolbarTile'
    element :btn_create_sales_quote, :id, 'tvCreate'
    element :btn_select_customer, :id, 'clSelectCustomer'
    element :input_transaction_no, :id, 'edtTransactionNo'
    element :input_transaction_date, :id, 'tvTransactionDate'
    element :input_due_date, :id, 'tvExpiryDate'
    element :input_term, :id, 'tvTerm'
    element :btn_select_warehouse, :id, 'tvWareHouse'
    element :btn_select_product, :id, 'lnSelectProduct'
    element :list_existing_product, :id, 'rv_select_product'
    elements :list_item_existing_product, :xpath, '//android.widget.TextView[@resource-id="id.jurnal.mobile:id/tv_name_product"]'
    element :input_product_name, :id, 'search_src_text'
    element :btn_create_new_product, :id, 'tv_product_on_demand'
    element :toggle_buy_price, :id, 's_create_product_buy'
    element :input_buy_price, :id, 'tiet_create_product_buy_price'
    element :input_sell_price, :id, 'tiet_create_product_sell_price'
    element :btn_confirm_create_new_product, :id, 'btn_create_product'
    element :btn_confirm_select_product, :id, 'tvSave'
    element :popup_select_product, :id, 'lnToolbar'
    element :popup_customer_list, :id, 'srl_person_list'
    element :input_search_customer, :id, 'search_src_text'
    element :list_existing_customer, :id, 'rv_person_list'
    elements :list_item_existing_customer, :xpath, '//android.widget.TextView[@resource-id="id.jurnal.mobile:id/tv_person_list_name"]'
    element :btn_create_new_customer, :id, 'tv_person_on_demand'
    element :btn_confirm_create_new_customer, :id, 'btn_create'
    element :popup_select_customer, :id, 'lnPreviewCustomerBottomSheet'
    element :btn_confirm_customer, :id, 'tvSelect'
    element :popup_select_term, :id, 'rvSelectTerm'
    elements :list_term, :xpath, '//android.widget.TextView[@resource-id="id.jurnal.mobile:id/tvTermName"]'
    element :popup_create_sales_quote, :id, 'design_bottom_sheet'
    element :btn_create_and_new, :id, 'tvCreateAndNew'
    element :btn_create_and_send, :id, 'tvCreateAndSend'
    element :btn_confirm_create_quote, :id, 'tvCreate'
    element :btn_select_tax, :id, 'tvTax'
    element :popup_select_tax, :id, 'tvSelectTaxTitle'
    element :input_product_unit_price, :id, 'edtUnitPrice'
    element :btn_add_other_field, :id, 'tvAddOtherField'
    element :input_discount_amount, :id, 'edtAmount'
    element :btn_select_discount_type, :id, 'spDiscountType'
    element :list_discount_type, :xpath, '//android.widget.FrameLayout/android.widget.ListView'
    element :btn_confirm_add_discount, :id, 'tvAdd'
    element :btn_add_other_info, :id, 'tvAddOtherInfo'
    element :toggle_shipping_info, :id, 'swAddShippingInfo'
    element :input_shipping_address, :id, 'edtShippingAddress'
    element :input_shipping_date, :id, 'tvShippingDate'
    element :input_shipping_fee, :id, 'edtShippingFee'
    element :input_shipping_via, :id, 'edtShippingVia'
    element :input_shipping_tracking_no, :id, 'edtTrackingNo'
    element :input_product_code, :id, 'et_create_product_code'
    element :btn_select_product_unit, :id, 'tv_create_product_unit'
    element :txt_select_unit, :xpath, "//android.widget.TextView[@text='Select Unit']"
    element :input_product_description, :id, 'et_create_product_description'
    element :input_message, :id, 'edtMessage'
    element :input_memo, :id, 'edtMemo'
    element :progress_bar_search, :id, 'pb_search_person'

    def fill_quote_form(quote_details)
      input_transaction_no.send_keys quote_details[:transaction_no] if quote_details[:transaction_no].present?
      select_customer(quote_details[:customer_name]) if quote_details[:customer_name].present?
      select_term(quote_details[:term]) if quote_details[:term].present?
      select_datepicker(input_transaction_date, quote_details[:transaction_date]) if quote_details[:transaction_date].present?
      select_datepicker(input_due_date, quote_details[:expiry_date]) if quote_details[:expiry_date].present?
      select_product(quote_details[:product_details]) if quote_details[:product_details].present?
      add_discount(quote_details[:discount_details]) if quote_details[:discount_details].present?
      # add_shipping(quote_details[:shipping_details]) if quote_details[:shipping_details].present?
      add_message_or_memo(quote_details) if quote_details[:message].present? || quote_details[:memo].present?
      select_warehouse(quote_details[:warehouse_name]) if quote_details[:warehouse_name].present?
      btn_create_sales_quote.click
      wait_for { popup_create_sales_quote.displayed? }
      btn_confirm_create_quote.click
      sleep 5
    end

    def select_customer(customer_name)
      btn_select_customer.click
      wait_for { input_search_customer.displayed? }
      input_search_customer.send_keys customer_name
      $driver.press_keycode(66) # this is to simulate press enter key on keyboard
      wait_for { has_no_progress_bar_search? }
      sleep 2

      if has_no_list_existing_customer?
        btn_create_new_customer.click
        btn_confirm_create_new_customer.click
        wait_for { btn_create_sales_quote.displayed? }
      else
        list_item_existing_customer.select { |cust| cust.text == customer_name }.first.click
        wait_for { popup_select_customer.displayed? }
        btn_confirm_customer.click
      end
    end

    def select_term(term)
      input_term.click
      wait_for { popup_select_term.displayed? }
      $driver.find_element(:xpath, "//android.widget.TextView[@resource-id='id.jurnal.mobile:id/tvTermName'][@text='#{term}']").click
      $driver.press_keycode(4) if has_popup_select_term? # tap back button to dismiss the popup if it's not automatically closed
    end

    def select_product(product_details)
      btn_select_product.click
      wait_for { list_existing_product.displayed? }
      input_product_name.send_keys product_details[:product_name]
      $driver.press_keycode(66) # this is to simulate press enter key on keyboard
      wait_for { has_no_progress_bar_search? }
      sleep 2

      if has_no_list_existing_product?
        btn_create_new_product.click
        input_product_code.send_keys product_details[:product_code]
        if product_details[:product_unit].present?
          btn_select_product_unit.click
          wait_for { txt_select_unit.displayed? }
          input_product_name.send_keys product_details[:product_unit]
          $driver.find_element(:xpath, "//android.widget.TextView[@resource-id='id.jurnal.mobile:id/tv_unit_name'][@text='#{product_details[:product_unit]}']").click
        end
        input_product_description.send_keys product_details[:product_description]
        if product_details[:product_buy_price].present?
          toggle_buy_price.click
          tiet_create_product_buy_price.send_keys product_details[:product_buy_price]
        end
        input_sell_price.send_keys product_details[:product_sell_price] if product_details[:product_sell_price].present?
        btn_confirm_create_new_customer.click
      else
        list_item_existing_product.select { |prod| prod.text == product_details[:product_name] }.first.click
        wait_for { popup_select_product.displayed? }
        wait_for { input_product_unit_price.displayed? && !input_product_unit_price.text.nil? }
        input_product_unit_price.click
        $driver.press_keycode(67)
        input_product_unit_price.send_keys product_details[:unit_price] if product_details[:unit_price].present?
        if product_details[:tax].present?
          btn_select_tax.click
          wait_for { popup_select_tax.displayed? }
          $driver.find_element(:xpath, "//androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup/android.widget.TextView[@text='#{product_details[:tax]}']").click
        end
      end
      wait_for { btn_confirm_select_product.displayed? }
      btn_confirm_select_product.click
    end

    def select_warehouse(_warehouse_name)
      # TODO: handle input warehouse
    end

    def add_discount(discount_details)
      btn_add_other_field.click
      wait_for { input_discount_amount.displayed? }
      btn_select_discount_type.click
      wait_for { list_discount_type.displayed? }
      $driver.find_element(:xpath, "//android.widget.FrameLayout/android.widget.ListView/android.widget.TextView[@text='#{discount_details[:discount_using]}']").click
      input_discount_amount.send_keys discount_details[:discount_amount]
      btn_confirm_add_discount.click
    end

    def add_shipping(shipping_details)
      swipe(50, btn_select_product.location[:y], 50, btn_select_customer.location[:y])
      wait_for { btn_add_other_info.displayed? }
      btn_add_other_info.click
      toggle_shipping_info.click
      input_shipping_address.send_keys shipping_details[:shipping_address]
      select_datepicker(input_shipping_date, shipping_details[:shipping_date])
      input_shipping_fee.send_keys shipping_details[:shipping_fee]
      input_shipping_via.send_keys shipping_details[:shipping_via]
      input_shipping_tracking_no.send_keys shipping_details[:shipping_tracking_no]
      btn_confirm_select_product.click
    end

    def add_message_or_memo(quote_details)
      swipe(50, btn_select_product.location[:y], 50, btn_select_customer.location[:y])
      wait_for { btn_add_other_info.displayed? }
      btn_add_other_info.click
      wait_for { input_message.displayed? }
      swipe(50, input_message.location[:y], 50, 150)
      wait_for { input_memo.displayed? }
      input_message.send_keys quote_details[:message] if quote_details[:message].present?
      input_memo.send_keys quote_details[:memo] if quote_details[:memo].present?
      btn_confirm_select_product.click
    end
  end
end
