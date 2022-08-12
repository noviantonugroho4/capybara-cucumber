module Android
  # rubocop:disable Metrics/ClassLength
  class PurchaseInvoiceFormScreen < Appom::Page
    section :common_screen, CommonScreen, 'id', 'android:id/content'
    element :txt_new_invoice_title, :id, 'tvToolbarTile'
    element :btn_create_purchase_invoice, :id, 'tvCreate'
    element :btn_select_vendor, :id, 'clSelectCustomer'
    element :input_transaction_no, :id, 'edtTransactionNo'
    element :input_transaction_date, :id, 'tvTransactionDate'
    element :input_due_date, :id, 'tvExpiryDate'
    element :input_term, :id, 'tvTerm'
    element :btn_select_warehouse, :id, 'tvWareHouse'
    element :btn_select_product, :id, 'lnSelectProduct'
    element :btn_edit_product, :id, 'tvEditProduct'
    element :btn_select_another_product, :id, 'flAddAnotherProduct'
    element :btn_delete_product, :id, 'ivDelete'
    element :popup_delete_product, :xpath, "//android.widget.Button[@text='REMOVE']"
    element :list_existing_product, :id, 'rv_select_product'
    elements :list_item_existing_product, :xpath, '//android.widget.TextView[@resource-id="id.jurnal.mobile:id/tv_name_product"]'
    element :input_product_name, :id, 'search_src_text'
    element :btn_create_new_product, :id, 'tv_product_on_demand'
    element :input_unit_price, :id, 'edtUnitPrice'
    element :toggle_buy_price, :id, 's_create_product_buy'
    element :toggle_sell_price, :id, 's_create_product_sell'
    element :input_buy_price, :id, 'tiet_create_product_buy_price'
    element :input_sell_price, :id, 'tiet_create_product_sell_price'
    element :btn_confirm_create_new_product, :id, 'btn_create'
    element :btn_confirm_select_product, :id, 'tvSave'
    element :popup_select_product, :id, 'lnToolbar'
    element :popup_vendor_list, :id, 'srl_person_list'
    element :input_search_vendor, :id, 'search_src_text'
    element :list_existing_vendor, :id, 'rv_person_list'
    elements :list_item_existing_vendor, :xpath, '//android.widget.TextView[@resource-id="id.jurnal.mobile:id/tv_person_list_name"]'
    element :btn_create_new_vendor, :id, 'tv_person_on_demand'
    element :btn_confirm_create_new_vendor, :id, 'btn_create'
    element :popup_select_vendor, :id, 'lnPreviewCustomerBottomSheet'
    element :btn_confirm_vendor, :id, 'tvSelect'
    element :popup_select_term, :id, 'lnTermBottomSheet'
    elements :list_term, :xpath, '//android.widget.TextView[@resource-id="id.jurnal.mobile:id/tvTermName"]'
    element :popup_create_purchase_invoice, :id, 'design_bottom_sheet'
    element :btn_create_and_new, :id, 'tvCreateAndNew'
    element :btn_create_and_send, :id, 'tvCreateAndSend'
    element :btn_confirm_create_invoice, :id, 'tvCreate'
    element :progress_bar_search, :id, 'pb_search_person'
    element :btn_add_other_field, :id, 'tvAddOtherField'
    element :popup_select_other_field, :id, 'lnTermBottomSheet'
    element :btn_select_discount, :id, 'lnDiscount'
    element :input_discount_amount, :id, 'edtAmount'
    element :btn_delete_discount, :id, 'ivDelete'
    element :edit_discount, :xpath, "//android.widget.TextView[@resource-id='id.jurnal.mobile:id/tvDiscountValue']/preceding-sibling::android.widget.TextView"
    element :btn_select_discount_type, :id, 'spDiscountType'
    element :list_discount_type, :xpath, '//android.widget.FrameLayout/android.widget.ListView'
    element :btn_confirm_add_discount, :id, 'tvAdd'
    element :btn_select_deposit, :id, 'lnDeposit'
    element :input_deposit_amount, :id, 'edtAmount'
    element :txt_deposit_value, :id, 'tvDepositValue'
    element :btn_confirm_add_deposit, :id, 'tvAdd'
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
    element :upload_product_image, :id, 'iv_upload_image'
    element :input_account_receivable_vendor, :id, 'tv_create_contact_ar'

    def fill_invoice_form(invoice_details, is_edit = false, is_create_new = false)
      select_vendor(invoice_details[:vendor_name]) if invoice_details[:vendor_name].present?
      select_term(invoice_details[:term]) if invoice_details[:term].present?
      select_datepicker(input_transaction_date, invoice_details[:transaction_date]) if invoice_details[:transaction_date].present?
      select_datepicker(input_due_date, invoice_details[:due_date]) if invoice_details[:due_date].present?
      swipe(input_term.location[:x], input_term.location[:y], btn_select_vendor.location[:x], btn_select_vendor.location[:y])
      select_product(invoice_details[:product_details], is_edit) if invoice_details[:product_details].present?
      add_discount(invoice_details[:discount_details]) if invoice_details[:discount_details].present?
      add_shipping(invoice_details[:shipping_details]) if invoice_details[:shipping_details].present?
      add_message_or_memo(invoice_details) if invoice_details[:message].present? || invoice_details[:memo].present?
      select_warehouse(invoice_details[:warehouse_name]) if invoice_details[:warehouse_name].present?
      wait_for { has_btn_create_purchase_invoice? }
      btn_create_purchase_invoice.click
      # rubocop:disable Style/GuardClause
      # rubocop:disable Lint/UselessAssignment
      unless is_edit
        wait_for { btn_confirm_create_invoice.displayed? }
        if is_create_new
          btn_create_and_new.click
        else
          btn_confirm_create_invoice.click
        end
      end
    end

    def fill_invoice_form_with_deposit(invoice_details_with_deposit)
      select_vendor(invoice_details_with_deposit[:vendor_name]) if invoice_details_with_deposit[:vendor_name].present?
      select_product(invoice_details_with_deposit[:product_details], is_edit = false) if invoice_details_with_deposit[:product_details].present?
      add_deposit(invoice_details_with_deposit[:deposit]) if invoice_details_with_deposit[:deposit].present?
      wait_for { has_btn_create_purchase_invoice? }
      btn_create_purchase_invoice.click
      wait_for { btn_confirm_create_invoice.displayed? }
      btn_confirm_create_invoice.click
    end

    # rubocop:enable Lint/UselessAssignment
    # rubocop:enable Style/GuardClause
    def select_vendor(vendor_name)
      btn_select_vendor.click
      wait_for { input_search_vendor.displayed? }
      input_search_vendor.send_keys vendor_name
      $driver.press_keycode(66) # this is to simulate press enter key on keyboard
      wait_for { has_no_progress_bar_search? }

      if has_no_list_existing_vendor?
        btn_create_new_vendor.click
        sleep 3
        wait_for { btn_confirm_create_new_vendor.displayed? }
        btn_confirm_create_new_vendor.click
      else
        wait_for { has_list_item_existing_vendor? }
        list_item_existing_vendor.select { |cust| cust.text == vendor_name }.first.click
        wait_for { popup_select_vendor.displayed? }
        btn_confirm_vendor.click
      end
      wait_for { btn_create_purchase_invoice.displayed? }
    end

    def select_term(term)
      input_term.click
      wait_for { popup_select_term.displayed? }
      $driver.find_element(:xpath, "//android.widget.TextView[@resource-id='id.jurnal.mobile:id/tvTermName'][@text='#{term}']").click
      $driver.press_keycode(4) if has_popup_select_term? # tap back button to dismiss the popup if it's not automatically closed
    end

    def select_product(product_details, is_edit)
      if is_edit
        btn_edit_product.click
        wait_for { popup_select_product.displayed? }
        btn_delete_product.click
        wait_for { popup_delete_product.displayed? }
        popup_delete_product.click
        btn_select_another_product.click
      else
        btn_select_product.click
      end
      wait_for { list_existing_product.displayed? }
      input_product_name.send_keys product_details[:product_name]
      wait_for { common_screen.has_no_progress_bar_loading? }

      if has_no_list_existing_product?
        btn_create_new_product.click
        wait_for { upload_product_image.displayed? }
        if product_details[:product_buy_price].present?
          toggle_buy_price.click if has_no_input_buy_price?
          wait_for { input_buy_price.displayed? }
          input_buy_price.send_keys product_details[:product_buy_price]
        end
        if product_details[:product_sell_price].present?
          wait_for { input_buy_price.displayed? }
          swipe(input_buy_price.location[:x], input_buy_price.location[:y], input_buy_price.location[:x], input_buy_price.location[:y] - 600)
          sleep 2
          toggle_sell_price.click if has_no_input_sell_price?
          swipe(input_sell_price.location[:x], input_sell_price.location[:y], input_sell_price.location[:x], input_sell_price.location[:y] - 600)
          wait_for { input_sell_price.displayed? }
          input_sell_price.send_keys product_details[:product_sell_price]
        end
        wait_for { btn_confirm_create_new_product.displayed? }
        btn_confirm_create_new_product.click
      else
        list_item_existing_product.select { |prod| prod.text == product_details[:product_name] }.first.click
        sleep 2
        input_unit_price.click
        input_unit_price.clear
        input_unit_price.send_keys product_details[:unit_price]
      end
      wait_for { btn_confirm_select_product.displayed? }
      btn_confirm_select_product.click
    end

    def select_warehouse(_warehouse_name)
      # TODO: handle input warehouse
    end

    def add_discount(discount_details)
      if discount_details.eql? 'false'
        edit_discount.click
        wait_for { input_discount_amount.displayed? }
        btn_delete_discount.click
        wait_for { has_no_input_discount_amount? }
      else
        btn_add_other_field.click
        wait_for { popup_select_other_field.displayed? }
        btn_select_discount.click
        wait_for { input_discount_amount.displayed? }
        btn_select_discount_type.click
        wait_for { list_discount_type.displayed? }
        $driver.find_element(:xpath, "//android.widget.FrameLayout/android.widget.ListView/android.widget.TextView[@text='#{discount_details[:discount_using]}']").click
        input_discount_amount.send_keys discount_details[:discount_amount]
        btn_confirm_add_discount.click
      end
    end

    def add_shipping(shipping_details)
      swipe(50, $driver.window_size[:height] - 100, 50, 200)
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
      swipe(50, $driver.window_size[:height] - 100, 50, 200)
      wait_for { btn_add_other_info.displayed? }
      btn_add_other_info.click
      wait_for { input_message.displayed? }
      swipe(50, input_message.location[:y], 50, 150)
      wait_for { input_memo.displayed? }
      input_message.send_keys quote_details[:message] if quote_details[:message].present?
      input_memo.send_keys quote_details[:memo] if quote_details[:memo].present?
      btn_confirm_select_product.click
    end

    def add_deposit(deposit_details)
      btn_add_other_field.click
      wait_for { popup_select_other_field.displayed? }
      btn_select_deposit.click
      wait_for { input_deposit_amount.displayed? }
      input_deposit_amount.send_keys deposit_details[:deposit_amount]
      btn_confirm_add_deposit.click
    end

    def update_deposit(purchase_invoice_edit_deposit)
      txt_deposit_value.click
      wait_for { input_deposit_amount.displayed? }
      input_deposit_amount.clear
      input_deposit_amount.send_keys purchase_invoice_edit_deposit[:deposit][:deposit_amount]
      btn_confirm_add_deposit.click
    end
  end
  # rubocop:enable Metrics/ClassLength
end
