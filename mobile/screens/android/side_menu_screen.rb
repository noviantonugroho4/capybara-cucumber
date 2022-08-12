module Android
  class SideMenuScreen < Appom::Page
    element :company_name, :id, 'tv_navigation_company'
    element :dashboard_menu, :xpath, "//android.widget.TextView[@text='Dashboard']"
    element :reports_menu, :xpath, "//android.widget.TextView[@text='Reports']"
    element :cash_and_bank_menu, :xpath, "//android.widget.TextView[@text='Cash & Bank']"
    element :sales_menu, :xpath, "//android.widget.TextView[@text='Sales']"
    element :purchases_menu, :xpath, "//android.widget.LinearLayout[@resource-id='id.jurnal.mobile:id/ll_menu']/android.widget.TextView[@text='Purchases']"
    element :expenses_menu, :xpath, "//android.widget.LinearLayout[@resource-id='id.jurnal.mobile:id/ll_menu']/android.widget.TextView[@text='Expenses']"
    element :contacts_menu, :xpath, "//android.widget.TextView[@text='Contacts']"
    element :products_menu, :xpath, "//android.widget.TextView[@text='Products']"
    element :open_side_menu, :accessibility_id, 'Open'
    element :btn_hamburger_menu, :xpath, "//android.widget.ImageButton[@content-desc='Buka' or @content-desc='Open']"
    element :setting_menu, :xpath, "//android.widget.RelativeLayout[@resource-id='id.jurnal.mobile:id/rl_option_gear']/android.widget.ImageView"
  end
end
