When 'user search sales (invoice)(order)(quote) with {string}' do |search_text|
  @search_text = search_text
  if $current_step.include?('order')
    @app.sales_overview_screen.tab_sales_order.click
  elsif $current_step.include?('invoice')
    @app.sales_overview_screen.tab_sales_invoice.click
  else
    @app.sales_overview_screen.tab_sales_quote.click
  end
  sleep 2
  wait_for { @app.sales_overview_screen.input_search.displayed? }
  @app.sales_overview_screen.btn_close_search.click if @app.sales_overview_screen.has_btn_close_search?
  @app.sales_overview_screen.input_search.send_keys @search_text
  $driver.hide_keyboard if $driver.is_keyboard_shown && ENV['PLATFORM'].eql?('android')
  wait_for { @app.sales_overview_screen.has_get_text_sales_list? }
end

Then 'sales (invoice)(order)(quote) search result displayed on the list' do
  expect(@app.sales_overview_screen.has_get_text_sales_list?).to be true
  if $current_step.include?('order')
    @app.sales_overview_screen.tab_sales_order.click
    if ['open', 'closed', 'partially sent'].any? { |x| x == @search_text.downcase }
      @app.sales_overview_screen.get_text_sales_list[0].click
      wait_for { @app.sales_order_detail_screen.txt_sales_order_header.displayed? }
      expect(@app.sales_order_detail_screen.txt_transaction_status.text.downcase).to eq @search_text.downcase
      @app.sales_order_detail_screen.btn_back.click
      wait_for { @app.sales_overview_screen.has_get_text_sales_list? }
    end
  elsif $current_step.include?('invoice')
    @app.sales_overview_screen.tab_sales_invoice.click
    if %w[open paid overdue].any? { |x| x == @search_text.downcase }
      @app.sales_overview_screen.get_text_sales_list[0].click
      wait_for { @app.sales_invoice_detail_screen.txt_sales_invoice_header.displayed? }
      expect(@app.sales_invoice_detail_screen.txt_transaction_status.text.downcase).to eq @search_text.downcase
      @app.sales_invoice_detail_screen.btn_back.click
      wait_for { @app.sales_overview_screen.has_get_text_sales_list? }
    end
  else
    @app.sales_overview_screen.tab_sales_quote.click
    if %w[open closed].any? { |x| x == @search_text.downcase }
      @app.sales_overview_screen.get_text_sales_list[0].click
      wait_for { @app.sales_quote_detail_screen.txt_sales_quote_header.displayed? }
      expect(@app.sales_quote_detail_screen.txt_transaction_status.text.downcase).to eq @search_text.downcase
      @app.sales_quote_detail_screen.btn_back.click
      wait_for { @app.sales_overview_screen.has_get_text_sales_list? }
    end
  end
  $driver.hide_keyboard if $driver.is_keyboard_shown && ENV['PLATFORM'].eql?('android')
end

When 'user validate create new sales order' do
  @order_detail = @app_requirement.sales_order_requirement.load_sales_order_details('sales_order_default').with_indifferent_access
  @app.sales_overview_screen.tab_overview.click unless @app.sales_overview_screen.tab_overview.attribute('selected') == 'true'
  expect(@app.sales_overview_screen.has_btn_open_fam_action_menu?).to be true
  @app.sales_overview_screen.btn_open_fam_action_menu.click
  wait_for { @app.sales_overview_screen.btn_create_sales_order }
  @app.sales_overview_screen.btn_create_sales_order.click
  wait_for { @app.sales_order_form_screen.btn_select_product }
  @app.sales_order_form_screen.btn_close_transaction.click
  wait_for { @app.sales_order_form_screen.btn_yes_cancel_transaction }
  @app.sales_order_form_screen.btn_yes_cancel_transaction.click
  wait_for { @app.sales_overview_screen.btn_open_fam_action_menu }
  @app.sales_overview_screen.tab_sales_order.click unless @app.sales_overview_screen.tab_sales_order.attribute('selected') == 'true'
  @app.sales_overview_screen.btn_open_fam_action_menu.click
  wait_for { @app.sales_order_form_screen.btn_select_product }
  @app.sales_order_form_screen.btn_create_sales_invoice.click
  expect(@app.sales_order_form_screen.message_panel.text).to include "Customer can't be blank"
  @app.sales_order_form_screen.btn_yes_cancel_transaction.click
  @app.sales_order_form_screen.select_product @order_detail[:product_details]
  @app.sales_order_form_screen.btn_create_sales_invoice.click
  expect(@app.sales_order_form_screen.message_panel.text).to include "Customer can't be blank"
  @app.sales_order_form_screen.btn_yes_cancel_transaction.click
  @app.sales_order_form_screen.delete_product @order_detail[:product_details]
  @app.sales_order_form_screen.select_customer @order_detail[:customer_name]
  @app.sales_order_form_screen.btn_create_sales_invoice.click
  expect(@app.sales_order_form_screen.message_panel.text).to include "Items list can't be empty"
  @app.sales_order_form_screen.btn_yes_cancel_transaction.click
  @app.sales_order_form_screen.select_product @order_detail[:product_details]
  @app.sales_order_form_screen.btn_create_sales_invoice.click
  @app.sales_order_form_screen.btn_confirm_create_invoice.click
  wait_for { @app.sales_order_detail_screen.has_txt_sales_order_header? }
  @cur_so_numb = @app.sales_order_detail_screen.txt_transaction_no.text
end

When 'user create new sales order using {string} from {string}' do |order_details, screen_name|
  case screen_name
  when 'sales overview'
    @app.sales_overview_screen.tab_overview.click unless @app.sales_overview_screen.tab_overview.attribute('selected') == 'true'
    expect(@app.sales_overview_screen.has_btn_open_fam_action_menu?).to be true
    @app.sales_overview_screen.btn_open_fam_action_menu.click
    wait_for { @app.sales_overview_screen.btn_create_sales_order }
    @app.sales_overview_screen.btn_create_sales_order.click
  else
    @app.sales_overview_screen.tab_sales_order.click unless @app.sales_overview_screen.tab_sales_order.attribute('selected') == 'true'
    @app.sales_overview_screen.btn_open_fam_action_menu.click
  end

  wait_for { @app.sales_order_form_screen.btn_select_product }
  @order_detail = @app_requirement.sales_order_requirement.load_sales_order_details(order_details).with_indifferent_access
  @app.sales_order_form_screen.fill_order_form(@order_detail)
  wait_for { @app.sales_order_detail_screen.has_txt_sales_order_header? }
  @cur_so_numb = @app.sales_order_detail_screen.txt_transaction_no.text
end

Then 'sales order should be successfully created' do
  wait_for { @app.sales_order_detail_screen.has_txt_sales_order_header? }
  @app.sales_order_detail_screen.verify_sales_order(@order_detail)
  @app.sales_order_detail_screen.common_screen.btn_back.click
end

When 'user validate delete sales order' do
  @app.sales_order_detail_screen.common_screen.btn_back.click if @app.sales_order_detail_screen.common_screen.has_btn_back?
  wait_for { @app.sales_overview_screen.has_get_text_sales_list? }
  step "user create new sales order using 'sales_order_default' from 'sales order'" if @cur_so_numb.nil?
  step "user is on 'sales order tab' screen"
  step "user search sales order with '#{@cur_so_numb}'"
  @app.sales_overview_screen.get_text_sales_list[0].click
  wait_for { @app.sales_order_detail_screen.txt_sales_order_header.displayed? }
  @app.sales_order_detail_screen.btn_three_dot.click
  @app.sales_order_detail_screen.btn_delete.click
  expect(@app.sales_order_detail_screen.text_message.text).to eq 'Once the transaction is deleted, you cannot recover it.'
  @app.sales_order_detail_screen.btn_cancel_delete.click
  @app.sales_order_detail_screen.btn_three_dot.click
  @app.sales_order_detail_screen.btn_delete.click
  @app.sales_order_detail_screen.btn_yes_delete.click
  wait_for { @app.sales_overview_screen.input_search.displayed? }
  @app.sales_overview_screen.input_search.clear
  $driver.hide_keyboard if $driver.is_keyboard_shown && ENV['PLATFORM'].eql?('android')
  expect(@app.sales_overview_screen.has_no_get_text_sales_list?).to be true
end

When 'user create new sales invoice using {string} from {string}' do |invoice_details, screen_name|
  case screen_name
  when 'sales overview'
    @app.sales_overview_screen.btn_open_fam_action_menu.click
    wait_for { @app.sales_overview_screen.has_btn_create_sales_invoice? }
    @app.sales_overview_screen.btn_create_sales_invoice.click
  when 'sales invoice tab'
    @app.sales_overview_screen.btn_open_fam_action_menu.click
  end

  wait_for { @app.sales_invoice_form_screen.txt_new_invoice_title.displayed? }
  @invoice_detail = @app_requirement.sales_invoice_requirement.load_sales_invoice_details(invoice_details).with_indifferent_access
  @app.sales_invoice_form_screen.fill_invoice_form(@invoice_detail)
end

Then 'sales invoice should be successfully created' do
  wait_for { @app.sales_invoice_detail_screen.has_txt_sales_invoice_header? }
  @app.sales_invoice_detail_screen.verify_sales_invoice(@invoice_detail)
  @app.sales_invoice_detail_screen.btn_back.click
end

And 'user create new sales quote using {string} from {string}' do |sales_quote_detail, screen_name|
  case screen_name
  when 'sales overview'
    @app.sales_overview_screen.btn_open_fam_action_menu.click
    wait_for { @app.sales_overview_screen.has_btn_create_sales_quote? }
    @app.sales_overview_screen.btn_create_sales_quote.click
  when 'sales quote tab'
    @app.sales_overview_screen.btn_open_fam_action_menu.click
  end

  wait_for { @app.sales_quote_form_screen.txt_new_quote_title.displayed? }
  @quote_detail = @app_requirement.sales_quote_requirement.load_sales_quote_details(sales_quote_detail).with_indifferent_access
  @app.sales_quote_form_screen.fill_quote_form(@quote_detail)
end

Then 'sales quote should be successfully created' do
  wait_for { @app.sales_quote_detail_screen.has_txt_sales_quote_header? }
  @app.sales_quote_detail_screen.verify_sales_quote(@quote_detail)
  @app.sales_quote_detail_screen.btn_back.click
end

When 'user create new sales order using existing product using {string} from {string}' do |order_details, screen_name|
  case screen_name
  when 'sales overview'
    @app.sales_overview_screen.tab_overview.click unless @app.sales_overview_screen.tab_overview.attribute('selected') == 'true'
    expect(@app.sales_overview_screen.has_btn_open_fam_action_menu?).to be true
    @app.sales_overview_screen.btn_open_fam_action_menu.click
    wait_for { @app.sales_overview_screen.btn_create_sales_order }
    @app.sales_overview_screen.btn_create_sales_order.click
  else
    @app.sales_overview_screen.tab_sales_order.click unless @app.sales_overview_screen.tab_sales_order.attribute('selected') == 'true'
    @app.sales_overview_screen.btn_open_fam_action_menu.click
  end

  wait_for { @app.sales_order_form_screen.btn_select_product }
  @order_detail = @app_requirement.sales_order_requirement.load_sales_order_details(order_details).with_indifferent_access
  @app.sales_order_form_screen.fill_order_form(@order_detail)
  wait_for { @app.sales_order_detail_screen.has_txt_sales_order_header? }
  @cur_so_numb = @app.sales_order_detail_screen.txt_transaction_no.text
end

And 'user edit sales quote using {string} from {string}' do |sales_quote_detail, screen_name|
  case screen_name
  when 'sales overview'
    @app.sales_overview_screen.btn_open_fam_action_menu.click
    wait_for { @app.sales_overview_screen.has_btn_create_sales_quote? }
    @app.sales_overview_screen.btn_create_sales_quote.click
  when 'sales quote tab'
    @app.sales_overview_screen.btn_open_fam_action_menu.click
  end
  wait_for { @app.sales_quote_form_screen.txt_new_quote_title.displayed? }
  @quote_detail = @app_requirement.sales_quote_requirement.load_sales_quote_details(sales_quote_detail).with_indifferent_access
  @app.sales_quote_form_screen.fill_quote_form(@quote_detail)
end

Then 'sales quote should be successfully edited' do
  wait_for { @app.sales_quote_detail_screen.has_txt_sales_quote_header? }
  @app.sales_quote_detail_screen.verify_sales_quote(@quote_detail)
  @app.sales_quote_detail_screen.btn_back.click
end

When 'user create new receive payment using {string}' do |payment_details|
  @payment_details = @app_requirement.receive_payment_requirement.load_payment_details(payment_details)
  wait_for { @app.sales_overview_screen.has_get_text_sales_list? }
  @app.sales_overview_screen.get_text_sales_list.first.click # last created transaction will always be on top of the list
  wait_for { @app.sales_invoice_detail_screen.has_txt_transaction_status? }
  @app.sales_invoice_detail_screen.btn_menu_bottom.click
  wait_for { @app.sales_invoice_detail_screen.has_btn_receive_payment? }
  @app.sales_invoice_detail_screen.btn_receive_payment.click
  wait_for { @app.receive_payment_form_screen.has_input_transaction_date? }
  @app.receive_payment_form_screen.fill_payment_form(@payment_details)
end

Then 'receive payment should be successfully created' do
  wait_for { @app.receive_payment_detail_screen.has_txt_transaction_status? }
  @app.receive_payment_detail_screen.verify_receive_payment(@payment_details)
  until @app.side_menu_screen.has_btn_hamburger_menu?
    @app.receive_payment_detail_screen.common_screen.btn_back.click
    sleep 1
  end
end

Then 'verify sales quote overview screen' do
  wait_for { @app.sales_overview_screen.has_tab_sales_quote? }
  @app.sales_overview_screen.tab_sales_quote.click
  wait_for { @app.sales_overview_screen.has_input_search? }
end
