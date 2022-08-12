module Android
  class SalesInvoiceFormScreen < Appom::Page
    element :txt_new_invoice_title, :id, 'tvToolbarTile'
    element :btn_create_sales_invoice, :id, 'tvCreate'
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
    element :btn_confirm_create_new_product, :id, 'btn_create'
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
    element :popup_create_sales_invoice, :id, 'design_bottom_sheet'
    element :btn_create_and_new, :id, 'tvCreateAndNew'
    element :btn_create_and_send, :id, 'tvCreateAndSend'
    element :btn_confirm_create_invoice, :id, 'tvCreate'
    element :input_product_unit_price, :id, 'edtUnitPrice'

    def fill_invoice_form(invoice_details)
      select_customer(invoice_details[:customer_name]) if invoice_details[:customer_name].present?
      select_term(invoice_details[:term]) if invoice_details[:term].present?
      select_datepicker(input_transaction_date, invoice_details[:transaction_date]) if invoice_details[:transaction_date].present?
      select_datepicker(input_due_date, invoice_details[:due_date]) if invoice_details[:due_date].present?
      select_product(invoice_details[:product_details]) if invoice_details[:product_details].present?
      select_warehouse(invoice_details[:warehouse_name]) if invoice_details[:warehouse_name].present?
      btn_create_sales_invoice.click
      wait_for { popup_create_sales_invoice.displayed? }
      btn_confirm_create_invoice.click
    end

    def select_customer(customer_name)
      btn_select_customer.click
      wait_for { input_search_customer.displayed? }
      input_search_customer.send_keys customer_name
      $driver.press_keycode(66) # this is to simulate press enter key on keyboard
      sleep 2
      if has_no_list_existing_customer?
        btn_create_new_customer.click
        btn_confirm_create_new_customer.click
        wait_for { btn_create_sales_invoice.displayed? }
      else
        list_item_existing_customer.select { |cust| cust.text == customer_name }.first.click
        wait_for { popup_select_customer.displayed? }
        btn_confirm_customer.click
      end
    end

    def select_term(term)
      input_term.click
      wait_for { popup_select_term.displayed? }
      $driver.find_element(:xpath, "//android.widget.TextView[@resource-id='id.jurnal.mobile:id/tvTermName'][@text='#{term}']")
      $driver.press_keycode(4) if has_popup_select_term? # tap back button to dismiss the popup if it's not automatically closed
    end

    def select_product(product_details)
      btn_select_product.click
      wait_for { list_existing_product.displayed? }
      input_product_name.send_keys product_details[:product_name]
      $driver.press_keycode(66) # this is to simulate press enter key on keyboard
      sleep 2
      if has_no_list_existing_product?
        btn_create_new_product.click
        if product_details[:product_buy_price].present?
          toggle_buy_price.click
          input_buy_price.send_keys product_details[:product_buy_price]
        end
        swipe(toggle_buy_price.location[:x], toggle_buy_price.location[:y], toggle_buy_price.location[:x], toggle_buy_price.location[:y] - 500)
        input_sell_price.send_keys product_details[:product_sell_price] if product_details[:product_sell_price].present?
        btn_confirm_create_new_product.click
      else
        list_item_existing_product.select { |prod| prod.text == product_details[:product_name] }.first.click
        wait_for { popup_select_product.displayed? }
        wait_for { input_product_unit_price.displayed? && !input_product_unit_price.text.nil? }
        input_product_unit_price.click
        $driver.press_keycode(67)
        input_product_unit_price.send_keys product_details[:unit_price] if product_details[:unit_price].present?
      end
      wait_for { btn_confirm_select_product.displayed? }
      btn_confirm_select_product.click
    end

    def select_warehouse(_warehouse_name)
      # TODO: handle input warehouse
    end
  end
end
