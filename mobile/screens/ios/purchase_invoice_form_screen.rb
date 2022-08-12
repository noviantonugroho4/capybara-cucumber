module Ios
  class PurchaseInvoiceFormScreen < Appom::Page
    element :txt_new_invoice_title, :class_chain, '**/XCUIElementTypeStaticText[`label == "Purchase Invoice"`]'
    element :btn_create_purchase_invoice, :accessibility_id, 'Create'
    element :btn_select_vendor, :xpath, '///XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[1]'
    element :input_transaction_no, :id, 'edtTransactionNo'
    element :input_transaction_date, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[2]'
    element :input_due_date, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[3]'
    element :input_term, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[4]'
    element :btn_select_warehouse, :id, '**/XCUIElementTypeOther[`name == "Product"`]/XCUIElementTypeButton'
    element :btn_select_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeButton[3]'
    element :list_existing_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeTable'
    elements :list_item_existing_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText[7]'
    element :input_product_name, :class_chain, '**/XCUIElementTypeTextField[`value == "Search"`]'
    element :btn_create_new_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[3]/XCUIElementTypeButton'
    element :toggle_buy_price, :class_chain, '**/XCUIElementTypeSwitch[`label == "I Buy This Item"`]'
    element :toggle_sell_price, :class_chain, '**/XCUIElementTypeSwitch[`label == "I Sell This Item"`]'
    element :input_buy_price, :xpath, '//XCUIElementTypeTextField/preceding-sibling::XCUIElementTypeStaticText[@name="Buy Unit Price"]'
    element :input_sell_price, :xpath, '//XCUIElementTypeTextField/preceding-sibling::XCUIElementTypeStaticText[@name="Sell Unit Price"]'
    element :btn_confirm_create_new_product, :class_chain, '**/XCUIElementTypeNavigationBar[`name == "Product"`]/XCUIElementTypeButton[`label == "Create"`]'
    element :btn_confirm_select_product, :class_chain, '**/XCUIElementTypeButton[`label == "Save"`]'
    element :popup_select_product, :id, 'toolbar_create'
    element :popup_vendor_list, :id, 'srl_person_list'
    element :input_search_vendor, :class_chain, '**/XCUIElementTypeTextField[`value == "Search vendor"`]'
    element :list_existing_vendor, :class_chain, '**/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[4]/XCUIElementTypeTable'
    elements :list_item_existing_vendor, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[4]/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText'
    element :btn_create_new_vendor, :class_chain, '**/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[3]/XCUIElementTypeButton'
    element :btn_confirm_create_new_vendor, :class_chain, '**/XCUIElementTypeButton[`label == "Create"`][2]'
    element :popup_select_vendor, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[5]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]'
    element :btn_confirm_vendor, :class_chain, '**/XCUIElementTypeButton[`label == "Select"`]'
    element :popup_select_term, :class_chain, '**/XCUIElementTypeStaticText[`label == "Select Term"`]'
    elements :list_term, :xpath, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell'
    element :popup_create_purchase_invoice, :id, 'design_bottom_sheet'
    element :btn_create_and_new, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeSheet/XCUIElementTypeOther/XCUIElementTypeOther[1]/XCUIElementTypeOther[2]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeOther[1]'
    element :btn_create_and_send, :class_chain, 'tvCreateAndSend'
    element :btn_confirm_create_invoice, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeSheet/XCUIElementTypeOther/XCUIElementTypeOther[1]/XCUIElementTypeOther[2]/XCUIElementTypeScrollView/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeOther[3]'
    element :progress_bar_search, :accessibility_id, 'In progress'
    element :new_vendor_name_field, :class_chain, '**/XCUIElementTypeTextField[`value == "Vendor Name"`]'
    element :new_product_name_field, :class_chain, '**/XCUIElementTypeTextField[`value == "Product Name"`]'
    element :empty_list_product, :class_chain, '**/XCUIElementTypeTable[`label == "Empty list"`]'
    element :empty_list_vendor, :class_chain, '**/XCUIElementTypeTable[`label == "Pull to refresh..."`]'

    def fill_invoice_form(invoice_details)
      select_vendor(invoice_details[:vendor_name]) if invoice_details[:vendor_name].present?
      select_datepicker(input_transaction_date, invoice_details[:transaction_date]) if invoice_details[:transaction_date].present?
      # select_datepicker(input_due_date, invoice_details[:due_date]) if invoice_details[:due_date].present?
      select_term(invoice_details[:term]) if invoice_details[:term].present?
      select_product(invoice_details[:product_details]) if invoice_details[:product_details].present?
      select_warehouse(invoice_details[:warehouse_name]) if invoice_details[:warehouse_name].present?
      wait_for { has_btn_create_purchase_invoice? }
      btn_create_purchase_invoice.click
      btn_confirm_create_invoice.click
    end

    def select_vendor(vendor_name)
      wait_for { btn_select_vendor.displayed? }
      btn_select_vendor.click
      wait_for { input_search_vendor.displayed? }
      input_search_vendor.send_keys vendor_name
      sleep 2 # had to use sleep because the loading animation cannot be inspected

      if has_no_empty_list_vendor?
        list_item_existing_vendor.select { |cust| cust.text == vendor_name }.first.click
        sleep 2
        wait_for { popup_select_vendor.displayed? }
        btn_confirm_vendor.click
      else
        btn_create_new_vendor.click
        wait_for { btn_confirm_create_new_vendor.displayed? }
        new_vendor_name_field.send_keys vendor_name
        btn_confirm_create_new_vendor.click
      end
      wait_for { btn_create_purchase_invoice.displayed? }
    end

    def select_term(term)
      input_due_date.click
      wait_for { input_term.displayed? }
      input_term.click
      wait_for { popup_select_term.displayed? }
      $driver.find_element(:class_chain, "**/XCUIElementTypeCell/XCUIElementTypeStaticText[`label == '#{term}'`]").click
      wait_for { btn_create_purchase_invoice.displayed? }
    end

    def select_product(product_details)
      btn_select_product.click
      wait_for { list_existing_product.displayed? }
      sleep 2
      input_product_name.send_keys product_details[:product_name]
      sleep 5
      $driver.find_element(:class_chain, "**/XCUIElementTypeTextField[`value == '#{product_details[:product_name]}'`]").send_keys :delete
      # input_product_name.send_keys :delete
      sleep 2
      if has_no_empty_list_product?
        sleep 2
        list_item_existing_product.select { |prod| prod.text == product_details[:product_name] }.first.click
      else
        btn_create_new_product.click
        sleep 2
        wait_for { new_product_name_field.displayed? }
        new_product_name_field.send_keys product_details[:product_name]
        input_buy_price.send_keys product_details[:product_buy_price] if product_details[:product_buy_price].present?
        if product_details[:product_sell_price].present?
          toggle_sell_price.click
          swipe(input_buy_price.location[:x], input_buy_price.location[:y], input_buy_price.location[:x], input_buy_price.location[:y] - 600)
          input_sell_price.send_keys product_details[:product_sell_price]
        end
        btn_confirm_create_new_product.click
      end
      wait_for { btn_confirm_select_product.displayed? }
      btn_confirm_select_product.click
    end

    def select_warehouse(_warehouse_name)
      # TODO: handle input warehouse
    end
  end
end
