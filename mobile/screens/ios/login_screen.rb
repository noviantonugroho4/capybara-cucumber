module Ios
  class LoginScreen < Appom::Page
    element :input_email, :xpath, '//XCUIElementTypeOther[@name="main"]/XCUIElementTypeTextField'
    element :input_password, :xpath, '//XCUIElementTypeOther[@name="main"]/XCUIElementTypeSecureTextField'
    element :btn_show_password, :accessibility_id, 'Show password'
    element :btn_login, :xpath, '//XCUIElementTypeButton[@name="Sign in"]'
    element :btn_forgot_password, :id, 'tv_login_forgetpassword'
    element :btn_sign_up, :id, 'tv_sign_up'
    element :txt_login_failed, :xpath, "//*[contains(translate(@name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),'email or password')]"
    element :popup_progress_login, :xpath, "//*[contains(@name,'Wrong Email or Password')] | //*[contains(@name,'Email or password can't be blank')]"

    def login_as(credentials)
      sleep 3
      wait_for { input_email.displayed? }
      wait_for { input_password.displayed? }
      wait_for { btn_login.displayed? }
      input_email.click
      input_email.send_keys credentials['email']
      input_password.click
      input_password.send_keys credentials['password']
      sleep 1
      btn_login.click
    end
  end
end
