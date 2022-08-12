module Ios
  # rubocop:disable Metrics/LineLength
  class ExpenseOverviewScreen < Appom::Page
    element :tab_overview, :accessibility_id, 'OVERVIEW'
    element :tab_expenses, :accessibility_id, 'EXPENSES'
    element :widget_expenses_this_month, :accessibility_id, 'widget_open_sales'
    element :widget_last_30_days, :accessibility_id, 'widget_overdue_sales'
    element :widget_open_expenses, :accessibility_id, 'widget_payment_received'
    element :expenses_this_month_amount, :accessibility_id, 'amount_open_sales'
    element :expenses_last_30_days_amount, :accessibility_id, 'amount_overdue_sales'
    element :open_expenses_amount, :accessibility_id, 'amount_payment_received'
    element :btn_create_expenses, :class_chain, '**/XCUIElementTypeButton[`label == "Button"`]'
    element :input_search, :class_chain, '**/XCUIElementTypeTextField[`value == "Search"`]'
    element :list_item_expense, :class_chain, '**/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeOther[1]/XCUIElementTypeOther'
    element :list_expense_transation, :xpath, '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeOther[1]/XCUIElementTypeOther'
    element :no_transaction, :class_chain, '**/XCUIElementTypeStaticText[`label == "No Data Available"`]'
    element :delete_search, :class_chain, '**/XCUIElementTypeButton[`label == "Clear text"`]'
    element :loading_icon, :accessibility_id, 'loading_icon'

    def search_expense(expense_details)
      sleep 3
      delete_search.click if has_delete_search?
      wait_long_for { input_search.displayed? }
      input_search.send_keys expense_details[:expense_number]
    end
  end
  # rubocop:enable Metrics/LineLength
end
