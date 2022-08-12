module Android
  class PurchaseOverviewScreen < Appom::Page
    element :txt_purchase_invoice_header, :id, 'tvToolbarTile'
    element :tab_overview, :accessibility_id, 'OVERVIEW'
    element :tab_purchase_invoice, :accessibility_id, 'Purchase Invoice'
    element :tab_purchase_order, :accessibility_id, 'Purchase Order'
    element :widget_open_invoice, :id, 'cv_purchase_open_invoice'
    element :widget_overdue_invoice, :id, 'cv_purchase_overdue_invoice'
    element :widget_payment_sent, :id, 'cv_purchase_payment_received'
    element :txt_total_open_transaction, :id, 'tvTotalOpenTransaction'
    element :txt_total_overdue_transaction, :id, 'tvTotalOverdueTransaction'
    element :txt_total_payment_received, :id, 'tvTotalPaymentReceiveTransaction'
    element :txt_total_open_amount, :id, 'tv_purchase_open_invoice'
    element :txt_total_overdue_amount, :id, 'tv_purchase_overdue_invoice'
    element :txt_total_payment_amount, :id, 'tv_purchase_payment_sent'
    element :btn_open_fam_action_menu, :xpath, '//android.view.ViewGroup[@resource-id="id.jurnal.mobile:id/fam_action_menu"]/android.widget.ImageButton'
    element :btn_close_fam_action_menu, :xpath, "//android.view.ViewGroup[@resource-id='id.jurnal.mobile:id/fam_action_menu']/android.widget.ImageButton[not(@resource-id)]"
    element :btn_create_purchase_order, :id, 'menu_purchase_order'
    element :btn_create_purchase_invoice, :id, 'menu_purchase_invoice'
    element :input_search, :id, 'id.jurnal.mobile:id/search_src_text'
    element :btn_search, :id, 'id.jurnal.mobile:id/search_mag_icon'
    element :progress_bar, :id, 'id.jurnal.mobile:id/pb_order'
    element :btn_close_search, :id, 'id.jurnal.mobile:id/search_close_btn'
    elements :get_text_purchase_list, :xpath, "//android.widget.RelativeLayout[@resource-id='id.jurnal.mobile:id/rl_sales_invoice']//android.widget.TextView"
    element :btn_floating_menu, :id, 'fabCreate'
  end
end
