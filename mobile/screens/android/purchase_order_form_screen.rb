module Android
  class PurchaseOrderFormScreen < Appom::Page
    element :txt_new_order_title, :id, 'tvToolbarTile'
    element :btn_create_purchase_order, :id, 'tvCreate'
    element :btn_select_vendor, :id, 'clSelectCustomer'
    element :input_transaction_no, :id, 'edtTransactionNo'
    element :input_transaction_date, :id, 'tvTransactionDate'
    element :input_due_date, :id, 'tvExpiryDate'
    element :input_term, :id, 'tvTerm'
    element :btn_select_warehouse, :id, 'tvWareHouse'
    element :btn_select_product, :id, 'lnSelectProduct'
    element :list_existing_product, :id, 'rv_select_product'
    elements :list_item_existing_product, :id, 'tv_name_product'
    element :input_product_name, :id, 'search_src_text'
    element :btn_create_new_product, :id, 'tv_product_on_demand'
    element :toggle_buy_price, :id, 's_dummy_create_product_buy'
    element :toggle_sell_price, :id, 's_create_product_sell'
    element :input_buy_price, :id, 'tiet_create_product_buy_price'
    element :input_sell_price, :id, 'tiet_create_product_sell_price'
    element :btn_confirm_create_new_product, :id, 'btn_create'
    element :btn_confirm_select_product, :id, 'tvSave'
    element :popup_select_product, :xpath, "//android.widget.TextView[@text='Select Product']"
    element :popup_vendor_list, :id, 'srl_person_list'
    element :input_search_vendor, :id, 'search_src_text'
    element :list_existing_vendor, :id, 'rv_person_list'
    elements :list_item_existing_vendor, :id, 'tv_person_list_name'
    element :btn_create_new_vendor, :id, 'tv_person_on_demand'
    element :btn_confirm_create_new_vendor, :id, 'btn_create'
    element :popup_select_vendor, :id, 'lnPreviewCustomerBottomSheet'
    element :btn_confirm_vendor, :id, 'tvSelect'
    element :popup_select_term, :id, 'lnTermBottomSheet'
    elements :list_term, :id, 'tvTermName'
    element :popup_create_purchase_order, :id, 'design_bottom_sheet'
    element :btn_create_and_new, :id, 'tvCreateAndNew'
    element :btn_create_and_send, :id, 'tvCreateAndSend'
    element :btn_confirm_create_order, :id, 'tvCreate'
    element :progress_bar_search, :id, 'pb_search_person'
    element :vendor_ar_value, :id, 'tv_create_contact_ar'
    element :edit_product, :id, 'tvEditProduct'
    element :edit_unit_price, :id, 'edtUnitPrice'
    element :price_unit_form, :id, 'tvProductPrice'
    element :delete_product, :id, 'ivDelete'
    element :product_delete_popup, :id, 'parentPanel'
    element :btn_remove_product_delete_popup, :xpath, '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.appcompat.widget.LinearLayoutCompat/android.widget.ScrollView/android.widget.LinearLayout/android.widget.Button[2]'

    def fill_order_form(order_details)
      select_vendor(order_details[:vendor_name]) if order_details[:vendor_name].present?
      select_term(order_details[:term]) if order_details[:term].present?
      select_datepicker(input_transaction_date, order_details[:transaction_date]) if order_details[:transaction_date].present?
      select_datepicker(input_due_date, order_details[:due_date]) if order_details[:due_date].present?
      swipe(input_term.location[:x], input_term.location[:y], btn_select_vendor.location[:x], btn_select_vendor.location[:y])
      select_product(order_details[:product_details]) if order_details[:product_details].present?
      select_warehouse(order_details[:warehouse_name]) if order_details[:warehouse_name].present?
      wait_for { has_btn_create_purchase_order? }
      btn_create_purchase_order.click
      wait_for { has_popup_create_purchase_order? }
      btn_confirm_create_order.click
    end

    def fill_order_before_edit(order_details)
      select_vendor(order_details[:vendor_name]) if order_details[:vendor_name].present?
      select_term(order_details[:term]) if order_details[:term].present?
      select_datepicker(input_transaction_date, order_details[:transaction_date]) if order_details[:transaction_date].present?
      select_datepicker(input_due_date, order_details[:due_date]) if order_details[:due_date].present?
      swipe(input_term.location[:x], input_term.location[:y], btn_select_vendor.location[:x], btn_select_vendor.location[:y])
      select_product(order_details[:product_details]) if order_details[:product_details].present?
      select_warehouse(order_details[:warehouse_name]) if order_details[:warehouse_name].present?
      # then edit some data like price, delete product, edit deposit and memo
      # edit unit price and delete product
      edit_product.click
      wait_for { edit_unit_price.displayed? }
      edit_unit_price.clear
      edit_unit_price.send_keys '10000'
      btn_confirm_select_product.click
      wait_for { has_btn_create_purchase_order? }
      edit_product.click
      delete_product.click
      btn_remove_product_delete_popup.click if product_delete_popup.displayed?
      btn_confirm_select_product.click
      wait_for { has_btn_create_purchase_order? }
    end

    def select_vendor(vendor_name)
      btn_select_vendor.click
      wait_for { input_search_vendor.displayed? }
      input_search_vendor.send_keys vendor_name
      $driver.press_keycode(66) # this is to simulate press enter key on keyboard
      wait_for { has_no_progress_bar_search? }

      if has_no_list_existing_vendor?
        btn_create_new_vendor.click
        wait_for { btn_confirm_create_new_vendor.displayed? }
        wait_for { vendor_ar_value.displayed? && !vendor_ar_value.text.nil? }
        btn_confirm_create_new_vendor.click
      else
        list_item_existing_vendor.select { |cust| cust.text == vendor_name }.first.click
      end
      btn_confirm_vendor.click
      wait_for { btn_create_purchase_order.displayed? }
    end

    def select_term(term_name)
      input_term.click
      wait_for { popup_select_term.displayed? }
      list_term.select { |term| term.text == term_name }.first.click
      $driver.press_keycode(4) if has_popup_select_term? # tap back button to dismiss the popup if it's not automatically closed
    end

    def select_product(product_details)
      btn_select_product.click
      wait_for { list_existing_product.displayed? }
      input_product_name.send_keys product_details[:product_name]
      $driver.press_keycode(66) # this is to simulate press enter key on keyboard
      sleep 2
      wait_for { has_no_progress_bar_search? }
      if has_no_list_existing_product? && has_btn_create_new_product?
        btn_create_new_product.click
        input_buy_price.send_keys product_details[:product_buy_price] if product_details[:product_buy_price].present?
        if product_details[:product_sell_price].present?
          swipe(input_buy_price.location[:x], input_buy_price.location[:y], input_buy_price.location[:x], input_buy_price.location[:y] - 600)
          toggle_sell_price.click
          input_sell_price.send_keys product_details[:product_sell_price]
          swipe(input_sell_price.location[:x], input_sell_price.location[:y], input_sell_price.location[:x], input_sell_price.location[:y] - 500)
        end
        btn_confirm_create_new_product.click
        wait_for { btn_confirm_select_product.displayed? }
      else
        list_item_existing_product.select { |prod| prod.text == product_details[:product_name] }.first.click
        wait_for { popup_select_product.displayed? }
      end
      btn_confirm_select_product.click
    end

    def select_warehouse(_warehouse_name)
      # TODO: handle input warehouse
    end
  end
end
