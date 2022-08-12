module Android
  class SalesOverviewScreen < Appom::Page
    element :txt_sales_invoice_header, :id, 'tvTitleSaleInvoice'
    element :tab_overview, :accessibility_id, 'OVERVIEW'
    element :tab_sales_invoice, :accessibility_id, 'Sales Invoice'
    element :tab_sales_order, :accessibility_id, 'Sales Order'
    element :tab_sales_quote, :accessibility_id, 'Sales Quote'
    element :widget_open_invoice, :id, 'clInvoiceOpen'
    element :widget_overdue_invoice, :id, 'clInvoiceOverdue'
    element :widget_payment_received, :id, 'clPaymentReceive'
    element :txt_total_open_transaction, :id, 'tvTotalOpenTransaction'
    element :txt_total_overdue_transaction, :id, 'tvTotalOverdueTransaction'
    element :txt_total_payment_received, :id, 'tvTotalPaymentReceiveTransaction'
    element :txt_total_open_amount, :id, 'tvTotalOpenValue'
    element :txt_total_overdue_amount, :id, 'tvTotalOverdueValue'
    element :txt_total_payment_amount, :id, 'tvTotalPaymentReceive'
    element :btn_open_fam_action_menu, :xpath, '//android.view.ViewGroup[@resource-id="id.jurnal.mobile:id/fam_action_menu"]/android.widget.ImageButton'
    element :btn_close_fam_action_menu, :xpath, "//android.view.ViewGroup[@resource-id='id.jurnal.mobile:id/fam_action_menu']/android.widget.ImageButton[not(@resource-id)]"
    element :btn_create_sales_order, :id, 'menu_sales_order'
    element :btn_create_sales_invoice, :id, 'menu_sales_invoice'
    element :btn_create_sales_quote, :id, 'menu_sales_quote'
    element :input_search, :id, 'id.jurnal.mobile:id/search_src_text'
    element :btn_search, :id, 'id.jurnal.mobile:id/search_mag_icon'
    element :progress_bar, :id, 'id.jurnal.mobile:id/pb_order'
    element :btn_close_search, :id, 'id.jurnal.mobile:id/search_close_btn'
    elements :get_text_sales_list, :xpath, "//android.widget.RelativeLayout[@resource-id='id.jurnal.mobile:id/rl_sales_invoice']//android.widget.TextView"
    element :product_tour, :id, 'clTourContent1'
    element :next_product_tour, :id, 'tvNext'
    element :skip_product_tour, :id, 'tvSkip'
  end
end
