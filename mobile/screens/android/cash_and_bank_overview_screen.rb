module Android
  class CashAndBankOverviewScreen < Appom::Page
    section :common_screen, CommonScreen, :id, 'android:id/content'
    element :tab_overview, :accessibility_id, 'OVERVIEW'
    element :tab_cash_and_bank, :accessibility_id, 'CASH & BANK'
    element :tab_credit_card, :accessibility_id, 'CREDIT CARD'
    element :txt_recieveable_next_30_days, :id, 'tv_receivable_next30_days'
    element :txt_payable_next_30_days, :id, 'tv_account_payables_next30_days'
    element :txt_cash_balance, :id, 'tv_account_cash_balance'
    element :txt_credit_card_balance, :id, 'tv_account_credit_card_balance'
    element :btn_open_fam_action_menu, :xpath, '//android.view.ViewGroup[@resource-id="id.jurnal.mobile:id/fam_action_menu"]/android.widget.ImageButton'
    element :btn_close_fam_action_menu, :xpath, "//android.view.ViewGroup[@resource-id='id.jurnal.mobile:id/fam_action_menu']/android.widget.ImageButton[not(@resource-id)]"
    element :btn_create_transfer_fund, :id, 'menu_transfer_fund'
    element :btn_create_recieve_money, :id, 'menu_deposit_fund'
    element :btn_create_pay_money, :id, 'menu_withdrawal'
  end
end
