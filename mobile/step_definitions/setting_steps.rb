When 'user edit company details as {string}' do |contact_details|
  step "user go to 'setting' screen" unless @app.setting_menu_screen.has_company_menu?
  @app.setting_menu_screen.company_menu.click
  @company_details = @app_requirement.setting_requirement.load_setting_details(contact_details).with_indifferent_access
  wait_for { @app.company_screen.has_input_email? }
  @app.company_screen.filling_company_details @company_details
  wait_for { @app.company_screen.has_no_input_email? }
end

Then 'verify user updated company details' do
  @app.setting_menu_screen.company_menu.click
  wait_for { @app.company_screen.has_input_email? }
  @app.company_screen.verify_company_details @company_details
end

Then 'verify user updated setting transction details' do
  @app.setting_menu_screen.transaction_menu.click
  wait_for { @app.setting_transaction_screen.has_dd_invoice_term? }
  @app.setting_transaction_screen.verify_setting_transaction_details @setting_details
end

When 'user edit setting transaction as {string}' do |setting_details|
  step "user go to 'setting' screen" unless @app.setting_menu_screen.has_company_menu?
  @app.setting_menu_screen.transaction_menu.click
  @setting_details = @app_requirement.setting_requirement.load_setting_details(setting_details).with_indifferent_access
  wait_for { @app.setting_transaction_screen.has_dd_invoice_term? }
  @app.setting_transaction_screen.filling_setting_details @setting_details
  wait_for { @app.setting_transaction_screen.has_no_dd_invoice_term? }
end

When 'user switch to {string} company' do |type|
  step "user go to 'setting' screen" unless @app.setting_menu_screen.has_company_menu?
  @current_company = @app.company_screen.name_current_company.text
  if type.eql? 'other'
    @app.setting_menu_screen.list_of_company_menu.click
    wait_for { @app.company_screen.has_list_company_name? }
    @app.company_screen.list_company_name.select { |name| name.click if name.text != @current_company }
    wait_short_for(optional_element: true) { @app.dashboard_screen.has_popup_feedback? || @app.dashboard_screen.has_popup_new_feature? }
    @app.dashboard_screen.btn_close_feedback.click if @app.dashboard_screen.has_popup_feedback?
    @app.dashboard_screen.btn_close_new_feature.click while @app.dashboard_screen.has_popup_new_feature?
    @app.side_menu_screen.btn_hamburger_menu.click
    wait_for { @app.side_menu_screen.has_company_name? }
    expect(@app.side_menu_screen.company_name.text).not_to eq @current_company
    swipe_direction 'left'
  end
end

Then 'user verify transaction tab as {string}' do |user_name|
  step "user go to 'setting' screen" unless @app.setting_menu_screen.has_company_menu?
  @app.setting_menu_screen.transaction_menu.click
  wait_for { @app.setting_transaction_screen.has_dd_invoice_term? || @app.setting_transaction_screen.has_dd_purchase_term? }
  aggregate_failures('Verifying setting transaction details') do
    if user_name.include? 'sales'
      expect(@app.setting_transaction_screen.has_dd_invoice_term?).to be true
      expect(@app.setting_transaction_screen.has_input_sales_message?).to be true
      expect(@app.setting_transaction_screen.has_input_delivery_message?).to be true
      expect(@app.setting_transaction_screen.has_cb_sales_shipping_info?).to be true
      expect(@app.setting_transaction_screen.has_cb_sales_discount_perlines?).to be true
      expect(@app.setting_transaction_screen.has_cb_sales_discount?).to be true
      expect(@app.setting_transaction_screen.has_cb_sales_deposit?).to be true
      swipe_until_find('up', @app.setting_transaction_screen.cb_sales_deposit_params)
      expect(@app.setting_transaction_screen.has_dd_purchase_term?).to be false
    elsif user_name.include? 'purchase'
      expect(@app.setting_transaction_screen.has_dd_invoice_term?).to be false
      expect(@app.setting_transaction_screen.has_dd_purchase_term?).to be true
      expect(@app.setting_transaction_screen.has_input_po_message?).to be true
      expect(@app.setting_transaction_screen.has_cb_purchase_shipping_info?).to be true
      expect(@app.setting_transaction_screen.has_cb_purchase_discount_perlines?).to be true
      expect(@app.setting_transaction_screen.has_cb_purchase_discount?).to be true
      expect(@app.setting_transaction_screen.has_cb_purchase_deposit?).to be true
    end
  end
end

When 'user switch language to {string}' do |target_language|
  language = {
    'Bahasa': %w[Inggris Indonesia],
    'English': %w[English Bahasa]
  }.with_indifferent_access
  @target_language = target_language
  wait_for { @app.dashboard_screen.has_txt_business_overview? }
  unless (@app.dashboard_screen.txt_business_overview.text.eql? 'Ringkasan Bisnis') && @target_language.casecmp('bahasa').zero?
    step "user go to 'setting' screen" unless @app.setting_menu_screen.has_company_menu?
    @app.setting_menu_screen.language_menu.click
    wait_for { @app.language_screen.has_text_language? }
    @app.language_screen.text_language(text: language['English'][1]).click if @target_language.casecmp('bahasa').zero?
    @app.language_screen.text_language(text: language['Bahasa'][0]).click if @target_language.casecmp('english').zero?
    wait_for { @app.company_screen.has_modal_confirmation_yes? }
    @app.company_screen.modal_confirmation_yes.click
    wait_short_for(optional_element: true) { @app.dashboard_screen.has_popup_feedback? || @app.dashboard_screen.has_popup_new_feature? }
    @app.dashboard_screen.btn_close_feedback.click if @app.dashboard_screen.has_popup_feedback?
    @app.dashboard_screen.btn_close_new_feature.click while @app.dashboard_screen.has_popup_new_feature?
    sleep 2
    wait_for { @app.dashboard_screen.has_txt_business_overview? }
  end
end

Then 'verify user language changed' do
  expect(@app.dashboard_screen.txt_business_overview.text).to eq 'Ringkasan Bisnis' if @target_language.casecmp('bahasa').zero?
  expect(@app.dashboard_screen.txt_business_overview.text).to eq 'Business Overview' if @target_language.casecmp('english').zero?
end

Then 'verify user menu {string}' do |menu|
  case menu
  when 'Contact Us'
    wait_for { @app.contact_us_screen.has_text_to? }
    expect(@app.contact_us_screen.text_to.text.delete('<').gsub('>,', '').strip).to eq 'halojurnal@notnotnot.com'
    expect(@app.contact_us_screen.text_cc.text.delete('<').gsub('>,', '').strip).to eq 'squadron@notnotnot.com'
  when 'Guide Book'
    wait_for { @app.guide_book_screen.has_input_search_guide_book? }
    expect(@app.guide_book_screen.has_input_search_guide_book?).to be true
  when 'Privacy Policy'
    wait_for { @app.privacy_policy_screen.has_webv_privacy_policy? }
    expect(@app.privacy_policy_screen.has_webv_privacy_policy?).to be true
  when 'App Info'
    wait_for { @app.app_info_screen.has_text_app_info? }
    expect(@app.app_info_screen.has_text_app_info?).to be true
    $driver.back
    wait_for { @app.setting_menu_screen.has_app_info_menu? }
  else
    p 'menu action not declare'
  end
end
