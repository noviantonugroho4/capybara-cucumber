module Ios
  class ContactDetailScreen < Appom::Page
    element :contact_detail_header, :class_chain, '**/XCUIElementTypeStaticText[`label == "DETAILS"`]'
    element :txt_contact_name, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther[2]/XCUIElementTypeButton/XCUIElementTypeButton'
    element :txt_contact_email, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther[4]/XCUIElementTypeButton/XCUIElementTypeButton'
    element :txt_contact_mobile, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther[3]/XCUIElementTypeButton/XCUIElementTypeButton'
    element :txt_contact_phone, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther[7]/XCUIElementTypeButton[2]/XCUIElementTypeButton'
    element :txt_account_receivable, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther[13]/XCUIElementTypeButton[2]/XCUIElementTypeButton'
    element :txt_account_payable, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther[14]/XCUIElementTypeButton[2]/XCUIElementTypeButton'
    element :txt_term, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther[15]/XCUIElementTypeButton[2]/XCUIElementTypeButton'
    element :txt_contact_billing_address, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther[11]/XCUIElementTypeButton[2]/XCUIElementTypeButton'
    element :txt_contact_shipping_address, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther[10]/XCUIElementTypeOther/XCUIElementTypeButton[2]/XCUIElementTypeButton'
    element :btn_back, :accessibility_id, 'Back'
    element :btn_more, :accessibility_id, 'More'
    elements :btn_edit, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther'

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
        # expect(txt_term.text.downcase).to eql contact_details[:term].downcase
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
        # expect(txt_term.text.downcase).to eql contact_details[:term].downcase
      end
    end
  end
end
