module Android
  class PurchaseMenuScreen < Appom::Page
    element :overview_tab, :accessibility_id, 'OVERVIEW'
    element :purchase_invoice_tab, :accessibility_id, 'Purchase Invoice'
    element :purchase_order_tab, :accessibility_id, 'Purchase Order'
    element :btn_create_purchase_invoice, :xpath, "//android.widget.TextView[@text='Sales']"
    element :btn_open_fam_action_menu, :xpath, "//android.view.ViewGroup[@resource-id='id.jurnal.mobile:id/fam_action_menu']/android.widget.ImageButton"
    element :btn_close_fam_action_menu, :xpath, "//android.view.ViewGroup[@resource-id='id.jurnal.mobile:id/fam_action_menu']/android.widget.ImageButton[not(@resource-id)]"
    element :btn_create_purchase_invoice, :id, 'id.jurnal.mobile:id/menu_purchase_invoice'
    element :btn_create_purchase_order, :id, 'id.jurnal.mobile:id/menu_purchase_order'
  end
end
