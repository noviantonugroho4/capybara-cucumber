Given 'user login as {string}' do |credential|
  @credential = @app_requirement.credentials_requirement.load_crendential_details(credential).with_indifferent_access
  reset_app if $current_user_email.nil? || $current_user_email != @credential[:email]
  if ENV['PLATFORM'].eql? 'android'
    wait_long_for { !$driver.current_activity.include?('.views.splash.SplashActivity') }
  else
    wait_long_for { $driver.app_state($capabilities['bundleId']).eql? :running_in_foreground }
  end
  # IF OUR REQUEST TO HIDE FEATURE POPUP HAS BEEN COMPLETED BY DEV TEAM, DELETE LINE 10-12
  switch_context('native')
  wait_short_for { @app.welcome_screen.btn_accept_and_continue.displayed? }
  p "Welcome to Chrome"
  
  wait_short_for(optional_element: true) { @app.dashboard_screen.has_popup_feedback? || @app.dashboard_screen.has_popup_new_feature? }
  @app.dashboard_screen.btn_close_feedback.click if @app.dashboard_screen.has_popup_feedback?
  @app.dashboard_screen.btn_close_new_feature.click while @app.dashboard_screen.has_popup_new_feature?
  @app.dashboard_screen.btn_onboarding_skip.click if @app.dashboard_screen.has_btn_onboarding_skip?
  @app.dashboard_screen.btn_onboarding_next.click if @app.dashboard_screen.has_btn_onboarding_next?
  wait_long_for { @app.welcome_screen.has_btn_sign_in? || @app.side_menu_screen.has_btn_hamburger_menu? || @app.welcome_screen.has_no_laucher? }

  if @app.side_menu_screen.has_btn_hamburger_menu? && ($current_user_email == @credential[:email])
    p "User already log in using account #{@credential[:email]}"
  elsif @app.welcome_screen.has_btn_sign_in? && ($current_user_email != @credential[:email])
    wait_for { @app.welcome_screen.has_btn_sign_in? }
    @app.welcome_screen.btn_sign_in.click
    p "Will login using #{@credential['email']} with password #{@credential['password']}"
    @app.login_screen.login_as(@credential)
    $current_user_email = @credential[:email]
    wait_for { @app.login_screen.has_no_popup_progress_login? }
    sleep 1

    if @app.login_screen.has_no_txt_login_failed?
      wait_for(optional_element: true) { @app.dashboard_screen.has_popup_feedback? || @app.dashboard_screen.has_popup_new_feature? }
      @app.dashboard_screen.btn_close_feedback.click if @app.dashboard_screen.has_popup_feedback?
      @app.dashboard_screen.btn_close_new_feature.click while @app.dashboard_screen.has_popup_new_feature?
    end
  else
    p 'user on previous position of scenario'
    sleep 2
    if ENV['PLATFORM'] == 'ios' && @app.side_menu_screen.has_no_btn_hamburger_menu?
      reset_app
      wait_long_for { $driver.app_state($capabilities['bundleId']).eql? :running_in_foreground }
      wait_short_for(optional_element: true) { @app.dashboard_screen.has_popup_feedback? || @app.dashboard_screen.has_popup_new_feature? }
      @app.dashboard_screen.btn_close_feedback.click if @app.dashboard_screen.has_popup_feedback?
      @app.dashboard_screen.btn_close_new_feature.click while @app.dashboard_screen.has_popup_new_feature?
      wait_long_for { @app.welcome_screen.has_btn_sign_in? || @app.side_menu_screen.has_btn_hamburger_menu? || @app.welcome_screen.has_no_laucher? }
      wait_for { @app.welcome_screen.has_btn_sign_in? }
      @app.welcome_screen.btn_sign_in.click
      p "Will login using #{@credential['email']} with password #{@credential['password']}"
      @app.login_screen.login_as(@credential)
      $current_user_email = @credential[:email]
      wait_for { @app.login_screen.has_no_popup_progress_login? }
      sleep 1
    end
  end
end

Then 'login should be failed' do
  if ENV['PLATFORM'].eql? 'android'
    expect(@app.login_screen.txt_login_failed.text).to include @credential['error_message']
  else
    expect(@app.login_screen.has_input_email?).to be true # will stay on the same screen
  end
end
