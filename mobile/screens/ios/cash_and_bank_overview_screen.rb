module Ios
  class CashAndBankOverviewScreen < Appom::Page
    element :tab_overview, :xpath, '**//XCUIElementTypeButton[@name="OVERVIEW"]'
    element :tab_cash_and_bank, :xpath, '**//XCUIElementTypeButton[@name="CASH & BANK"]'
    element :tab_credit_card, :xpath, '**/XCUIElementTypeButton[`label == "CREDIT CARD"`]'
    element :txt_recieveable_next_30_days, :xpath, '**/XCUIElementTypeStaticText[`label == "Receivable Next 30 Days (in IDR)"`]'
    element :txt_payable_next_30_days, :id, '**/XCUIElementTypeStaticText[`label == "Receivable Next 30 Days (in IDR)"`]'
    element :txt_cash_balance, :id, '**/XCUIElementTypeStaticText[`label == "Receivable Next 30 Days (in IDR)"`]'
    element :txt_credit_card_balance, :id, 'tv_account_credit_card_balance'
    element :btn_open_fam_action_menu, :xpath, '//android.view.ViewGroup[@resource-id="id.jurnal.mobile:id/fam_action_menu"]/android.widget.ImageButton'
    element :btn_close_fam_action_menu, :xpath, "//android.view.ViewGroup[@resource-id='id.jurnal.mobile:id/fam_action_menu']/android.widget.ImageButton[not(@resource-id)]"
    element :btn_create_transfer_fund, :id, 'menu_transfer_fund'
    element :btn_create_recieve_money, :id, 'menu_deposit_fund'
    element :btn_create_pay_money, :id, 'menu_withdrawal'
  end
end
