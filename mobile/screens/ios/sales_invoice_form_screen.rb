module Ios
  class SalesInvoiceFormScreen < Appom::Page
    element :txt_new_invoice_title, :predicate, 'label == "New Invoice"'
    element :btn_create_sales_invoice, :class_chain, '**/XCUIElementTypeButton[`label == "Create"`]'
    element :btn_cancel_create_invoice, :class_chain, '**/XCUIElementTypeButton[`label == "ic close white"`]'
    element :btn_select_customer, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[1]'
    element :input_transaction_no, :id, 'edtTransactionNo'
    element :input_transaction_date, :class_chain, '**/XCUIElementTypeStaticText[`label == "Transaction date"`]'
    element :input_due_date, :class_chain, '**/XCUIElementTypeStaticText[`label == "Due date"`]'
    element :input_term, :class_chain, '**/XCUIElementTypeStaticText[`label == "Term"`]'
    element :btn_select_warehouse, :id, 'tvWareHouse'
    element :btn_select_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeButton[2]'
    element :list_existing_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable'
    elements :list_item_existing_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText[7]'
    element :input_product_name, :class_chain, '**/XCUIElementTypeTextField[`value == "Search"`]'
    element :btn_create_new_product, :id, 'tv_product_on_demand'
    element :toggle_buy_price, :id, 's_create_product_buy'
    element :input_buy_price, :id, 'tiet_create_product_buy_price'
    element :input_sell_price, :id, 'tiet_create_product_sell_price'
    element :btn_confirm_create_new_product, :id, 'btn_create_product'
    element :btn_confirm_select_product, :class_chain, '**/XCUIElementTypeButton[`label == "Add"`]'
    element :popup_select_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable'
    element :popup_customer_list, :id, 'srl_person_list'
    element :input_search_customer, :predicate, 'value == "Search"'
    element :list_existing_customer, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable'
    elements :list_item_existing_customer, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText'
    element :btn_create_new_customer, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[3]'
    element :input_customer_on_demand, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeTextField'
    element :btn_confirm_create_new_customer, :class_chain, '**/XCUIElementTypeButton[`label == "Create"`][2]'
    element :popup_select_customer, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]'
    element :btn_confirm_customer, :class_chain, '**/XCUIElementTypeButton[`label == "Select"`]'
    element :popup_select_term, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]'
    elements :list_term, :xpath, '//android.widget.TextView[@resource-id="id.jurnal.mobile:id/tvTermName"]'
    element :popup_create_sales_invoice, :id, 'design_bottom_sheet'
    element :btn_create_and_new, :accessibility_id, 'Create and new'
    element :btn_create_and_send, :accessibility_id, 'Create and send'
    element :btn_confirm_create_invoice, :accessibility_id, 'Create sales invoice'
    element :btn_keyboard_search, :class_chain, '**/XCUIElementTypeButton[`label == "Search"`]'

    def fill_invoice_form(invoice_details)
      select_customer(invoice_details[:customer_name]) if invoice_details[:customer_name].present?
      select_datepicker(input_transaction_date, invoice_details[:transaction_date]) if invoice_details[:transaction_date].present?
      select_datepicker(input_due_date, invoice_details[:due_date]) if invoice_details[:due_date].present?
      select_term(invoice_details[:term]) if invoice_details[:term].present?
      select_product(invoice_details[:product_details]) if invoice_details[:product_details].present?
      select_warehouse(invoice_details[:warehouse_name]) if invoice_details[:warehouse_name].present?
      btn_create_sales_invoice.click
      wait_for { btn_confirm_create_invoice.displayed? }
      btn_confirm_create_invoice.click
    end

    def select_customer(customer_name)
      btn_select_customer.click
      wait_for { input_search_customer.displayed? }
      input_search_customer.send_keys customer_name
      wait_for { btn_keyboard_search.displayed? }
      btn_keyboard_search.click
      if has_no_list_existing_customer?
        btn_create_new_customer.click
        wait_for { input_customer_on_demand.displayed? }
        input_customer_on_demand.send_keys customer_name
        # can't use click, so this is the workaround
        Appium::TouchAction.new.press(x: btn_confirm_create_new_customer.location[:x], y: btn_confirm_create_new_customer.location[:y]).perform
      else
        list_item_existing_customer.select { |cust| cust.text == customer_name }.first.click
        wait_for { popup_select_customer.displayed? }
        btn_confirm_customer.click
      end
      wait_for { btn_create_sales_invoice.displayed? }
    end

    def select_term(term)
      input_term.click
      wait_for { popup_select_term.displayed? }
      $driver.find_element(:xpath, "//XCUIElementTypeApplication[@name='Jurnal Mobile']/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText[@name='#{term}']").click
      wait_for { has_no_popup_select_term? } # tap back button to dismiss the popup if it's not automatically closed
    end

    def select_product(product_details)
      btn_select_product.click
      wait_for { list_existing_product.displayed? }
      input_product_name.send_keys product_details[:product_name]
      wait_for { btn_keyboard_search.displayed? }
      btn_keyboard_search.click

      if has_no_list_existing_product?
        btn_create_new_product.click
        if product_details[:product_buy_price].present?
          toggle_buy_price.click
          tiet_create_product_buy_price.send_keys product_details[:product_buy_price]
        end
        tiet_create_product_sell_price.send_keys product_details[:product_sell_price] if product_details[:product_sell_price].present?
        btn_confirm_create_new_product.click
      else
        list_item_existing_product.select { |prod| prod.text == product_details[:product_name] }.first.click
        wait_for { popup_select_product.displayed? }
        btn_confirm_select_product.click
      end
      wait_for { btn_create_sales_invoice.displayed? }
    end

    def select_warehouse(_warehouse_name)
      # TODO: handle input warehouse
    end
  end
end
