When('accountant create new draft {string} using data {string}') do |transaction, data_detail|
  @data = data_detail
  case transaction
  when 'Sales Quote'
    step "user go to 'sales overview' screen"
    step "user create new sales quote using '#{@data}' from 'sales overview'"
  when 'Sales Order'
    step "user go to 'sales overview' screen"
    step "user create new sales order using '#{@data}' from 'sales overview'"
  when 'Sales Invoice'
    step "user go to 'sales overview' screen"
    step "user create new sales invoice using '#{@data}' from 'sales overview'"
  end
end

Then('new approval draft sucessfully created') do
  wait_for { @app.notification_screen.txt_transaction_status.displayed? }
  expect(@app.notification_screen.txt_transaction_status.text).to eql 'DRAFT'
  @trans_no = @app.notification_screen.txt_transaction_no.text
end

When('user approve draft {string} on approval log menu') do |transaction|
  wait_for { @app.dashboard_screen.btn_notification.displayed? }
  @app.dashboard_screen.btn_notification.click
  @app.notification_screen.content_tour_close.click if @app.notification_screen.content_tour.displayed?
  wait_for { @app.notification_screen.tab_approval.displayed? }
  @app.notification_screen.tab_approval.click
  @app.notification_screen.approval_sales.click if transaction.include?('Sales')
  wait_for { @app.notification_screen.txt_transaction_no.displayed? }
  $driver.find_element(:xpath, "//android.widget.TextView[@resource-id='id.jurnal.mobile:id/tvTransactionNo'][contains(@text,'#{@trans_no}')]").click
  wait_for { @app.notification_screen.btn_approve_trans.displayed? }
  @app.notification_screen.btn_approve_trans.click
  wait_for { @app.notification_screen.txt_approval_confirmation_title.displayed? }
  @app.notification_screen.btn_approve_confirmation.click
end

Then('new approaval draft succesfully approved') do
  wait_long_for { @app.notification_screen.has_no_btn_approve_trans? }
  expect(@app.notification_screen.txt_transaction_status.text).to eql 'OPEN'
end
