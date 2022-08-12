module Android
  class ContactFormScreen < Appom::Page
    section :common_screen, CommonScreen, :id, 'android:id/content'
    element :btn_create, :id, 'btn_create'
    element :input_name, :id, 'tv_create_contact_person_name'
    element :input_email, :id, 'tv_create_contact_email'
    element :input_mobile, :id, 'tv_create_contact_mobile'
    element :input_phone, :id, 'tv_create_contact_phone'
    element :input_account_receivable, :id, 'tv_create_contact_ar'
    element :input_account_payable, :id, 'tv_create_contact_ap'
    element :input_term, :id, 'tv_create_contact_term'
    element :input_billing_address, :id, 'tv_create_contact_billing'
    element :input_shipping_address, :id, 'tv_create_contact_address'
    element :search_account, :id, 'search_src_text'
    element :list_account_name, :id, 'rv_select_account'
    elements :list_item_account_name, :id, 'tv_account_list_name'
    element :txt_no_data, :id, 'iv_no_data'
    element :popup_select_term, :id, 'll_bottom_sheet_term'
    elements :list_item_term, :id, 'tv_create_invoice_term'
    element :btn_update, :id, 'btn_create_create_contact'
    element :btn_back, :xpath, "//android.view.ViewGroup[@resource-id='id.jurnal.mobile:id/toolbar_create']/android.widget.ImageButton"

    def fill_contact(contact_details)
      input_name.send_keys contact_details[:name]
      input_email.send_keys contact_details[:email]
      input_mobile.send_keys contact_details[:mobile]
      input_phone.send_keys contact_details[:phone]
      select_account(input_account_receivable, contact_details[:account_receivable])
      select_account(input_account_payable, contact_details[:account_payable])
      select_term(contact_details[:term])
      input_billing_address.send_keys contact_details[:billing_address]
      input_shipping_address.send_keys contact_details[:shipping_address] if has_input_shipping_address?
      btn_create.click
    end

    def select_account(element_name, account_name)
      element_name.click
      wait_for { list_account_name.displayed? }
      search_account.send_keys account_name
      wait_for { list_account_name.displayed? || txt_no_data.displayed? } # contact form has no loading indicator
      list_item_account_name.select { |account| account.text == account_name }.first.click
      wait_for { btn_create.displayed? }
    end

    def select_term(term_name)
      input_term.click
      wait_for { popup_select_term.displayed? }
      list_item_term.select { |term| term.text == term_name }.first.click
    end

    def edit_contact(contact_details)
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
      select_term(contact_details[:term])
      input_billing_address.clear
      input_billing_address.send_keys contact_details[:billing_address]
      input_shipping_address.clear if has_input_shipping_address?
      input_shipping_address.send_keys contact_details[:shipping_address] if has_input_shipping_address?
      btn_update.click
    end
  end
end
