module Android
  class ContactOverviewScreen < Appom::Page
    section :common_screen, CommonScreen, :id, 'android:id/content'
    element :customers_tab, :accessibility_id, 'Customers'
    element :vendors_tab, :accessibility_id, 'Vendors'
    element :btn_open_floating_menu, :xpath, "//android.view.ViewGroup[@resource-id='id.jurnal.mobile:id/fam_action_menu']/android.widget.ImageButton"
    element :btn_close_floating_menu, :xpath, "//android.view.ViewGroup[@resource-id='id.jurnal.mobile:id/fam_action_menu']/android.widget.ImageButton[not(@resource-id)]"
    element :btn_create_customer, :id, 'menu_create_customer'
    element :btn_create_vendor, :id, 'menu_create_vendor'
    element :customer_name, :id, 'tv_contact_name'
    element :txt_search, :id, 'search_src_text'

    def search_contact(contact_details)
      txt_search.send_keys contact_details[:name]
    end
  end
end
