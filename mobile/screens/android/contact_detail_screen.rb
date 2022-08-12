module Android
  class ContactDetailScreen < Appom::Page
    section :common_screen, CommonScreen, :id, 'android:id/content'
    element :contact_detail_header, :id, 'rl_contact_details_header'
    element :txt_contact_name, :id, 'tv_contact_name'
    element :txt_contact_email, :id, 'tv_contact_email'
    element :txt_contact_mobile, :id, 'tv_contact_mobile'
    element :txt_contact_phone, :id, 'tv_phone'
    element :txt_account_receivable, :id, 'tv_mapping_ar'
    element :txt_account_payable, :id, 'tv_mapping_ap'
    element :txt_term, :id, 'tv_default_term'
    element :txt_contact_billing_address, :id, 'tv_billing_address'
    element :txt_contact_shipping_address, :id, 'tv_company_address'
    element :btn_back, :xpath, "//android.view.ViewGroup[@resource-id='id.jurnal.mobile:id/toolbar_detail_contact']/android.widget.ImageButton"
    element :btn_more, :xpath, "//android.view.ViewGroup[@resource-id='id.jurnal.mobile:id/toolbar_detail_contact']/androidx.appcompat.widget.LinearLayoutCompat/android.widget.ImageView[@content-desc='More options']"
    elements :btn_edit, :id, 'content'

    def verify_contact(contact_details)
      aggregate_failures('Verifying contact details') do
        expect(txt_contact_name.text.downcase).to eql contact_details[:name].downcase
        expect(txt_contact_email.text.downcase).to eql contact_details[:email].downcase
        expect(txt_contact_mobile.text.downcase).to eql contact_details[:mobile].downcase
        expect(txt_contact_phone.text.downcase).to eql contact_details[:phone].downcase
        expect(txt_contact_billing_address.text.downcase).to eql contact_details[:billing_address].downcase
        expect(txt_contact_shipping_address.text.downcase).to eql contact_details[:shipping_address].downcase if has_txt_contact_shipping_address?
        swipe(txt_contact_billing_address.location[:x] / 2, txt_contact_billing_address.location[:y], txt_contact_name.location[:x] / 2, txt_contact_name.location[:y])
        expect(txt_account_receivable.text.downcase).to include contact_details[:account_receivable].downcase
        expect(txt_account_payable.text.downcase).to include contact_details[:account_payable].downcase
        expect(txt_term.text.downcase).to eql contact_details[:term].downcase
      end
    end

    def verify_edit_contact(contact_details)
      aggregate_failures('Verifying contact updated details') do
        expect(txt_contact_name.text.downcase).to eql contact_details[:name].downcase
        expect(txt_contact_email.text.downcase).to eql contact_details[:email].downcase
        expect(txt_contact_mobile.text.downcase).to eql contact_details[:mobile].downcase
        expect(txt_contact_phone.text.downcase).to eql contact_details[:phone].downcase
        expect(txt_contact_billing_address.text.downcase).to eql contact_details[:billing_address].downcase
        expect(txt_contact_shipping_address.text.downcase).to eql contact_details[:shipping_address].downcase if has_txt_contact_shipping_address?
        swipe(txt_contact_billing_address.location[:x] / 2, txt_contact_billing_address.location[:y], txt_contact_name.location[:x] / 2, txt_contact_name.location[:y])
        expect(txt_account_receivable.text.downcase).to include contact_details[:account_receivable].downcase
        expect(txt_account_payable.text.downcase).to include contact_details[:account_payable].downcase
        expect(txt_term.text.downcase).to eql contact_details[:term].downcase
      end
    end
  end
end
