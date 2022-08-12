When 'user search purchase (invoice)(order) with {string}' do |search_text|
  sleep 2
  @search_text = search_text
  $current_step.include?('order') ? @app.purchase_overview_screen.tab_purchase_order.click : @app.purchase_overview_screen.tab_purchase_invoice.click
  wait_for { @app.purchase_overview_screen.input_search.displayed? }
  @app.purchase_overview_screen.btn_close_search.click if @app.purchase_overview_screen.has_btn_close_search?
  @app.purchase_overview_screen.input_search.send_keys @search_text
  $driver.press_keycode(66) if ENV['PLATFORM'].eql? 'android' # press enter to close the keyboard
  wait_for { @app.purchase_overview_screen.has_get_text_purchase_list? }
end

Then 'purchase (invoice)(order) search result displayed on the list' do
  expect(@app.purchase_overview_screen.has_get_text_purchase_list?).to be true
  $current_step.include?('order') ? @app.purchase_overview_screen.tab_purchase_order.click : @app.purchase_overview_screen.tab_purchase_invoice.click
  if $current_step.include?('order')
    if %w[open closed].any? { |x| x == @search_text.downcase }
      @app.purchase_overview_screen.get_text_purchase_list[0].click
      wait_for { @app.purchase_order_detail_screen.txt_purchase_order_header.displayed? }
      expect(@app.purchase_order_detail_screen.txt_transaction_status.text.downcase).to eq @search_text.downcase
      @app.purchase_order_detail_screen.btn_back.click
      wait_for { @app.purchase_overview_screen.has_get_text_purchase_list? }
    end
  elsif $current_step.include?('invoice')
    if %w[open paid overdue].any? { |x| x == @search_text.downcase }
      @app.purchase_overview_screen.get_text_purchase_list[0].click
      wait_for { @app.purchase_invoice_detail_screen.txt_purchase_invoice_header.displayed? }
      expect(@app.purchase_invoice_detail_screen.txt_transaction_status.text.downcase).to eq @search_text.downcase
      @app.purchase_invoice_detail_screen.btn_back.click
      wait_for { @app.purchase_overview_screen.has_get_text_purchase_list? }
    end
  end
  $driver.hide_keyboard if $driver.is_keyboard_shown && ENV['PLATFORM'].eql?('android')
end

When 'user validate create new purchase order' do
  @order_detail = @app_requirement.purchase_order_requirement.load_purchase_order_details('purchase_order_default').with_indifferent_access
  @app.purchase_overview_screen.tab_overview.click unless @app.purchase_overview_screen.tab_overview.attribute('selected') == 'true'
  expect(@app.purchase_overview_screen.has_btn_open_fam_action_menu?).to be true
  @app.purchase_overview_screen.btn_open_fam_action_menu.click
  wait_for { @app.purchase_overview_screen.btn_create_purchase_order }
  @app.purchase_overview_screen.btn_create_purchase_order.click
  wait_for { @app.purchase_order_form_screen.btn_select_product }
  @app.purchase_order_form_screen.btn_close_transaction.click
  wait_for { @app.purchase_order_form_screen.btn_yes_cancel_transaction }
  @app.purchase_order_form_screen.btn_yes_cancel_transaction.click
  wait_for { @app.purchase_overview_screen.btn_open_fam_action_menu }
  @app.purchase_overview_screen.tab_purchase_order.click unless @app.purchase_overview_screen.tab_purchase_order.attribute('selected') == 'true'
  @app.purchase_overview_screen.btn_open_fam_action_menu.click
  wait_for { @app.purchase_order_form_screen.btn_select_product }
  @app.purchase_order_form_screen.btn_create_purchase_invoice.click
  expect(@app.purchase_order_form_screen.message_panel.text).to include "Customer can't be blank"
  @app.purchase_order_form_screen.btn_yes_cancel_transaction.click
  @app.purchase_order_form_screen.select_product @order_detail[:product_details]
  @app.purchase_order_form_screen.btn_create_purchase_invoice.click
  expect(@app.purchase_order_form_screen.message_panel.text).to include "Customer can't be blank"
  @app.purchase_order_form_screen.btn_yes_cancel_transaction.click
  @app.purchase_order_form_screen.delete_product @order_detail[:product_details]
  @app.purchase_order_form_screen.select_customer @order_detail[:customer_name]
  @app.purchase_order_form_screen.btn_create_purchase_invoice.click
  expect(@app.purchase_order_form_screen.message_panel.text).to include "Items list can't be empty"
  @app.purchase_order_form_screen.btn_yes_cancel_transaction.click
  @app.purchase_order_form_screen.select_product @order_detail[:product_details]
  @app.purchase_order_form_screen.btn_create_purchase_invoice.click
  @app.purchase_order_form_screen.btn_confirm_create_invoice.click
  wait_for { @app.purchase_order_detail_screen.has_txt_purchase_order_header? }
  @cur_so_numb = @app.purchase_order_detail_screen.txt_transaction_no.text
end

When 'user create new purchase order using {string} from {string}' do |order_details, screen_name|
  case screen_name
  when 'purchase overview'
    @app.purchase_overview_screen.tab_overview.click unless @app.purchase_overview_screen.tab_overview.attribute('selected') == 'true'
    expect(@app.purchase_overview_screen.has_btn_open_fam_action_menu?).to be true
    @app.purchase_overview_screen.btn_open_fam_action_menu.click
    wait_for { @app.purchase_overview_screen.btn_create_purchase_order }
    @app.purchase_overview_screen.btn_create_purchase_order.click
  when 'purchase order tab'
    @app.purchase_overview_screen.tab_purchase_order.click unless @app.purchase_overview_screen.tab_purchase_order.attribute('selected') == 'true'
    expect(@app.purchase_overview_screen.has_btn_floating_menu?).to be true
    @app.purchase_overview_screen.btn_open_fam_action_menu.click
  end
  wait_for { @app.purchase_order_form_screen.txt_new_order_title.displayed? }
  @order_detail = @app_requirement.purchase_order_requirement.load_purchase_order_details(order_details).with_indifferent_access
  @app.purchase_order_form_screen.fill_order_form(@order_detail)
end

Then 'purchase order should be successfully created' do
  wait_for { @app.purchase_order_detail_screen.has_txt_purchase_order_header? }
  @app.purchase_order_detail_screen.verify_purchase_order(@order_detail)
  @app.purchase_order_detail_screen.btn_back.click
end

When 'user validate delete purchase order' do
  reopen_app if @app.common_screen.has_btn_back?
  step "user create new purchase order using 'purchase_order_default' from 'purchase order'" if @cur_so_numb.nil?
  step "user is on 'purchase order' screen"
  step "user search purchase order with '#{@cur_so_numb}'"
  @app.purchase_overview_screen.get_text_purchase_list[0].click
  wait_for { @app.purchase_order_detail_screen.txt_purchase_order_header.displayed? }
  @app.purchase_order_detail_screen.btn_three_dot.click
  @app.purchase_order_detail_screen.btn_delete.click
  expect(@app.purchase_order_detail_screen.text_message.text).to eq 'Once the transaction is deleted, you cannot recover it.'
  @app.purchase_order_detail_screen.btn_cancel_delete.click
  @app.purchase_order_detail_screen.btn_three_dot.click
  @app.purchase_order_detail_screen.btn_delete.click
  @app.purchase_order_detail_screen.btn_yes_delete.click
  expect(@app.common_screen.text_toast_message.text).to eq 'Transaction Successfully Deleted'
end

When 'user create new purchase invoice using {string} from {string}' do |invoice_details, screen_name|
  case screen_name
  when 'purchase overview'
    @app.purchase_overview_screen.btn_open_fam_action_menu.click
    wait_for { @app.purchase_overview_screen.btn_create_purchase_invoice.displayed? }
    @app.purchase_overview_screen.btn_create_purchase_invoice.click
  when 'purchase invoice tab'
    @app.purchase_overview_screen.btn_floating_menu.click
  when 'purchase invoice form'
    wait_for { @app.purchase_invoice_form_screen.txt_new_invoice_title.displayed? }
  end
  wait_for { @app.purchase_invoice_form_screen.txt_new_invoice_title.displayed? }
  @invoice_detail = @app_requirement.purchase_invoice_requirement.load_purchase_invoice_details(invoice_details).with_indifferent_access
  @app.purchase_invoice_form_screen.fill_invoice_form(@invoice_detail)
end

Then 'purchase invoice should be successfully (created)(edited)' do
  sleep 2
  wait_for { @app.purchase_invoice_detail_screen.has_txt_transaction_no? }
  @app.purchase_invoice_detail_screen.verify_purchase_invoice(@invoice_detail)
  @app.purchase_invoice_detail_screen.btn_back.click
end

When 'user edit purchase invoice using {string}' do |edit_details|
  wait_for { @app.purchase_overview_screen.has_tab_purchase_invoice? }
  @app.purchase_overview_screen.tab_purchase_invoice.click
  wait_for { @app.purchase_overview_screen.has_get_text_purchase_list? }
  @app.purchase_overview_screen.get_text_purchase_list.first.click # the last created transaction will always be at the top
  wait_for { @app.purchase_invoice_detail_screen.has_txt_transaction_no? }
  @app.purchase_invoice_detail_screen.btn_menu.click
  wait_for { @app.purchase_invoice_detail_screen.has_btn_edit? }
  @app.purchase_invoice_detail_screen.btn_edit.click
  sleep 2
  # wait_for { @app.purchase_invoice_form_screen.common_screen.has_no_progress_bar_loading? }
  @invoice_detail = @app_requirement.purchase_invoice_requirement.load_purchase_invoice_details(edit_details).with_indifferent_access
  @app.purchase_invoice_form_screen.fill_invoice_form(@invoice_detail, true)
end

When 'user create new send payment using {string}' do |payment_details|
  @payment_details = @app_requirement.send_payment_requirement.load_payment_details(payment_details)
  wait_for { @app.purchase_overview_screen.has_get_text_purchase_list? }
  @app.purchase_overview_screen.get_text_purchase_list.first.click # last created transaction will always be on top of the list
  wait_for { @app.purchase_invoice_detail_screen.has_txt_transaction_status? }
  @app.purchase_invoice_detail_screen.btn_menu_bottom.click
  wait_for { @app.purchase_invoice_detail_screen.has_btn_send_payment? }
  @app.purchase_invoice_detail_screen.btn_send_payment.click
  wait_for { @app.send_payment_form_screen.has_input_transaction_date? }
  @app.send_payment_form_screen.fill_payment_form(@payment_details)
end

Then 'send payment should be successfully created' do
  wait_for { @app.send_payment_detail_screen.has_txt_transaction_status? }
  @app.send_payment_detail_screen.verify_send_payment(@payment_details)
  until @app.side_menu_screen.has_btn_hamburger_menu?
    @app.send_payment_detail_screen.common_screen.btn_back.click
    sleep 1
  end
end

Then 'view send payment information' do
  wait_for { @app.send_payment_detail_screen.has_txt_transaction_status? }
  @app.send_payment_detail_screen.verify_send_payment(@payment_details)
end

When 'user create new purchase order using {string} changed to {string} from {string}' do |order_details_before, order_details, screen_name|
  case screen_name
  when 'purchase overview'
    @app.purchase_overview_screen.tab_overview.click unless @app.purchase_overview_screen.tab_overview.attribute('selected') == 'true'
    expect(@app.purchase_overview_screen.has_btn_open_fam_action_menu?).to be true
    @app.purchase_overview_screen.btn_open_fam_action_menu.click
    wait_for { @app.purchase_overview_screen.btn_create_purchase_order }
    @app.purchase_overview_screen.btn_create_purchase_order.click
  end
  wait_for { @app.purchase_order_form_screen.txt_new_order_title.displayed? }
  @order_detail_before = @app_requirement.purchase_order_requirement.load_purchase_order_details(order_details_before).with_indifferent_access
  @app.purchase_order_form_screen.fill_order_before_edit(@order_detail_before)
  @order_detail = @app_requirement.purchase_order_requirement.load_purchase_order_details(order_details).with_indifferent_access
  @app.purchase_order_form_screen.fill_order_form(@order_detail)
end

When 'user create new purchase invoice using {string} from {string} clicking create new button' do |invoice_details, screen_name|
  case screen_name
  when 'purchase overview'
    @app.purchase_overview_screen.btn_open_fam_action_menu.click
    wait_for { @app.purchase_overview_screen.btn_create_purchase_invoice.displayed? }
    @app.purchase_overview_screen.btn_create_purchase_invoice.click
  when 'purchase invoice tab'
    @app.purchase_overview_screen.btn_floating_menu.click
  end

  wait_for { @app.purchase_invoice_form_screen.txt_new_invoice_title.displayed? }
  @invoice_detail = @app_requirement.purchase_invoice_requirement.load_purchase_invoice_details(invoice_details).with_indifferent_access
  @app.purchase_invoice_form_screen.fill_invoice_form(@invoice_detail, false, true)
end

When 'user create purchase invoice using {string} from {string} then edit deposit with {string}' do |purchase_invoice_with_deposit, screen_name, purchase_invoice_edit_deposit|
  @purchase_invoice_with_deposit = @app_requirement.purchase_invoice_requirement.load_purchase_invoice_details(purchase_invoice_with_deposit).with_indifferent_access
  @purchase_invoice_edit_deposit = @app_requirement.purchase_invoice_requirement.load_purchase_invoice_details(purchase_invoice_edit_deposit).with_indifferent_access
  wait_for { @app.purchase_overview_screen.has_tab_purchase_invoice? }
  @app.purchase_overview_screen.tab_purchase_invoice.click
  wait_for { @app.purchase_overview_screen.has_get_text_purchase_list? }
  case screen_name
  when 'purchase invoice tab'
    @app.purchase_overview_screen.btn_floating_menu.click
  end
  wait_for { @app.purchase_invoice_form_screen.txt_new_invoice_title.displayed? }
  @app.purchase_invoice_form_screen.fill_invoice_form_with_deposit(@purchase_invoice_with_deposit)
  wait_for { @app.purchase_invoice_detail_screen.has_txt_transaction_no? }
  @app.purchase_invoice_detail_screen.btn_menu.click
  wait_for { @app.purchase_invoice_detail_screen.btn_edit.displayed? }
  @app.purchase_invoice_detail_screen.btn_edit.click
  wait_for { @app.purchase_invoice_form_screen.txt_new_invoice_title.displayed? }
  @app.purchase_invoice_form_screen.update_deposit(@purchase_invoice_edit_deposit)
  wait_for { @app.purchase_invoice_form_screen.btn_create_purchase_invoice.displayed? }
  @app.purchase_invoice_form_screen.btn_create_purchase_invoice.click
end

Then 'purchase invoice with deposit should be successfully (edited)' do
  wait_for { @app.purchase_invoice_detail_screen.has_txt_transaction_no? }
  sleep 5
  @app.purchase_invoice_detail_screen.verify_purchase_invoice_deposit(@purchase_invoice_edit_deposit)
  @app.purchase_invoice_detail_screen.btn_back.click
end

When 'user create purchase invoice using {string} from {string}' do |purchase_invoice_with_deposit, screen_name|
  @purchase_invoice_with_deposit = @app_requirement.purchase_invoice_requirement.load_purchase_invoice_details(purchase_invoice_with_deposit).with_indifferent_access
  wait_for { @app.purchase_overview_screen.has_tab_purchase_invoice? }
  @app.purchase_overview_screen.tab_purchase_invoice.click
  wait_for { @app.purchase_overview_screen.has_get_text_purchase_list? }
  case screen_name
  when 'purchase invoice tab'
    @app.purchase_overview_screen.btn_floating_menu.click
  end
  wait_for { @app.purchase_invoice_form_screen.txt_new_invoice_title.displayed? }
  @app.purchase_invoice_form_screen.fill_invoice_form_with_deposit(@purchase_invoice_with_deposit)
  wait_for { @app.purchase_invoice_detail_screen.has_txt_transaction_no? }
  @app.purchase_invoice_detail_screen.btn_menu.click
  wait_for { @app.purchase_invoice_detail_screen.btn_edit.displayed? }
  @app.purchase_invoice_detail_screen.btn_edit.click
end

Then 'delete deposit of purchase invoice' do
  sleep 1
  wait_for { @app.purchase_invoice_form_screen.txt_deposit_value.displayed? }
  @app.purchase_invoice_form_screen.txt_deposit_value.click
  wait_for { @app.purchase_invoice_form_screen.input_deposit_amount.displayed? }
  @app.purchase_invoice_form_screen.btn_delete_discount.click
  wait_for { @app.purchase_invoice_form_screen.btn_create_purchase_invoice.displayed? }
  @app.purchase_invoice_form_screen.btn_create_purchase_invoice.click
end

Then 'purchase invoice with deposit should be successfully edited with no deposit' do
  wait_for { @app.purchase_invoice_detail_screen.has_txt_transaction_no? }
  sleep 5
  wait_for { @app.purchase_invoice_detail_screen.has_no_txt_deposit? }
  @app.purchase_invoice_detail_screen.btn_back.click
end
