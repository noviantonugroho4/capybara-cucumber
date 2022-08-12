Then 'user is on {string} screen' do |screen_name|
  case screen_name
  when 'dashboard'
    expect(@app.dashboard_screen.txt_business_overview.displayed?).to be true
  when 'sales overview'
    expect(@app.sales_overview_screen.widget_open_invoice.displayed?).to be true
    expect(@app.sales_overview_screen.widget_overdue_invoice.displayed?).to be true
    expect(@app.sales_overview_screen.widget_payment_received.displayed?).to be true
    expect(@app.sales_overview_screen.txt_total_open_transaction.displayed?).to be true
    expect(@app.sales_overview_screen.txt_total_overdue_transaction.displayed?).to be true
    expect(@app.sales_overview_screen.txt_total_payment_received.displayed?).to be true
    expect(@app.sales_overview_screen.txt_total_open_amount.displayed?).to be true
    expect(@app.sales_overview_screen.txt_total_overdue_amount.displayed?).to be true
    expect(@app.sales_overview_screen.txt_total_payment_amount.displayed?).to be true
  when 'sales invoice tab', 'sales order tab', 'sales quote tab'
    expect(@app.sales_overview_screen.input_search.displayed?).to be true
    expect(@app.sales_overview_screen.has_get_text_sales_list?).to be true
  when 'purchase overview'
    expect(@app.purchase_overview_screen.widget_open_invoice.displayed?).to be true
    expect(@app.purchase_overview_screen.widget_overdue_invoice.displayed?).to be true
    expect(@app.purchase_overview_screen.widget_payment_sent.displayed?).to be true
    expect(@app.purchase_overview_screen.txt_total_open_amount.displayed?).to be true
    expect(@app.purchase_overview_screen.txt_total_overdue_amount.displayed?).to be true
    expect(@app.purchase_overview_screen.txt_total_payment_amount.displayed?).to be true
  when 'purchase invoice tab', 'purchase order'
    expect(@app.purchase_overview_screen.input_search.displayed?).to be true
    expect(@app.purchase_overview_screen.btn_floating_menu.displayed?).to be true
  when 'expense overview'
    expect(@app.expense_overview_screen.widget_expenses_this_month.displayed?).to be true
    expect(@app.expense_overview_screen.widget_last_30_days.displayed?).to be true
    expect(@app.expense_overview_screen.widget_open_expenses.displayed?).to be true
  when 'cash and bank overview'
    expect(@app.cash_and_bank_overview_screen.tab_cash_and_bank.displayed?).to be true
    expect(@app.cash_and_bank_overview_screen.tab_credit_card.displayed?).to be true
    expect(@app.cash_and_bank_overview_screen.txt_recieveable_next_30_days.displayed?).to be true
    expect(@app.cash_and_bank_overview_screen.txt_payable_next_30_days.displayed?).to be true
    expect(@app.cash_and_bank_overview_screen.txt_cash_balance.displayed?).to be true
    expect(@app.cash_and_bank_overview_screen.txt_credit_card_balance.displayed?).to be true
  when 'setting'
    expect(@app.setting_menu_screen.list_of_company_menu.displayed?).to be true
    expect(@app.setting_menu_screen.company_menu.displayed?).to be true
    expect(@app.setting_menu_screen.transaction_menu.displayed?).to be true
    expect(@app.setting_menu_screen.push_notification_menu.displayed?).to be true
    expect(@app.setting_menu_screen.security_menu.displayed?).to be true
    expect(@app.setting_menu_screen.contact_us_menu.displayed?).to be true
  end
end

Then 'user go to {string} screen' do |screen_name|
  # IF OUR REQUEST TO HIDE FEATURE POPUP HAS BEEN COMPLETED BY DEV TEAM, DELETE LINE 46-50, 54-58, 64-68, 99-103, 86-87, 92-93

  @app.dashboard_screen.btn_close_feedback.click if @app.dashboard_screen.has_popup_feedback?
  @app.dashboard_screen.btn_close_new_feature.click while @app.dashboard_screen.has_popup_new_feature?
  if ENV['PLATFORM'].casecmp('ios').zero?
    @app.dashboard_screen.popup_survey_close.click if @app.dashboard_screen.has_popup_survey?
  end
  @app.side_menu_screen.btn_hamburger_menu.click unless @app.side_menu_screen.has_dashboard_menu?
  case screen_name.downcase
  when 'dashboard'
    @app.side_menu_screen.dashboard_menu.click
  when 'sales overview'
    @app.side_menu_screen.sales_menu.click
    sleep 2
    if ENV['PLATFORM'].casecmp('android').zero?
      sleep 2
      if @app.sales_overview_screen.has_product_tour?
        @app.sales_overview_screen.next_product_tour.click
        @app.sales_overview_screen.skip_product_tour.click
      end
    end
    @app.sales_overview_screen.tab_overview.click
  when 'sales invoice tab'
    @app.side_menu_screen.sales_menu.click
    sleep 2
    if ENV['PLATFORM'].casecmp('android').zero?
      sleep 2
      if @app.sales_overview_screen.has_product_tour?
        @app.sales_overview_screen.next_product_tour.click
        @app.sales_overview_screen.skip_product_tour.click
      end
    end
    wait_for { @app.sales_overview_screen.has_tab_sales_invoice? }
    @app.sales_overview_screen.tab_sales_invoice.click
    wait_for { @app.sales_overview_screen.has_input_search? }
  when 'sales order tab'
    @app.side_menu_screen.sales_menu.click
    sleep 2
    if ENV['PLATFORM'].casecmp('android').zero?
      sleep 2
      if @app.sales_overview_screen.has_product_tour?
        @app.sales_overview_screen.next_product_tour.click
        @app.sales_overview_screen.skip_product_tour.click
      end
    end
    wait_for { @app.sales_overview_screen.has_tab_sales_order? }
    @app.sales_overview_screen.tab_sales_order.click
    wait_for { @app.sales_overview_screen.has_input_search? }
  when 'purchase overview'
    @app.side_menu_screen.purchases_menu.click
  when 'purchase invoice tab'
    @app.side_menu_screen.purchases_menu.click
    wait_for { @app.purchase_overview_screen.has_tab_purchase_invoice? }
    @app.purchase_overview_screen.tab_purchase_invoice.click
    wait_for { @app.purchase_overview_screen.has_input_search? }
  when 'purchase order tab'
    @app.side_menu_screen.purchases_menu.click
    wait_for { @app.purchase_overview_screen.has_tab_purchase_order? }
    @app.purchase_overview_screen.tab_purchase_order.click
    wait_for { @app.purchase_overview_screen.has_input_search? }
  when 'expense overview'
    @app.side_menu_screen.expenses_menu.click
    sleep 2
    if ENV['PLATFORM'].casecmp('android').zero?
      @app.expense_overview_screen.close_product_tour.click if @app.expense_overview_screen.has_product_tour?
    end
    wait_for { @app.expense_overview_screen.has_tab_overview? }
    @app.expense_overview_screen.tab_overview.click
  when 'expense tab'
    @app.side_menu_screen.expenses_menu.click
    sleep 2
    if ENV['PLATFORM'].casecmp('android').zero?
      @app.expense_overview_screen.close_product_tour.click if @app.expense_overview_screen.has_product_tour?
    end
    wait_for { @app.expense_overview_screen.has_tab_overview? }
    @app.expense_overview_screen.tab_expenses.click
    wait_for { @app.expense_overview_screen.has_input_search? }
  when 'sales quote tab'
    @app.side_menu_screen.sales_menu.click
    sleep 2
    if ENV['PLATFORM'].casecmp('android').zero?
      sleep 2
      if @app.sales_overview_screen.has_product_tour?
        @app.sales_overview_screen.next_product_tour.click
        @app.sales_overview_screen.skip_product_tour.click
      end
    end
    wait_for { @app.sales_overview_screen.has_tab_sales_quote? }
    @app.sales_overview_screen.tab_sales_quote.click
    wait_for { @app.sales_overview_screen.has_input_search? }
  when 'customers tab'
    @app.side_menu_screen.contacts_menu.click
    wait_for { @app.contact_overview_screen.has_customers_tab? }
    @app.contact_overview_screen.customers_tab.click
  when 'vendors tab'
    @app.side_menu_screen.contacts_menu.click
    wait_for { @app.contact_overview_screen.has_vendors_tab? }
    @app.contact_overview_screen.vendors_tab.click
  when 'cash and bank overview'
    @app.side_menu_screen.cash_and_bank_menu.click
    sleep 2
    wait_for { @app.cash_and_bank_overview_screen.has_tab_overview? }
    wait_for { @app.cash_and_bank_overview_screen.has_btn_open_fam_action_menu? }
  when 'setting'
    @app.side_menu_screen.setting_menu.click
    sleep 2
    wait_for { @app.setting_menu_screen.has_header_options? }
  when 'contact us'
    step "user go to 'setting' screen"
    swipe_until_find('up', @app.setting_menu_screen.app_info_menu_params)
    @app.setting_menu_screen.contact_us_menu.click
  when 'app info'
    step "user go to 'setting' screen"
    swipe_until_find('up', @app.setting_menu_screen.app_info_menu_params)
    @app.setting_menu_screen.app_info_menu.click
  when 'privacy policy'
    step "user go to 'setting' screen"
    swipe_until_find('up', @app.setting_menu_screen.app_info_menu_params)
    @app.setting_menu_screen.privacy_policy_menu.click
  when 'guide book'
    step "user go to 'setting' screen"
    swipe_until_find('up', @app.setting_menu_screen.app_info_menu_params)
    wait_for { @app.setting_menu_screen.guide_book_menu.displayed? }
    @app.setting_menu_screen.guide_book_menu.click
  when 'products menu'
    @app.side_menu_screen.products_menu.click
    wait_for { @app.product_screen.has_product_service_tab? }
    wait_for { @app.product_screen.has_create_product_btn? }
  end
end
