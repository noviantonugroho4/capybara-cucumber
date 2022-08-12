module Ios
  class ExpenseFormScreen < Appom::Page
    element :txt_title, :class_chain, '**/XCUIElementTypeStaticText[`label == "New Expenses"`]'
    element :btn_create_expense, :accessibility_id, 'btn_create_transaction'
    element :input_expense_number, :accessibility_id, 'txt_transaction_no'
    element :input_beneficiary, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[1]'
    element :input_search_beneficiary, :class_chain, '**/XCUIElementTypeTextField[`value == "Search vendor"`]'
    element :btn_cancel_search, :class_chain, '**/XCUIElementTypeButton[`label == "Cancel"`]'
    element :list_existing_beneficiary, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[4]/XCUIElementTypeTable'
    elements :list_item_beneficiary, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[4]/XCUIElementTypeTable/XCUIElementTypeCell'
    element :btn_confirm_select_beneficiary, :class_chain, '**/XCUIElementTypeStaticText[`label == "Select"`]'
    element :btn_create_new_beneficiary, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[3]/XCUIElementTypeButton'
    element :txt_vendor_name, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[5]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]'
    # element :btn_confirm_create_new_vendor, :class_chain, '**/XCUIElementTypeButton[`label == "Create"`][2]'
    element :btn_confirm_create_new_vendor, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[5]/XCUIElementTypeOther/XCUIElementTypeNavigationBar/XCUIElementTypeButton[2]'
    element :input_transaction_date, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[2]'
    element :input_due_date, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[3]'
    element :toggle_paylater, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeSwitch[1]'
    element :input_pay_from_account, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[6]'
    element :input_search_pay_from_account, :class_chain, '**/XCUIElementTypeTextField[`value == "Search"`]'
    element :list_pay_from_account, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable'
    elements :list_item_pay_from_account, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell'
    element :input_payment_method, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[5]'
    element :popup_select_payment_method, :class_chain, '**/XCUIElementTypeStaticText[`label == "Select payment method"`]'
    elements :list_item_payment_method, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell'
    element :input_expense_account, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeButton[3]'
    element :input_search_expense, :class_chain, '**/XCUIElementTypeTextField[`value == "Search expenses"`]'
    elements :list_expense_account, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell'
    element :list_item_expense_account, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]'
    element :input_expense_amount, :accessibility_id, 'txtAmount'
    element :btn_confirm_input_expense_account, :class_chain, '**/XCUIElementTypeButton[`label == "Save"`]'
    element :input_term, :iclass_chaind, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeButton[4]'
    #   elements :list_item_term, :id, 'tvTermName'
    #   element :btn_add_info, :id, 'tvAddOtherInfo'
    #   element :btn_add_tags, :id, 'tvTag'
    #   element :btn_add_attachment, :xpath, '//android.widget.LinearLayout[@resource-id="id.jurnal.mobile:id/tracks"]/android.widget.TextView[3]'
    #   element :input_memo_text, :id, 'edtMemo'
    #   element :btn_confirm_memo, :id, 'tvSave'
    #   elements :list_item_tags, :id, 'tv_tags_name'
    #   element :btn_add_tags_on_demand, :id, 'tv_product_on_demand'
    element :txt_warning_failed, :id, 'ios:id/alertTitle'
    #   element :btn_close_warning, :id, 'android:id/button1'
    #   element :btn_close_form, :id, 'ivClose'
    element :btn_confirm_create_expense, :class_chain, '**/XCUIElementTypeButton[`label == "Create expenses"`]'
    #   element :popup_select_term, :id, 'tvSelectTermTitle'
    element :btn_confirm_add_tags, :class_chain, '**/XCUIElementTypeButton[`label == "Create"`]'
    element :btn_update_expense, :accessibility_id, 'btn_update_transaction'
    element :btn_back, :accessibility_id, 'btn_back_transaction_detail'

    def create_open_expense(expense_details)
      sleep 5
      wait_long_for { txt_title.displayed? }
      wait_long_for { input_expense_number.displayed? }
      input_expense_number.send_keys expense_details[:expense_number]
      select_beneficiary(expense_details[:beneficiary_name]) if expense_details[:beneficiary_name].present?
      select_datepicker(input_transaction_date, expense_details[:transaction_date]) if expense_details[:transaction_date].present?
      toggle_paylater.click
      select_expense_account(expense_details[:expense_account], expense_details[:expense_amount]) if expense_details[:expense_account].present?
      wait_long_for { btn_create_expense.displayed? }
      btn_create_expense.click
      btn_confirm_create_expense.click unless has_txt_warning_failed?
    end

    def edit_open_expense_to_paid(expense_details)
      select_beneficiary(expense_details[:beneficiary_name]) if expense_details[:beneficiary_name].present?
      toggle_paylater.click
      btn_update_expense.click
    end

    def create_with_only_expense_account_selected(expense_details)
      select_expense_account(expense_details[:expense_account], expense_details[:expense_amount]) if expense_details[:expense_account].present?
      wait_long_for { btn_create_expense.displayed? }
      btn_create_expense.click
      btn_confirm_create_expense.click unless has_txt_warning_failed?
    end

    def select_beneficiary(beneficiary_name)
      wait_for { input_beneficiary.displayed? }
      input_beneficiary.click
      wait_for { input_search_beneficiary.displayed? }
      input_search_beneficiary.send_keys beneficiary_name
      sleep 3 # had to use sleep because the loading animation cannot be inspected
      if !has_list_item_beneficiary?
        btn_create_new_beneficiary.click
        wait_for { btn_confirm_create_new_vendor.displayed? }
        txt_vendor_name.send_keys beneficiary_name
        btn_confirm_create_new_vendor.click
      else
        list_item_beneficiary.select { |cust| cust.text == beneficiary_name }.first.click
      end
      wait_for { btn_create_expense.displayed? } if has_btn_create_expense?
      wait_for { btn_update_expense.displayed? } if has_btn_update_expense?
    end

    def select_expense_account(expense_account, expense_amount)
      wait_for { input_expense_account.displayed? }
      input_expense_account.click
      sleep 3
      input_search_expense.send_keys expense_account
      wait_for { has_list_expense_account? }
      list_item_expense_account.click if has_list_item_expense_account?
      wait_for { input_expense_amount.displayed? }
      input_expense_amount.click
      input_expense_amount.send_keys expense_amount
      if expense_amount.nil?
        # TODO: get element alert
      else
        btn_confirm_input_expense_account.click
      end
      wait_long_for { btn_create_expense.displayed? }
    end

    def select_pay_from_account(pay_from_account)
      wait_for { input_pay_from_account.displayed? }
      input_pay_from_account.click
      input_search.send_keys pay_from_account
      wait_for { has_list_pay_from_account? }
      list_item_pay_from_account.select { |account| account.text == pay_from_account }.first.click if has_list_pay_from_account?
    end

    def select_payment_method(payment_method)
      wait_for { input_payment_method.displayed? }
      input_payment_method.click
      wait_for { popup_select_payment_method.displayed? }
      list_item_payment_method.select { |method| method.text == payment_method }.first.click
      $driver.press_keycode(4) if has_popup_select_payment_method?
    end
  end
end
