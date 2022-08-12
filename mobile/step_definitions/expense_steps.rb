And 'user create new expenses using {string} from {string}' do |expense_detail, screen_name|
  @expense_detail = @app_requirement.expense_requirement.load_expense_details(expense_detail).with_indifferent_access
  @app.expense_overview_screen.tab_expenses.click if screen_name.eql? 'expense tab'
  @app.expense_overview_screen.btn_create_expenses.click
  wait_for { @app.expense_form_screen.btn_create_expense.displayed? }
  @app.expense_form_screen.fill_expense_form(@expense_detail)
end

Then 'expense should be successfully created' do
  sleep 5
  wait_for { @app.expense_detail_screen.has_txt_transaction_no? }
  wait_for { @app.expense_detail_screen.txt_beneficiary_name.displayed? && !@app.expense_detail_screen.txt_beneficiary_name.text.nil? && !@app.expense_detail_screen.txt_beneficiary_name.text.nil? }
  expect(@app.expense_detail_screen.txt_beneficiary_name.text).to eql @expense_detail[:beneficiary_name]
  if @expense_detail[:pay_later]
    expect(@app.expense_detail_screen.txt_expense_status.text.downcase).to eql 'open'
    expect(@app.expense_detail_screen.txt_due_date.text).to eql @expense_detail[:due_date]
  else
    expect(@app.expense_detail_screen.txt_expense_status.text.downcase).to eql 'paid'
    expect(@app.expense_detail_screen.txt_pay_from_account.text).to eql @expense_detail[:pay_from_account]
  end

  expect(@app.expense_detail_screen.txt_transaction_date.text).to eql @expense_detail[:transaction_date]
  expect(@app.expense_detail_screen.txt_expense_account.text).to eql @expense_detail[:expense_account]
  expect(parse_currency(@app.expense_detail_screen.txt_expense_amount.text)).to eql @expense_detail[:expense_amount]
  swipe(@app.expense_detail_screen.txt_additional_info.location[:x], @app.expense_detail_screen.txt_additional_info.location[:y], $driver.window_size[:width] / 2, $driver.window_size[:height] - 2000)
  expect(@app.expense_detail_screen.txt_expense_tags.text).to eql @expense_detail[:tags] if @expense_detail[:tags].present?
  expect(@app.expense_detail_screen.txt_expense_memo.text).to eql @expense_detail[:memo] if @expense_detail[:memo].present?
  @app.expense_detail_screen.btn_back.click
end

And 'user search expense with {string}' do |search_keyword|
  @search_text = search_keyword
  @app.expense_overview_screen.input_search.send_keys search_keyword
  wait_for { @app.expense_overview_screen.common_screen.has_no_progress_bar_loading? }
end

Then 'expense search result displayed on the list' do
  aggregate_failures('Verify expense list') do
    expect(@app.expense_overview_screen.has_list_item_expense?).to be true
    expect(@app.expense_overview_screen.list_item_expense.size).to be >= 1
  end

  if %w[open paid partial].any? { |x| x == @search_text.downcase }
    @app.expense_overview_screen.list_item_expense[0].click
    wait_for { @app.expense_detail_screen.has_txt_title? }
    expect(@app.expense_detail_screen.txt_expense_status.text.downcase).to eql @search_text.downcase
    @app.expense_detail_screen.btn_back.click
  elsif !@search_text.match(/\d{5}/).nil? # search by transaction number
    @app.expense_overview_screen.list_item_expense[0].click
    wait_for { @app.expense_detail_screen.has_txt_title? }
    wait_for { @app.expense_detail_screen.has_txt_transaction_no? && app.expense_detail_screen.txt_transaction_no.text != '' && !app.expense_detail_screen.txt_transaction_no.text.nil? }
    expect(@app.expense_detail_screen.txt_transaction_no.text).to eql "Expense ##{@search_text}"
    @app.expense_detail_screen.btn_back.click
  end
end

Then 'expense should not be created' do
  expect(@app.expense_form_screen.txt_warning_failed.displayed?).to be true
  @app.expense_form_screen.btn_close_warning.click
  @app.expense_form_screen.btn_close_form.click
  @app.expense_form_screen.btn_close_warning.click
  if @expense_detail[:expense_amount].nil? || @expense_detail[:expense_amount].zero?
    # TODO: get element alert
  end
end

And 'user edit open expense {string} to {string} from {string}' do |open_expense_detail, expense_detail, screen_name|
  @expense_detail = @app_requirement.expense_requirement.load_expense_details(expense_detail).with_indifferent_access
  @open_expense_detail = @app_requirement.expense_requirement.load_expense_details(open_expense_detail).with_indifferent_access
  @app.expense_overview_screen.tab_expenses.click if screen_name.eql? 'expense tab'
  @app.expense_overview_screen.btn_create_expenses.click
  @app.expense_form_screen.create_open_expense(@open_expense_detail)
  @app.expense_detail_screen.btn_dropdown_menu.click
  @app.expense_detail_screen.btn_edit.click
  @app.expense_form_screen.edit_open_expense_to_paid(@expense_detail)
end

Then 'expense should be successfully edited' do
  sleep 5
  wait_for { @app.expense_detail_screen.has_txt_transaction_no? }
  wait_for { @app.expense_detail_screen.txt_beneficiary_name.displayed? && !@app.expense_detail_screen.txt_beneficiary_name.text.nil? && !@app.expense_detail_screen.txt_beneficiary_name.text.nil? }
  expect(@app.expense_detail_screen.txt_beneficiary_name.text).to eql @expense_detail[:beneficiary_name]
  expect(@app.expense_detail_screen.txt_expense_status.text.downcase).to eql 'paid'
  expect(@app.expense_detail_screen.txt_transaction_date.text).to eql @expense_detail[:transaction_date]
  expect(@app.expense_detail_screen.txt_expense_account.text).to eql @expense_detail[:expense_account]
  expect(parse_currency(@app.expense_detail_screen.txt_expense_amount.text)).to eql @expense_detail[:expense_amount]
  swipe(@app.expense_detail_screen.txt_additional_info.location[:x], @app.expense_detail_screen.txt_additional_info.location[:y], $driver.window_size[:width] / 2, $driver.window_size[:height] - 2000)
  expect(@app.expense_detail_screen.txt_expense_tags.text).to eql @expense_detail[:tags] if @expense_detail[:tags].present?
  expect(@app.expense_detail_screen.txt_expense_memo.text).to eql @expense_detail[:memo] if @expense_detail[:memo].present?
end

And 'user create expense using {string} from {string}' do |expense_detail, screen_name|
  @expense_detail = @app_requirement.expense_requirement.load_expense_details(expense_detail).with_indifferent_access
  @app.expense_overview_screen.tab_expenses.click if screen_name.eql? 'expense tab'
  @app.expense_overview_screen.btn_create_expenses.click
  @app.expense_form_screen.create_with_only_expense_account_selected(@expense_detail)
end

Then 'expense should be successfully created even selecting only expenses account' do
  wait_for { @app.expense_detail_screen.has_txt_transaction_no? }
  sleep 3
  expect(@app.expense_detail_screen.txt_expense_account.text).to eql @expense_detail[:expense_account]
  expect(parse_currency(@app.expense_detail_screen.txt_expense_amount.text)).to eql @expense_detail[:expense_amount]
  @app.expense_form_screen.btn_back.click
end

And 'user delete expense {string} from {string}' do |expense_detail, screen_name|
  @expense_detail = @app_requirement.expense_requirement.load_expense_details(expense_detail).with_indifferent_access
  @app.expense_overview_screen.tab_expenses.click if screen_name.eql? 'expense tab'
  @app.expense_overview_screen.btn_create_expenses.click
  @app.expense_form_screen.create_open_expense(@expense_detail)
  sleep 2
  wait_for { @app.expense_detail_screen.has_btn_back? }
  @app.expense_detail_screen.btn_back.click
  @app.expense_overview_screen.search_expense(@expense_detail)
  sleep 3
  @app.expense_overview_screen.list_expense_transation.click
  @app.expense_detail_screen.btn_dropdown_menu.click
  @app.expense_detail_screen.btn_delete.click
  wait_for { @app.expense_detail_screen.has_btn_confirm_delete? }
  @app.expense_detail_screen.btn_confirm_delete.click
  @app.expense_overview_screen.search_expense(@expense_detail)
end

Then 'expense should be successfully deleted' do
  sleep 3
  expect(@app.expense_overview_screen.has_no_list_expense_transation?)
end
