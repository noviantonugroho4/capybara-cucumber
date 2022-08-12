module Ios
  class PurchaseOrderFormScreen < Appom::Page
    element :txt_new_order_title, :predicate, 'label == "Purchase Order"'
    element :btn_create_purchase_order, :class_chain, '**/XCUIElementTypeButton[`label == "Create"`]'
    element :btn_cancel_create_order, :class_chain, '**/XCUIElementTypeButton[`label == "ic close white"`]'
    element :btn_select_vendor, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[1]'
    element :input_transaction_no, :id, 'edtTransactionNo'
    element :input_transaction_date, :class_chain, '**/XCUIElementTypeStaticText[`label == "Transaction date"`]'
    element :input_due_date, :class_chain, '**/XCUIElementTypeStaticText[`label == "Due date"`]'
    element :input_term, :class_chain, '**/XCUIElementTypeStaticText[`label == "Term"`]'
    element :btn_select_warehouse, :id, 'tvWareHouse'
    element :btn_select_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeButton[2]'
    element :list_existing_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeTable'
    elements :list_item_existing_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText[7]'
    element :input_product_name, :class_chain, '**/XCUIElementTypeTextField[`value == "Search"`]'
    element :btn_create_new_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[3]/XCUIElementTypeButton'
    element :toggle_buy_price, :class_chain, '**/XCUIElementTypeSwitch[`label == "I Buy This Item"`]'
    element :input_buy_price, :xpath, '//XCUIElementTypeStaticText[@name="Buy Unit Price"]/following-sibling::XCUIElementTypeTextField'
    element :input_sell_price, :xpath, '//XCUIElementTypeStaticText[@name="Sell Unit Price"]/following-sibling::XCUIElementTypeTextField'
    element :btn_confirm_create_new_product, :class_chain, '**/XCUIElementTypeNavigationBar[`name == "Product"`]/XCUIElementTypeButton[2]'
    element :input_product_on_demand, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeTextField'
    element :btn_confirm_select_product, :accessibility_id, 'Save'
    element :popup_select_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable'
    element :popup_vendor_list, :id, 'srl_person_list'
    element :input_search_vendor, :predicate, 'value == "Search vendor"'
    element :list_existing_vendor, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[4]'
    elements :list_item_existing_vendor, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[4]/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText'
    element :btn_create_new_vendor, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[3]'
    element :input_vendor_on_demand, :class_chain, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[5]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeTextField'
    element :btn_confirm_create_new_vendor, :class_chain, '**/XCUIElementTypeNavigationBar[`name == "Vendor"`]/XCUIElementTypeButton[2]'
    element :popup_select_vendor, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[5]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]'
    element :btn_confirm_vendor, :class_chain, '**/XCUIElementTypeButton[`label == "Select"`]'
    element :popup_select_term, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]'
    elements :list_term, :xpath, '//android.widget.TextView[@resource-id="id.jurnal.mobile:id/tvTermName"]'
    element :popup_create_purchase_order, :id, 'design_bottom_sheet'
    element :btn_create_and_new, :accessibility_id, 'Create and new'
    element :btn_confirm_create_order, :accessibility_id, 'Create purchase order'
    element :btn_keyboard_search, :class_chain, '**/XCUIElementTypeButton[`label == "Search"`]'
    element :progress_loading, :predicate, 'label == "In progress"'

    element :edit_product, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeButton[1]'
    element :edit_unit_price, :xpath, '/XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeTextField[1]'
    element :price_unit_form, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeStaticText[1]'
    element :delete_product, :class_chain, '**/XCUIElementTypeButton[`label == "ic sale delete"`]'
    element :product_delete_popup, :class_chain, '**/XCUIElementTypeAlert'
    element :btn_remove_product_delete_popup, :xpath, '//XCUIElementTypeButton[@name="Remove"]'

    def fill_order_form(order_details)
      select_vendor(order_details[:vendor_name]) if order_details[:vendor_name].present?
      select_datepicker(input_transaction_date, order_details[:transaction_date]) if order_details[:transaction_date].present?
      select_datepicker(input_due_date, order_details[:due_date]) if order_details[:due_date].present?
      select_term(order_details[:term]) if order_details[:term].present?
      select_product(order_details[:product_details]) if order_details[:product_details].present?
      select_warehouse(order_details[:warehouse_name]) if order_details[:warehouse_name].present?
      wait_for { has_btn_create_purchase_order? }
      btn_create_purchase_order.click
      wait_for { has_btn_confirm_create_order? }
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
      sleep 2
      wait_for { btn_select_vendor.displayed? }
      btn_select_vendor.click
      wait_for { input_search_vendor.displayed? }
      input_search_vendor.send_keys vendor_name
      # wait_for { !progress_loading.displayed? }
      sleep 2
      if has_no_list_existing_vendor?
        btn_create_new_vendor.click
        wait_for { btn_confirm_create_new_vendor.displayed? }
        input_vendor_on_demand.send_keys vendor_name
        btn_confirm_create_new_vendor.click
      else
        list_item_existing_vendor.select { |cust| cust.text == vendor_name }.first.click
        wait_for { popup_select_vendor.displayed? }
        btn_confirm_vendor.click
      end
      wait_for { btn_create_purchase_order.displayed? }
    end

    def select_term(term)
      input_term.click
      wait_for { popup_select_term.displayed? }
      sleep 2
      $driver.find_element(:xpath, "//XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell/XCUIElementTypeStaticText[@name='#{term}']").click
      wait_for { btn_create_purchase_order.displayed? }
    end

    def select_product(product_details)
      btn_select_product.click
      wait_for { list_existing_product.displayed? }
      sleep 2
      input_product_name.send_keys product_details[:product_name]
      # wait_for { btn_keyboard_search.displayed? }
      # btn_keyboard_search.click

      if has_no_list_existing_product?
        btn_create_new_product.click
        wait_for { btn_confirm_create_new_product.displayed? }
        input_product_on_demand.send_keys product_details[:product_name]
        if product_details[:product_buy_price].present?
          swipe($driver.window_size['width'] / 2, $driver.window_size['height'] / 2, $driver.window_size['width'] / 2, $driver.window_size['width'] / 5)
          toggle_buy_price.click
          input_buy_price.send_keys product_details[:product_buy_price]
        end
        input_sell_price.send_keys product_details[:product_sell_price] if product_details[:product_sell_price].present?
        btn_confirm_create_new_product.click
      else
        sleep 2
        list_item_existing_product.select { |prod| prod.text == product_details[:product_name] }.first.click
      end
      wait_for { btn_confirm_select_product.displayed? }
      btn_confirm_select_product.click
    end

    def select_warehouse(_warehouse_name)
      # TODO: handle input warehouse
    end
  end
end
