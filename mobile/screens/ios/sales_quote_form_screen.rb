module Ios
  class SalesQuoteFormScreen < Appom::Page
    element :txt_new_quote_title, :xpath, '//XCUIElementTypeStaticText[@name="New Quote"]'
    element :btn_create_sales_quote, :xpath, '//XCUIElementTypeButton[@name="Create"]'
    element :btn_select_customer, :predicate, 'label == "Select customer"'
    element :input_transaction_no, :predicate, 'type == "XCUIElementTypeTextField"'
    element :input_transaction_date, :predicate, 'label == "Transaction date"'
    element :input_due_date, :predicate, 'label == "Expiry date"'
    element :input_term, :predicate, 'label == "Term"'
    element :btn_select_warehouse, :id, 'tvWareHouse'
    element :btn_select_product, :xpath, '//XCUIElementTypeOther[@name="Product"]/following-sibling::XCUIElementTypeCell/XCUIElementTypeButton[last()]'
    element :list_existing_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeTable'
    elements :list_item_existing_product, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText[last()]'
    element :search_product_name, :predicate, 'value == "Search"'
    element :btn_create_new_product, :xpath, '//XCUIElementTypeStaticText[@name="Create new product"]/preceding-sibling::XCUIElementTypeButton'
    element :input_product_name, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeTextField'
    element :toggle_buy_price, :class_chain, '**/XCUIElementTypeSwitch[`label == "I Buy This Item"`]'
    element :input_buy_price, :xpath, '//XCUIElementTypeStaticText[@name="Buy Unit Price"]/following-sibling::XCUIElementTypeTextField'
    element :input_sell_price, :xpath, '//XCUIElementTypeStaticText[@name="Sell Unit Price"]/following-sibling::XCUIElementTypeTextField'
    element :btn_confirm_create_new_product, :class_chain, '**/XCUIElementTypeButton[`label == "Create"`][2]'
    element :btn_confirm_select_product, :xpath, '//XCUIElementTypeButton[@name="Save"]'
    element :popup_customer_list, :id, 'srl_person_list'
    element :search_customer_name, :predicate, 'value == "Search"'
    element :list_existing_customer, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[4]/XCUIElementTypeTable'
    elements :list_item_existing_customer, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[4]/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText'
    element :btn_create_new_customer, :xpath, '//XCUIElementTypeStaticText[@name="Create new customer"]/preceding-sibling::XCUIElementTypeButton'
    element :input_customer_name, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[5]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeTextField'
    element :btn_confirm_create_new_customer, :xpath, '(//XCUIElementTypeButton[@name="Create"])[2]'
    element :popup_select_customer, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[5]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]'
    element :btn_confirm_customer, :xpath, '//XCUIElementTypeButton[@name="Select"]'
    element :popup_select_term, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]'
    elements :list_term, :xpath, '//XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText'
    element :popup_create_sales_quote, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeSheet/XCUIElementTypeOther/XCUIElementTypeOther[1]/XCUIElementTypeOther[2]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther'
    element :btn_create_and_new, :predicate, 'label == "Create and new"'
    element :btn_create_and_send, :predicate, 'label == "Create and send"'
    element :btn_confirm_create_quote, :predicate, 'label == "Create sales quote"'
    element :btn_select_tax, :predicate, 'label == "Select tax"'
    element :popup_select_tax, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]'
    elements :list_existing_tax, :xpath, '//XCUIElementTypeStaticText[@name="Select Tax"]/following-sibling::XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText'
    element :input_product_unit_price, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeTextField[1]'
    element :btn_add_discount, :predicate, 'label == "Discount"'
    element :btn_select_discount_type, :xpath, '//XCUIElementTypeStaticText[@name="Discount Using"]/preceding-sibling::XCUIElementTypeButton'
    element :input_discount_amount, :xpath, '//XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[4]/XCUIElementTypeTextField'
    element :list_discount_type, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[6]/XCUIElementTypeTable'
    element :btn_confirm_add_discount, :xpath, '//XCUIElementTypeButton[@name="Add"]'
    element :btn_add_other_field, :xpath, '//XCUIElementTypeStaticText[@name="Add other field"]'
    element :btn_add_other_info, :xpath, '//XCUIElementTypeOther[@name="Add other info"]'
    element :toggle_shipping_info, :xpath, '//XCUIElementTypeOther[@name="Shipping Info"]/following-sibling::XCUIElementTypeCell/XCUIElementTypeSwitch[2]'
    element :input_shipping_address, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeTextView'
    element :input_shipping_date, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton'
    element :input_shipping_fee, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeTextField[1]'
    element :input_shipping_via, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeTextField[2]'
    element :input_shipping_tracking_no, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeTextField[3]'
    element :input_product_code, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[3]/XCUIElementTypeTextField'
    element :btn_select_product_unit, :predicate, 'label == "Unit"'
    element :txt_select_unit, :predicate, 'label == "Select Unit"'
    element :search_product_unit, :class_chain, '**/XCUIElementTypeTextField[`value == "Search"`][2]'
    element :list_existing_product_unit, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell'
    element :input_product_description, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[4]/XCUIElementTypeTextField'
    element :input_message, :xpath, '//XCUIElementTypeStaticText[@name="Message"]/following-sibling::XCUIElementTypeTextView'
    element :input_memo, :xpath, '//XCUIElementTypeStaticText[@name="Memo"]/following-sibling::XCUIElementTypeTextView'
    element :progress_loading, :predicate, 'label == "In progress"'

    def fill_quote_form(quote_details)
      input_transaction_no.send_keys quote_details[:transaction_no] if quote_details[:transaction_no].present?
      select_customer(quote_details[:customer_name]) if quote_details[:customer_name].present?
      select_term(quote_details[:term]) if quote_details[:term].present?
      select_datepicker(input_transaction_date, quote_details[:transaction_date]) if quote_details[:transaction_date].present?
      select_datepicker(input_due_date, quote_details[:expiry_date]) if quote_details[:expiry_date].present?
      select_product(quote_details[:product_details]) if quote_details[:product_details].present?
      add_discount(quote_details[:discount_details]) if quote_details[:discount_details].present?
      # add_shipping(quote_details[:shipping_details]) if quote_details[:shipping_details].present?
      # shipping not exist in ios
      add_message_or_memo(quote_details) if quote_details[:message].present? || quote_details[:memo].present?
      select_warehouse(quote_details[:warehouse_name]) if quote_details[:warehouse_name].present?
      btn_create_sales_quote.click
      wait_for { popup_create_sales_quote.displayed? }
      btn_confirm_create_quote.click
    end

    def select_customer(customer_name)
      btn_select_customer.click
      wait_for { search_customer_name.displayed? }
      search_customer_name.send_keys customer_name
      wait_for { has_no_progress_loading? }
      if has_no_list_existing_customer?
        btn_create_new_customer.click
        wait_for { btn_confirm_create_new_customer.displayed? }
        input_customer_name.send_keys customer_name
        btn_confirm_create_new_customer.click
        wait_for { btn_create_sales_quote.displayed? }
      else
        sleep 2
        list_item_existing_customer.select { |cust| cust.text == customer_name }.first.click
        if $driver.is_keyboard_shown # sometimes the keyboard can't be hidden, so this is the workaround
          $driver.execute_script 'mobile: tap', x: $driver.window_size['width'] / 2, y: $driver.window_size['height'] / 2
          list_item_existing_customer.select { |cust| cust.text == customer_name }.first.click
        end
        wait_for { popup_select_customer.displayed? }
        btn_confirm_customer.click
      end
    end

    def select_term(term)
      input_term.click
      wait_for { popup_select_term.displayed? }
      $driver.find_element(:xpath, "//XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText[@name=\"#{term}\"]").click
      wait_for { has_no_popup_select_term? }
    end

    def select_product(product_details)
      btn_select_product.click
      wait_for { list_existing_product.displayed? }
      search_product_name.send_keys product_details[:product_name]

      if has_no_list_existing_product?
        btn_create_new_product.click
        input_product_name.send_keys product_details[:product_name]
        input_product_code.send_keys product_details[:product_code]
        input_product_description.send_keys product_details[:product_description]
        if product_details[:product_unit].present?
          btn_select_product_unit.click
          wait_for { txt_select_unit.displayed? }
          search_product_unit.send_keys product_details[:product_unit]
          $driver.find_element(:xpath, "//XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText[@name='#{product_details[:product_unit]}']").click
          wait_for { btn_confirm_create_new_customer.displayed? }
        end
        if product_details[:product_buy_price].present?
          toggle_buy_price.click
          input_buy_price.send_keys product_details[:product_buy_price]
        end
        input_sell_price.send_keys product_details[:product_sell_price] if product_details[:product_sell_price].present?
        btn_confirm_create_new_customer.click
      else
        sleep 2
        list_item_existing_product.select { |prod| prod.text == product_details[:product_name] }.first.click
        wait_for { btn_confirm_select_product.displayed? }
        input_product_unit_price.send_keys product_details[:unit_price] if product_details[:unit_price].present?
        if product_details[:tax].present?
          btn_select_tax.click
          wait_for { !get_all_list_existing_tax.empty? }
          $driver.find_element(:xpath, "//XCUIElementTypeStaticText[@name='Select Tax']/following-sibling::XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText[contains(@name,'#{product_details[:tax]}')]").click
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
      $driver.find_element(:xpath, "//XCUIElementTypeWindow[1]/XCUIElementTypeOther[6]/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText[@name='#{discount_details[:discount_using]}']").click
      input_discount_amount.send_keys discount_details[:discount_amount]
      btn_confirm_add_discount.click
    end

    def add_shipping(shipping_details)
      swipe(50, btn_select_product.location[:y], 50, txt_new_quote_title.location[:y])
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
      swipe(50, btn_select_product.location[:y], 50, txt_new_quote_title.location[:y])
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
