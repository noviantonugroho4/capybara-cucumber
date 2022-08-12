When 'user go to forgot password screen' do
  # step 'user is on login page'
  reset_app unless @app.welcome_screen.has_btn_sign_in?
  wait_for { @app.welcome_screen.has_btn_sign_in? }
  @app.welcome_screen.btn_sign_in.click
  @app.login_screen.btn_forgot_password.click
  wait_for { @app.forgot_password_screen.has_btn_send_reset_password? }
  expect(@app.forgot_password_screen.has_btn_send_reset_password?).to be true
end

Given 'user send forgot password instruction as {string}' do |user_email|
  @user_email = @app_requirement.credentials_requirement.load_crendential_details(user_email).with_indifferent_access
  if @user_email.nil?
    @app.forgot_password_screen.input_user_email.send_keys('')
  else
    @app.forgot_password_screen.input_user_email.send_keys(@user_email['email'])
  end
  @app.forgot_password_screen.btn_send_reset_password.click
end

Then 'user verify forgot password {string}' do |result|
  if result.eql? 'failed'
    wait_for { @app.forgot_password_screen.has_btn_send_reset_password? }
    expect(@app.forgot_password_screen.has_btn_send_reset_password?).to be true
  else
    wait_for { @app.login_screen.has_btn_forgot_password? }
    expect(@app.login_screen.has_btn_forgot_password?).to be true
  end
end
