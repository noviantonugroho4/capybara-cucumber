module Android
  # rubocop:disable Metrics/ClassLength
  class ExpenseFormScreen < Appom::Page
    section :common_screen, CommonScreen, :id, 'android:id/content'
    element :txt_title, :id, 'tvToolbarTile'
    element :btn_create_expense, :id, 'tvCreate'
    element :input_beneficiary, :id, 'clSelectVendor'
    element :input_expense_number, :id, 'edtTransactionNo'
    element :input_search, :id, 'search_src_text'
    element :list_contact, :id, 'rv_person_list'
    elements :list_item_contact, :id, 'tv_person_list_name'
    element :btn_confirm_select_contact, :id, 'tvSelect'
    element :edit_beneficiary_email, :id, 'edtEmail'
    element :edit_beneficiary_address, :id, 'edtBillingAddress'
    element :btn_add_new_contact, :id, 'tv_person_on_demand'
    element :input_contact_name_on_demand, :id, 'tv_create_contact_person_name'
    element :input_contact_email_on_demand, :id, 'tv_create_contact_email'
    element :input_contact_address_on_demand, :id, 'tv_create_contact_billing'
    element :btn_create_new_contact, :id, 'btn_create_create_contact'
    element :input_transaction_date, :id, 'tvTransactionDate'
    element :input_due_date, :id, 'tvDueDate'
    element :toggle_paylater, :id, 'swPayLater'
    element :input_pay_from_account, :id, 'tvPayFrom'
    element :input_payment_method, :id, 'tvPaymentMethod'
    elements :list_item_payment_method, :id, 'tvTermName'
    element :input_expense_account, :id, 'lnSelectExpense'
    element :list_expense_account, :id, 'rv_select_account'
    elements :list_item_expense_account, :id, 'tv_account_list_name'
    element :input_expense_amount, :id, 'edtAmount'
    element :btn_confirm_input_expense_account, :id, 'tvSave'
    element :input_term, :id, 'tvTerm'
    elements :list_item_term, :id, 'tvTermName'
    element :btn_add_info, :id, 'tvAddOtherInfo'
    element :btn_add_tags, :id, 'tvTag'
    element :btn_add_attachment, :xpath, '//android.widget.LinearLayout[@resource-id="id.jurnal.mobile:id/tracks"]/android.widget.TextView[3]'
    element :input_memo_text, :id, 'edtMemo'
    element :btn_confirm_memo, :id, 'tvSave'
    elements :list_item_tags, :id, 'tv_tags_name'
    element :btn_add_tags_on_demand, :id, 'tv_product_on_demand'
    element :txt_warning_failed, :id, 'android:id/alertTitle'
    element :btn_close_warning, :id, 'android:id/button1'
    element :btn_close_form, :id, 'ivClose'
    element :popup_select_payment_method, :id, 'tvSelectPaymentMethodTitle'
    element :btn_confirm_create_expense, :id, 'tvCreate'
    element :popup_select_term, :id, 'tvSelectTermTitle'
    element :btn_confirm_add_tags, :id, 'btn_create'
    element :btn_back, :id, 'ivBack'
    element :btn_edit_expense_account, :id, 'tvEditExpense'
    element :btn_delete_expense_account, :id, 'ivDelete'
    element :btn_confirm_remove, :xpath, '//android.widget.FrameLayout/android.widget.FrameLayout/androidx.appcompat.widget.LinearLayoutCompat/android.widget.ScrollView/android.widget.LinearLayout/android.widget.Button[2]'
    element :btn_add_more_expense_account, :id, 'flAddAnotherExpense'

    def fill_expense_form(expense_details)
      input_expense_number.send_keys expense_details[:expense_number]
      select_beneficiary(expense_details, expense_details[:edit_beneficiary_data]) if expense_details[:beneficiary_name].present?
      select_datepicker(input_transaction_date, expense_details[:transaction_date]) if expense_details[:transaction_date].present?
      if expense_details[:pay_later]
        toggle_paylater.click
        select_term(expense_details[:term]) if expense_details[:term].present?
        select_datepicker(input_due_date, expense_details[:due_date]) if expense_details[:due_date].present?
        swipe(input_term.location[:x], input_term.location[:y], input_transaction_date.location[:x], input_transaction_date.location[:y])
      end
      select_pay_from_account(expense_details[:pay_from_account]) if expense_details[:pay_from_account].present? && !expense_details[:pay_later]
      select_payment_method(expense_details[:payment_method]) if expense_details[:payment_method].present?
      select_expense_account(expense_details[:expense_account], expense_details[:expense_amount]) if expense_details[:expense_account].present?
      input_memo(expense_details[:memo]) if expense_details[:memo].present?
      input_tags(expense_details[:tags]) if expense_details[:tags].present?
      wait_long_for { btn_create_expense.displayed? }
      btn_create_expense.click
      btn_confirm_create_expense.click unless has_txt_warning_failed?
    end

    def create_open_expense(expense_details)
      input_expense_number.send_keys expense_details[:expense_number]
      create_new_beneficiary(expense_details[:beneficiary_name]) if expense_details[:beneficiary_name].present?
      select_datepicker(input_transaction_date, expense_details[:transaction_date]) if expense_details[:transaction_date].present?
      toggle_paylater.click
      select_expense_account(expense_details[:expense_account], expense_details[:expense_amount]) if expense_details[:expense_account].present?
      wait_long_for { btn_create_expense.displayed? }
      btn_create_expense.click
      btn_confirm_create_expense.click unless has_txt_warning_failed?
    end

    def edit_open_expense_to_paid(expense_details)
      select_datepicker(input_transaction_date, expense_details[:transaction_date]) if expense_details[:transaction_date].present?
      create_new_beneficiary(expense_details[:beneficiary_name]) if expense_details[:beneficiary_name].present?
      toggle_paylater.click
      select_pay_from_account(expense_details[:pay_from_account]) if expense_details[:pay_from_account].present? && !expense_details[:pay_later]
      select_payment_method(expense_details[:payment_method]) if expense_details[:payment_method].present?
      edit_expense_account(expense_details[:expense_account], expense_details[:expense_amount]) if expense_details[:expense_account].present?
      input_memo(expense_details[:memo]) if expense_details[:memo].present?
      input_tags(expense_details[:tags]) if expense_details[:tags].present?
      wait_long_for { btn_create_expense.displayed? }
      btn_create_expense.click
    end

    def create_with_only_expense_account_selected(expense_details)
      select_expense_account(expense_details[:expense_account], expense_details[:expense_amount]) if expense_details[:expense_account].present?
      wait_long_for { btn_create_expense.displayed? }
      btn_create_expense.click
      btn_confirm_create_expense.click unless has_txt_warning_failed?
    end

    def select_beneficiary(beneficiary_details, edit_beneficiary_data)
      beneficiary_name = beneficiary_details[:beneficiary_name]
      input_beneficiary.click
      wait_for { has_input_search? }
      input_search.send_keys beneficiary_name
      wait_for { common_screen.has_no_progress_bar_loading? }

      if has_list_contact? # using existing contact
        list_item_contact.select { |contact| contact.text == beneficiary_name }.first.click
        wait_for { btn_confirm_select_contact.displayed? }
        if edit_beneficiary_data
          edit_beneficiary_email.send_keys beneficiary_details[:beneficiary_email] if beneficiary_details[:beneficiary_email].present?
          edit_beneficiary_address.send_keys beneficiary_details[:beneficiary_address] if beneficiary_details[:beneficiary_address].present?
        end
        btn_confirm_select_contact.click
      else
        btn_add_new_contact.click
        wait_for { btn_create_new_contact.displayed? }
        input_contact_email_on_demand.send_keys beneficiary_details[:beneficiary_email] if beneficiary_details[:beneficiary_email].present?
        input_contact_address_on_demand.send_keys beneficiary_details[:beneficiary_address] if beneficiary_details[:beneficiary_address].present?
        btn_create_new_contact.click
      end
    end

    def create_new_beneficiary(beneficiary_name)
      input_beneficiary.click
      wait_for { input_search.displayed? }
      input_search.send_keys beneficiary_name
      sleep 2
      if !has_list_item_contact?
        btn_add_new_contact.click
        wait_for { btn_create_new_contact.displayed? }
        input_contact_name_on_demand.clear
        input_contact_name_on_demand.send_keys beneficiary_name
        btn_create_new_contact.click
      else
        list_item_contact.select { |cust| cust.text == beneficiary_name }.first.click
      end
      wait_for { btn_create_expense.displayed? }
    end

    def select_pay_from_account(pay_from_account)
      input_pay_from_account.click
      input_search.send_keys pay_from_account
      wait_for { has_list_item_expense_account? }
      list_item_expense_account.select { |account| account.text == pay_from_account }.first.click if has_list_expense_account?
    end

    def select_payment_method(payment_method)
      input_payment_method.click
      wait_for { popup_select_payment_method.displayed? }
      list_item_payment_method.select { |method| method.text == payment_method }.first.click
      $driver.press_keycode(4) if has_popup_select_payment_method?
    end

    def select_expense_account(expense_account, expense_amount)
      input_expense_account.click
      input_search.send_keys expense_account
      wait_for { has_list_item_expense_account? }
      list_item_expense_account.select { |account| account.text == expense_account }.first.click if has_list_expense_account?
      wait_for { input_expense_amount.displayed? }
      input_expense_amount.click
      input_expense_amount.send_keys expense_amount
      if expense_amount.nil?
        # TODO: get element alert
      else
        wait_for { btn_confirm_input_expense_account.displayed? }
        btn_confirm_input_expense_account.click
      end
      wait_long_for { btn_create_expense.displayed? }
    end

    def edit_expense_account(expense_account, expense_amount)
      btn_edit_expense_account.click
      btn_delete_expense_account.click
      btn_confirm_remove.click
      btn_add_more_expense_account.click
      input_search.send_keys expense_account
      wait_for { has_list_item_expense_account? }
      list_item_expense_account.select { |account| account.text == expense_account }.first.click if has_list_expense_account?
      wait_for { input_expense_amount.displayed? }
      input_expense_amount.click
      input_expense_amount.send_keys expense_amount
      if expense_amount.nil?
        # TODO: get element alert
      else
        wait_for { btn_confirm_input_expense_account.displayed? }
        btn_confirm_input_expense_account.click
      end
      wait_long_for { btn_create_expense.displayed? }
    end

    def select_term(term)
      input_term.click
      wait_for { popup_select_term.displayed? }
      list_item_term.select { |trm| trm.text == term }.first.click
      $driver.press_keycode(4) if has_popup_select_term?
    end

    def input_memo(memo)
      swipe($driver.window_size[:width] - 50, $driver.window_size[:height] - 50, btn_create_expense.location[:x], btn_create_expense.location[:y]) unless has_btn_add_info?
      btn_add_info.click
      input_memo_text.send_keys memo
      btn_confirm_memo.click
    end

    def input_tags(tags)
      swipe($driver.window_size[:width] - 50, $driver.window_size[:height] - 50, btn_create_expense.location[:x], btn_create_expense.location[:y]) unless has_btn_add_info?
      btn_add_info.click
      btn_add_tags.click
      input_search.send_keys tags
      if has_list_item_tags?
        list_item_tags.select { |tag| tag.text == tags }.first.click
      else
        wait_for { btn_add_tags_on_demand.displayed? }
        btn_add_tags_on_demand.click
      end
      sleep 3
      btn_confirm_add_tags.click
      btn_confirm_memo.click
    end
  end
  # rubocop:enable Metrics/ClassLength
end
