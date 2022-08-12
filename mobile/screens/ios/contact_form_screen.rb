module Ios
  class ContactFormScreen < Appom::Page
    element :btn_create, :id, 'btn_create'
    element :input_name, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeTextField'
    element :input_email, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeTextField'
    element :input_mobile, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[3]/XCUIElementTypeTextField'
    element :input_phone, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[4]/XCUIElementTypeTextField'
    element :input_account_receivable, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[5]'
    element :input_account_payable, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[6]'
    element :input_term, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[7]'
    element :input_billing_address, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[8]/XCUIElementTypeTextView'
    element :input_shipping_address, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[9]/XCUIElementTypeTextView'
    element :search_account, :class_chain, '**/XCUIElementTypeTextField[`value == "Search"`]'
    element :list_account_name, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable'
    element :list_item_account_name, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]'
    element :txt_no_data, :class_chain, '**/XCUIElementTypeButton[`label == "No Result Found"`][1]'
    element :popup_select_term, :class_chain, '**/XCUIElementTypeButton[`label == "Select Term"`][2]'
    elements :list_item_term, :id, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell'
    element :btn_update, :accessibility_id, 'Update'
    element :btn_back, :accessibility_id, 'ArrowLeft'

    def fill_contact(contact_details)
      input_name.send_keys contact_details[:name]
      input_email.send_keys contact_details[:email]
      input_mobile.send_keys contact_details[:mobile]
      input_phone.send_keys contact_details[:phone]
      select_account(input_account_receivable, contact_details[:account_receivable])
      select_account(input_account_payable, contact_details[:account_payable])
      # select_term(contact_details[:term]) -> need to find solution
      input_billing_address.send_keys contact_details[:billing_address]
      input_shipping_address.send_keys contact_details[:shipping_address] if has_input_shipping_address?
      btn_create.click
    end

    def select_account(element_name, account_name)
      element_name.click
      wait_for { list_account_name.displayed? }
      search_account.send_keys account_name
      wait_for { list_account_name.displayed? || txt_no_data.displayed? } # contact form has no loading indicator
      sleep 3
      $driver.find_element(:xpath, "//XCUIElementTypeApplication[@name='Jurnal Mobile']/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[@name='#{account_name}']").click
    end

    # TODO: find solution
    def select_term(term)
      wait_for { input_term.displayed? }
      input_term.click
      wait_for { popup_select_term.displayed? }
      $driver.find_element(:xpath, "//XCUIElementTypeApplication[@name='Jurnal Mobile']/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[@name='#{term}']").click
    end

    def edit_contact(contact_details)
      sleep 2
      input_name.clear
      input_name.send_keys contact_details[:name]
      input_email.clear
      input_email.send_keys contact_details[:email]
      input_mobile.clear
      input_mobile.send_keys contact_details[:mobile]
      input_phone.clear
      input_phone.send_keys contact_details[:phone]
      select_account(input_account_receivable, contact_details[:account_receivable])
      select_account(input_account_payable, contact_details[:account_payable])
      # select_term(contact_details[:term]) -> need to find solution
      input_billing_address.clear
      input_billing_address.send_keys contact_details[:billing_address]
      input_shipping_address.clear if has_input_shipping_address?
      input_shipping_address.send_keys contact_details[:shipping_address] if has_input_shipping_address?
      btn_update.click
    end
  end
end
