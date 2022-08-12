module Ios
  class PurchaseOverviewScreen < Appom::Page
    element :txt_purchase_invoice_header, :id, 'tvTitleSaleInvoice'
    element :tab_overview, :accessibility_id, 'OVERVIEW'
    element :tab_purchase_invoice, :accessibility_id, 'PURCHASE INVOICE'
    element :tab_purchase_order, :accessibility_id, 'PURCHASE ORDER'
    element :widget_open_invoice, :predicate, 'label == "Open"'
    element :widget_overdue_invoice, :predicate, 'label == "Overdue"'
    element :widget_payment_sent, :predicate, 'label == "Payment Sent"'
    element :txt_total_open_transaction, :xpath, '//XCUIElementTypeStaticText[@name="Open"]/following-sibling::XCUIElementTypeStaticText'
    element :txt_total_overdue_transaction, :xpath, '//XCUIElementTypeStaticText[@name="Overdue"]/following-sibling::XCUIElementTypeStaticText'
    element :txt_total_payment_sent, :xpath, '//XCUIElementTypeStaticText[@name="Payment Sent"]/following-sibling::XCUIElementTypeStaticText'
    element :txt_total_open_amount, :xpath, '//XCUIElementTypeStaticText[@name="Open"]/following-sibling::XCUIElementTypeStaticText/following-sibling::XCUIElementTypeStaticText'
    element :txt_total_overdue_amount, :xpath, '//XCUIElementTypeStaticText[@name="Overdue"]/following-sibling::XCUIElementTypeStaticText/following-sibling::XCUIElementTypeStaticText'
    element :txt_total_payment_amount, :xpath, '//XCUIElementTypeStaticText[@name="Payment Sent"]/following-sibling::XCUIElementTypeStaticText/following-sibling::XCUIElementTypeStaticText'
    element :btn_open_fam_action_menu, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeButton'
    element :btn_close_fam_action_menu, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[3]/XCUIElementTypeButton'
    element :btn_create_purchase_order, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[3]/XCUIElementTypeOther[2]'
    element :btn_create_purchase_invoice, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[3]/XCUIElementTypeOther[1]'
    element :input_search, :xpath, '//XCUIElementTypeNavigationBar[@name="Jurnal_Mobile.Purchase"]//following-sibling::XCUIElementTypeOther//XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[1]/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeTextField'
    element :btn_search, :class_chain, '**/XCUIElementTypeImage[`name == "Search"`]'
    element :progress_bar, :id, 'id.jurnal.mobile:id/pb_order'
    element :btn_close_search, :accessibility_id, 'Clear text'
    elements :get_text_purchase_list, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[1]/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeStaticText[4]'
  end
end