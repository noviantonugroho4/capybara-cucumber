Given 'user create new account with {string} data' do |data_type|
  @data_type = data_type
  wait_long_for { @app.login_screen.has_btn_sign_up? }
  @app.login_screen.btn_sign_up.click unless @app.sign_up_screen.has_btn_sign_up1?
  wait_long_for { @app.sign_up_screen.has_btn_sign_up1? }
  @unique_name = 'SDET' + Faker::Number.number(digits: 5).to_s
  @new_account_details ||= {
    user_full_name: Faker::Name.unique.first_name + ' ' + Faker::Name.unique.last_name,
    user_email: 'sdet.jurnal' + Faker::Name.unique.first_name + Faker::Number.number(digits: 5).to_s + '@notnotnot.com',
    user_phone: '+62' + Faker::Number.number(digits: 10).to_s,
    user_password: 'Password123',
    user_term_and_agreement: true,
    user_language: 'id'
  }
  @new_company_details ||= {
    company_name: 'SDET Jurnal' + Faker::Number.number(digits: 5).to_s,
    company_industry: 'Logistic',
    company_package: 'Trial Enterprise',
    have_referal_code: false,
    referal_code: '1234'
  }

  if data_type.eql? 'invalid_email'
    @new_account_details[:user_email] = 'invalid@email'
  elsif data_type.eql? 'invalid_email_format'
    @new_account_details[:user_email] = 'aa@aa.123'
  elsif data_type.eql? 'empty_full_name'
    @new_account_details[:user_full_name] = ''
  elsif data_type.eql? 'empty_email'
    @new_account_details[:user_email] = ''
  elsif data_type.eql? 'empty_phone_number'
    @new_account_details[:user_phone] = ''
  elsif data_type.eql? 'short_phone_number'
    @new_account_details[:user_phone] = '+62' + Faker::Number.number(digits: 2).to_s
  elsif data_type.eql? 'long_phone_number'
    @new_account_details[:user_phone] = '+62' + Faker::Number.number(digits: 15).to_s
  elsif data_type.eql? 'registered_email'
    @new_account_details[:user_email] = 'alexander.jackhariyas@notnotnot.com'
  elsif data_type.eql? 'password_not_match'
    @new_account_details[:user_repassword] = @new_account_details[:user_password].upcase
  elsif data_type.eql? 'empty_password'
    @new_account_details[:user_password] = ''
  elsif data_type.eql? 'empty_all'
    @new_account_details[:user_full_name] = ''
    @new_account_details[:user_email] = ''
    @new_account_details[:user_phone] = ''
    @new_account_details[:user_password] = ''
  elsif data_type.eql? 'no_term_and_agreement'
    @new_account_details[:user_term_and_agreement] = false
  elsif @data_type.eql? 'have_account'
  else
    pp "user input as #{@new_account_details}"
  end

  @app.sign_up_screen.fill_in_user_detail(@new_account_details) unless @data_type.eql? 'have_account'
end

Then 'verify user account {string} to create' do |_result|
  if @data_type.eql? 'invalid_email'
    wait_for { @app.sign_up_screen.has_error_email? }
    expect(@app.sign_up_screen.error_email.text).to eq 'Incorrect Email Format'
  elsif @data_type.eql? 'empty_full_name'
    wait_for { @app.sign_up_screen.has_error_full_name? }
    expect(@app.sign_up_screen.error_full_name.text).to eq 'Full Name must be filled in'
  elsif @data_type.eql? 'empty_all'
    wait_for { @app.sign_up_screen.has_error_full_name? }
    expect(@app.sign_up_screen.error_full_name.text).to eq 'Full Name must be filled in'
    expect(@app.sign_up_screen.error_email.text).to eq 'Incorrect Email Format'
    expect(@app.sign_up_screen.error_phone.text).to eq 'Phone must be filled in'
    expect(@app.sign_up_screen.error_password.text).to eq 'Password must be filled in'
    expect(@app.sign_up_screen.error_retype_password.text).to eq 'Password must be filled in'
  elsif @data_type.eql? 'invalid_email_format'
    wait_for { @app.sign_up_screen.has_error_email? }
    expect(@app.sign_up_screen.error_email.text).to eq 'Fill with email format, e.g. name@email.com'
  elsif @data_type.eql? 'empty_email'
    wait_for { @app.sign_up_screen.has_error_email? }
    expect(@app.sign_up_screen.error_email.text).to eq 'Incorrect Email Format'
  elsif @data_type.eql? 'empty_fullname'
    wait_for { @app.sign_up_screen.has_error_full_name? }
    expect(@app.sign_up_screen.error_full_name.text).to eq 'Full name required'
  elsif @data_type.eql? 'empty_phone_number'
    wait_for { @app.sign_up_screen.has_error_phone? }
    expect(@app.sign_up_screen.error_phone.text).to eq 'Phone must be filled in'
  elsif @data_type.eql? 'short_phone_number'
    wait_for { @app.sign_up_screen.has_error_phone? }
    expect(@app.sign_up_screen.error_phone.text).to eq 'Phone number must be between 6 to 13 numbers'
  elsif @data_type.eql? 'long_phone_number'
    wait_for { @app.sign_up_screen.has_error_phone? }
    expect(@app.sign_up_screen.error_phone.text).to eq 'Phone number must be between 6 to 13 numbers'
  elsif @data_type.eql? 'empty_password'
    wait_for { @app.sign_up_screen.has_error_password? }
    expect(@app.sign_up_screen.error_password.text).to eq 'Password must be filled in'
  elsif @data_type.eql? 'empty_password_confirmation'
    wait_for { @app.sign_up_screen.has_error_retype_password? }
    expect(@app.sign_up_screen.error_retype_password.text).to eq 'Password must be filled in'
  elsif @data_type.eql? 'no_term_and_agreement'
    wait_for { @app.sign_up_screen.has_btn_sign_up1? }
    expect(@app.sign_up_screen.has_btn_sign_up1?).to be true
  elsif @data_type.eql? 'yes_term_and_agreement'
    wait_for { @app.sign_up_screen.has_btn_sign_up2? }
    @app.sign_up_screen.btn_back2.click
    wait_for { @app.sign_up_screen.has_btn_sign_up1? }
    expect(@app.sign_up_screen.has_btn_sign_up1?).to be true
  elsif @data_type.eql? 'password_not_match'
    wait_for { @app.sign_up_screen.has_error_retype_password? }
    expect(@app.sign_up_screen.error_retype_password.text).to eq 'Password does not match'
  elsif @data_type.eql? 'registered_email'
    @app.sign_up_screen.fill_in_company_detail @new_company_details
    wait_for { @app.sign_up_screen.has_no_btn_sign_up2? }
    @app.sign_up_screen.choose_language @new_account_details
    @app.sign_up_screen.btn_sign_up3.click
    wait_for { @app.common_screens.has_text_toast_message? }
    expect(@app.common_screens.text_toast_message.text).to eq 'email: have already been used'
  elsif @data_type.eql? 'have_account'
    wait_for { @app.sign_up_screen.has_btn_sign_up1? }
    @app.sign_up_screen.link_have_account.click
    expect(@app.login_screen.has_btn_sign_up?).to be true
  else
    @app.sign_up_screen.fill_in_company_detail @new_company_details
    wait_for { @app.sign_up_screen.has_no_btn_sign_up2? }
    @app.sign_up_screen.choose_language @new_account_details
  end
end
