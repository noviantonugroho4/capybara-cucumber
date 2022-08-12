And 'user create new (customer)(vendor) using {string}' do |contact_details|
  @contact_details = @app_requirement.contact_requirement.load_contact_details(contact_details).with_indifferent_access
  @app.contact_overview_screen.btn_open_floating_menu.click
  wait_short_for { @app.contact_overview_screen.btn_close_floating_menu.displayed? }
  $current_step.include?('customer') ? @app.contact_overview_screen.btn_create_customer.click : @app.contact_overview_screen.btn_create_vendor.click
  wait_for { @app.contact_form_screen.has_input_name? }
  @app.contact_form_screen.fill_contact(@contact_details)
end

Then '(customer)(vendor) should be successfully created' do
  wait_for { @app.contact_detail_screen.has_txt_contact_name? }
  @app.contact_detail_screen.verify_contact(@contact_details)
  @app.contact_detail_screen.btn_back.click
end

And 'user edit (customer)(vendor) using {string}' do |contact_details|
  @contact_details = @app_requirement.contact_requirement.load_contact_details(contact_details).with_indifferent_access
  wait_for { @app.contact_overview_screen.customer_name.displayed? }
  @app.contact_overview_screen.customer_name.click
  wait_for { @app.contact_detail_screen.btn_more.displayed? }
  @app.contact_detail_screen.btn_more.click
  sleep 2
  wait_for { @app.contact_detail_screen.btn_edit.first.displayed? }
  @app.contact_detail_screen.btn_edit.first.click
  @app.contact_form_screen.edit_contact(@contact_details)
  @app.contact_detail_screen.btn_back.click
  sleep 3
  @app.contact_overview_screen.search_contact(@contact_details)
  @app.contact_overview_screen.customer_name.click
end

Then '(customer)(vendor) should be successfully edited' do
  wait_for { @app.contact_detail_screen.has_txt_contact_name? }
  @app.contact_detail_screen.verify_edit_contact(@contact_details)
  @app.contact_detail_screen.btn_back.click
end

Then '(customer)(vendor) should not be created on contact details' do
  expect(@app.contact_form_screen.has_input_name?).to be true
  @app.contact_form_screen.btn_back.click
end
