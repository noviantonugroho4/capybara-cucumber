module Android
  class CompanyScreen < Appom::Page
    section :common_screen, CommonScreen, :id, 'android:id/content'
    element :input_email, :id, 'tiet_options_company_email'
    element :input_phone_number, :id, 'tiet_options_company_phone'
    element :input_company_address, :id, 'tiet_options_company_address'
    element :input_shipping_address, :id, 'tiet_options_company_shipping'
    element :input_fax_number, :id, 'tiet_options_company_fax'
    element :input_website, :id, 'tiet_options_company_website'
    element :btn_save, :id, 'btn_save_company'
    element :modal_confirmation_yes, :id, 'android:id/button1'
    element :modal_confirmation_no, :id, 'android:id/button2'
    element :btn_back, :accessibility_id, '‎‏‎‎‎‎‎‏‎‏‏‏‎‎‎‎‎‎‏‎‎‏‎‎‎‎‏‏‏‏‏‏‏‏‏‏‎‏‎‎‎‏‏‎‏‎‎‎‏‏‎‎‎‏‏‏‏‎‏‎‎‎‎‏‏‎‏‏‎‏‎‎‏‎‎‏‎‎‎‎‎‎‏‎‏‎‎‎‎‏‏‏‎‎‎‎‎Navigate up‎‏‎‎‏‎'
    element :input_tax_number, :id, 'tiet_options_company_tax_no'
    element :cb_show_logo_on_report, :id, 'cb_option_company_show_logo'
    element :cb_option_company_monthly_performace, :id, 'cb_option_company_monthly_performace'
    elements :list_company_name, :id, 'tv_company_name'
    element :name_current_company, :id, 'tv_company_name'

    def filling_company_details(details)
      btn_save.click
      expect(common_screen.has_no_progress_bar_loading?).to be true
      input_email.send_keys details['email']
      input_phone_number.send_keys details['phone']
      input_company_address.send_keys details['company_address']
      input_shipping_address.send_keys details['shipping_address']
      input_fax_number.send_keys details['fax']
      input_website.send_keys details['website']
      swipe_direction('up')
      input_tax_number.send_keys details['tax']
      if details['checkbox'].nil?
        checked = cb_show_logo_on_report['checked']
        cb_show_logo_on_report.click
        expect(cb_show_logo_on_report['checked']).to be !checked
        checked = cb_show_logo_on_report['checked']
        cb_option_company_monthly_performace.click
        expect(cb_option_company_monthly_performace['checked']).to be !checked
        checked = cb_show_logo_on_report['checked']
        cb_show_logo_on_report.click
        expect(cb_show_logo_on_report['checked']).to be !checked
        checked = cb_show_logo_on_report['checked']
        cb_option_company_monthly_performace.click
        expect(cb_option_company_monthly_performace['checked']).to be !checked
      else
        cb_show_logo_on_report.click if cb_show_logo_on_report['checked'] != details['checkbox']['show_logo']
        cb_option_company_monthly_performace.click if cb_option_company_monthly_performace['checked'] != details['checkbox']['receive_report']
      end
      btn_save.click
    end

    def verify_company_details(details)
      aggregate_failures('Verifying company details') do
        expect(input_email.text).to eq details['email']
        expect(input_phone_number.text).to eq details['phone']
        expect(input_company_address.text).to eq details['company_address']
        expect(input_shipping_address.text).to eq details['shipping_address']
        expect(input_fax_number.text).to eq details['fax']
        expect(input_website.text).to eq details['website']
        swipe_direction('up')
        expect(input_tax_number.text).to eq details['tax']
        expect(cb_show_logo_on_report['checked'].to_s).to eq details['checkbox']['show_logo']
        expect(cb_option_company_monthly_performace['checked'].to_s).to eq details['checkbox']['receive_report']
      end
    end
  end
end
