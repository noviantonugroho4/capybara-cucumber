module Android
  class LoginScreen < Appom::Page
    element :input_email, :id, 'tiet_login_email'
    element :input_password, :id, 'tiet_login_password'
    element :btn_show_password, :accessibility_id, 'Show password'
    element :btn_login, :id, 'btn_login'
    element :btn_forgot_password, :xpath, '//android.view.View[@resource-id = "forgot-password"] | //android.widget.TextView[@resource-id = "id.jurnal.mobile:id/tv_login_forgetpassword"]'
    element :btn_sign_up, :id, 'tv_sign_up'
    element :txt_login_failed, :id, 'snackbar_text'
    element :header_signin, :xpath, '//android.view.ViewGroup/android.widget.TextView'
    element :popup_progress_login, :xpath, '//android.widget.TextView[@text="Authenticating…"]'
    section :common_screen, CommonScreen, :id, 'android:id/content'

    def login_as(credentials)
      wait_for { input_email.displayed? }
      input_email.send_keys credentials['email']
      input_password.send_keys credentials['password']
      btn_login.click
    end
  end
end
