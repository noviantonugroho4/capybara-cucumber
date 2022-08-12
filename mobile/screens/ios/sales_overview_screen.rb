module Ios
  class SalesOverviewScreen < Appom::Page
    element :txt_sales_invoice_header, :xpath, '//XCUIElementTypeStaticText[@name="Sales Invoice"]'
    element :tab_overview, :xpath, '//XCUIElementTypeOther[@name="OVERVIEW"]'
    element :tab_sales_invoice, :xpath, '//XCUIElementTypeOther[@name="SALES INVOICE"]'
    element :tab_sales_order, :xpath, '//XCUIElementTypeOther[@name="SALES ORDER"]'
    element :tab_sales_quote, :xpath, '//XCUIElementTypeOther[@name="SALES QUOTE"]'
    element :widget_open_invoice, :accessibility_id, 'widget_open_sales'
    element :widget_overdue_invoice, :accessibility_id, 'widget_overdue_sales'
    element :widget_payment_received, :accessibility_id, 'widget_payment_received'
    element :txt_total_open_transaction, :accessibility_id, 'qty_open_sales'
    element :txt_total_overdue_transaction, :accessibility_id, 'qty_overdue_sales'
    element :txt_total_payment_received, :accessibility_id, 'qty_payment_received'
    element :txt_total_open_amount, :accessibility_id, 'amount_open_sales'
    element :txt_total_overdue_amount, :accessibility_id, 'amount_overdue_sales'
    element :txt_total_payment_amount, :accessibility_id, 'amount_payment_received'
    element :btn_open_fam_action_menu, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeButton'
    element :btn_close_fam_action_menu, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeButton'
    element :btn_create_sales_invoice, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[1]'
    element :btn_create_sales_order, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]'
    element :btn_create_sales_quote, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[3]'
    element :input_search, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[1]/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeTextField'
    element :btn_search, :class_chain, '**/XCUIElementTypeImage[`name == "Search"`]'
    element :progress_bar, :id, 'id.jurnal.mobile:id/pb_order'
    element :btn_close_search, :accessibility_id, 'Clear text'
    elements :get_text_sales_list, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[1]/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeStaticText[4]'
  end
end