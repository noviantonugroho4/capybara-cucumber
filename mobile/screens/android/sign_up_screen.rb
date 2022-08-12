module Android
  class SignUpScreen < Appom::Page
    element :input_full_name, :id, 'tiet_sign_up_full_name'
    element :input_email, :id, 'tiet_sign_up_email'
    element :input_phone, :id, 'tiet_sign_up_phone'
    element :input_password, :id, 'tiet_sign_up_password'
    element :input_retype_password, :id, 'tiet_sign_up_retype_password'
    element :error_full_name, :id, 'tvSignUpFullNameError'
    element :error_email, :id, 'tvSignUpEmailError'
    element :error_phone, :id, 'tvSignUpPhoneError'
    element :error_password, :id, 'tvSignUpPasswordError'
    element :error_retype_password, :id, 'tvSignUpRetypePasswordError'
    element :btn_show_password, :xpath, "(//android.widget.ImageButton[@content-desc='Show password'])[1]"
    element :btn_show_trype_password, :xpath, "(//android.widget.ImageButton[@content-desc='Show password'])[2]"
    element :btn_sign_up1, :id, 'btn_sign_up_step_1_next'
    element :btn_sign_up2, :id, 'btn_sign_up_step_2_next'
    element :btn_sign_up3, :id, 'btn_sign_up_step_3_next'
    element :btn_back2, :id, 'btn_sign_up_step_2_back'
    element :btn_back3, :id, 'btn_sign_up_step_3_back'
    element :txt_login_failed, :id, 'snackbar_text'
    element :popup_progress_login, :xpath, '//android.widget.TextView[@text="Authenticating…"]'
    element :cb_term_and_agreement, :id, 'cb_term_and_agreement'
    element :link_have_account, :id, 'tv_have_account'
    element :input_company_name, :id, 'tiet_sign_up_company_name'
    element :dd_company_industry, :id, 'sp_sign_up_industry'
    element :dd_company_package, :id, 'sp_sign_up_package'
    element :toggle_ref_code, :id, 's_sign_up_referral_code'
    element :input_promo_code, :id, 'et_sign_up_promo_code'
    element :btn_apply_code, :id, 'btn_promo_code_apply'
    element :rd_btn_indonesia_language, :id, 'tv_sign_up_id_text'
    element :rd_btn_english_language, :id, 'tv_sign_up_eng_text'
    section :common_screen, CommonScreen, :xpath, '/hierarchy/android.widget.FrameLayout'

    def fill_in_user_detail(credentials)
      input_full_name.send_keys credentials[:user_full_name]
      input_email.send_keys credentials[:user_email]
      input_phone.send_keys credentials[:user_phone]
      input_password.send_keys credentials[:user_password]
      input_retype_password.send_keys credentials[:user_password]
      input_retype_password.send_keys credentials[:user_password] if credentials[:user_repassword].nil?
      input_retype_password.send_keys credentials[:user_repassword] unless credentials[:user_repassword].nil?
      cb_term_and_agreement.click if credentials[:user_term_and_agreement]
      btn_sign_up1.click
    end

    def fill_in_company_detail(company_details)
      input_company_name.send_keys company_details[:company_name]
      select_dropdown dd_company_industry, company_details[:company_industry]
      select_dropdown dd_company_package, company_details[:company_package]
      toggle_ref_code.click unless toggle_ref_code[:checked].eql? company_details[:have_referal_code].to_s
      if company_details[:have_referal_code]
        input_promo_code.send_keys company_details[:referal_code]
        btn_promo_code_apply.click
      end
      btn_sign_up2.click
    end

    def choose_language(credentials)
      rd_btn_indonesia_language.click if credentials[:user_language].eql? 'id'
      rd_btn_english_language.click if credentials[:user_language].eql? 'eng'
    end
  end
end
