When 'user set {string} PIN' do |setting|
  @security_details = @app_requirement.setting_requirement.load_setting_details(setting).with_indifferent_access
  unless @app.security_screen.has_tgl_pin?
    step "user go to 'setting' screen"
    @app.setting_menu_screen.security_menu.click
    wait_for { @app.security_screen.has_tgl_pin? }
  end
  @app.security_screen.sett_pin @security_details
end

Then 'verify user PIN screen' do
  expect(@app.security_screen.tgl_pin['checked']).to eq 'false' unless @security_details['pin']
  expect(@app.security_screen.tgl_pin['checked']).to eq 'true' if @security_details['pin'] && (@security_details['pin_number'] == @security_details['confim_pin_number'])
  expect(@app.security_screen.tgl_pin['checked']).to eq 'false' if @security_details['pin'] && (@security_details['pin_number'] != @security_details['confim_pin_number'])
  expect(@app.security_screen.dd_timeout_interval.text).to eq @security_details['interval'] unless @security_details['interval'].nil?
end

When 'user input {string} PIN' do |pin|
  @pin = pin
  unless @app.security_screen.has_btn_forgot_pin?
    step "user set 'security_pin_valid_match' PIN"
    reopen_app
    wait_for { @app.security_screen.has_btn_forgot_pin? }
  end
  @security_details = @app_requirement.setting_requirement.load_setting_details(pin).with_indifferent_access
  expect(@app.security_screen.has_btn_forgot_pin?).to be true
  @security_details['pin_number'].to_s.split('').each do |num|
    @app.security_screen.key_pad_num(num).click
    sleep 1
  end
end

Then 'verify user inputted PIN' do
  expect(@app.security_screen.has_btn_forgot_pin?).to be true if @pin.include? 'not'
  unless @pin.include? 'not'
    expect(@app.security_screen.has_btn_forgot_pin?).to be false
    wait_for { @app.side_menu_screen.has_btn_hamburger_menu? || @app.dashboard_screen.has_popup_new_feature? }
  end
end
