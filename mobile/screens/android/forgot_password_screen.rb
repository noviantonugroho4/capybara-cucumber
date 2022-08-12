module Android
  class ForgotPasswordScreen < Appom::Page
    element :input_user_email, :xpath, '//android.widget.EditText[@resource-id="user_email"]'
    element :btn_send_reset_password, :xpath, '//android.widget.Button[@resource-id="reset_password"]'
    element :btn_back, :accessibility_id, 'Show password'
    element :btn_back_to_login, :xpath, '//android.view.View[1]/android.view.View[1]/android.view.View[3]/android.view.View[4]/android.view.View'
  end
end
