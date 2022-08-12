module Android
  class SendPaymentFormScreen < Appom::Page
    section :common_screen, CommonScreen, 'id', 'android:id/content'
    element :btn_create_send_payment, :id, 'tvCreate'
    element :txt_invoice_no, :id, 'tvInvoiceNo'
    element :input_transaction_date, :id, 'tvPaymentDate'
    element :input_deposit_to, :id, 'tvDepositTo'
    element :txt_payment_method, :id, 'tvPaymentMethod'
    element :popup_payment_method, :id, 'tvSelectPaymentMethodTitle'
    element :txt_payment_amount, :id, 'tvPaymentAmount'
    element :popup_payment_amount, :id, 'lnAmount'
    element :input_payment_amount, :id, 'edtAmount'
    element :btn_confirm_payment_amount, :id, 'tvAdd'
    element :btn_add_other_info, :id, 'tvAddOtherInfo'
    element :btn_save_other_info, :id, 'tvSave'
    element :btn_input_memo, :id, 'edtMemo'
    element :add_tags, :id, 'tvTag'
    element :btn_confirm_add_tags, :id, 'btn_create'
    element :tags_list, :id, 'rl_product_and_service'

    def fill_payment_form(payment_details)
      select_datepicker(input_transaction_date, payment_details['payment_details']['payment_date'])
      fill_payment_amount payment_details['payment_details']['payment_amount']
      input_payment_method payment_details['payment_details']['payment_method']
      input_other_info payment_details if payment_details['memo'].present? || payment_details['tags'].present?
      wait_for { btn_create_send_payment.displayed? }
      btn_create_send_payment.click
    end

    def fill_payment_amount(amount)
      txt_payment_amount.click
      wait_for { popup_payment_amount.displayed? }
      input_payment_amount.clear
      input_payment_amount.send_keys amount
      btn_confirm_payment_amount.click
    end

    def input_payment_method(method)
      txt_payment_method.click
      wait_for { popup_payment_method.displayed? }
      $driver.find_element(:xpath, "//android.widget.TextView[@text='#{method}']").click
      $driver.press_keycode(4) if has_popup_payment_method?
      wait_for { btn_create_send_payment.displayed? }
    end

    def input_other_info(payment_details)
      btn_add_other_info.click
      wait_for { btn_input_memo.displayed? }
      btn_input_memo.send_keys payment_details['memo'] if payment_details['memo'].present?
      if payment_details['tags'].present?
        add_tags.click
        wait_for { btn_confirm_add_tags.displayed? }
        wait_for { tags_list.displayed? }
        p "//android.widget.TextView[@resource-id='id.jurnal.mobile:id/tv_tags_name'][@text='#{payment_details['tags']}']"
        $driver.find_element(:xpath, "//android.widget.TextView[@resource-id='id.jurnal.mobile:id/tv_tags_name'][@text='#{payment_details['tags']}']").click
        btn_confirm_add_tags.click
      end
      wait_for { btn_save_other_info.displayed? }
      btn_save_other_info.click
    end
  end
end
