module Android
  class SettingMenuScreen < Appom::Page
    element :list_of_company_menu, :xpath, "//android.widget.TextView[@text='List of Companies']"
    element :company_menu, :xpath, "//android.widget.TextView[@text='Company']"
    element :transaction_menu, :xpath, "//android.widget.TextView[@text='Transactions']"
    element :language_menu, :xpath, "//android.widget.TextView[@text='Language' or @text='Bahasa']"
    element :push_notification_menu, :xpath, "//android.widget.TextView[@text='Push Notifications']"
    element :security_menu, :xpath, "//android.widget.TextView[@text='Security']"
    element :contact_us_menu, :xpath, "//android.widget.TextView[@text='Contact Us']"
    element :guide_book_menu, :xpath, "//android.widget.TextView[@text='Guide Book']"
    element :app_info_menu, :xpath, "//android.widget.TextView[@text='App Info']"
    element :privacy_policy_menu, :xpath, "//android.widget.TextView[@text='Privacy Policy']"
    element :header_options, :id, 'toolbar_options'
  end
end
