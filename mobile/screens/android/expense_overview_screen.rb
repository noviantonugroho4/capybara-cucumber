module Android
  class ExpenseOverviewScreen < Appom::Page
    section :common_screen, CommonScreen, :id, 'android:id/content'
    element :tab_overview, :accessibility_id, 'OVERVIEW'
    element :tab_expenses, :accessibility_id, 'Expenses'
    element :widget_expenses_this_month, :id, 'cv_expense_this_month'
    element :widget_last_30_days, :id, 'cv_expense_last30_days'
    element :widget_open_expenses, :id, 'cv_open_expense'
    element :expenses_this_month_amount, :id, 'tv_expense_this_month'
    element :expenses_last_30_days_amount, :id, 'tv_expense_last30_days'
    element :open_expenses_amount, :id, 'tv_open_expense'
    element :btn_create_expenses, :id, 'fab_create_expense'
    element :input_search, :id, 'search_src_text'
    elements :list_item_expense, :id, 'rl_expense_list'
    element :product_tour, :id, 'clTourContent'
    element :close_product_tour, :id, 'ivSkip'
    element :list_expense_transation, :id, 'tv_expense_list_transaction_no'
    element :delete_search, :id, 'search_close_btn'

    def search_expense(expense_details)
      sleep 3
      delete_search.click if has_delete_search?
      wait_long_for { input_search.displayed? }
      input_search.send_keys expense_details[:expense_number]
    end
  end
end
