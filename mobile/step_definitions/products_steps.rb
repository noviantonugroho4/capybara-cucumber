When('user create new products using {string}') do |product|
  wait_for { @app.product_screen.has_product_service_tab? }
  wait_for { @app.product_screen.has_create_product_btn? }
  @product_detail = @app_requirement.products_requirement.load_product_details(product).with_indifferent_access
  @app.product_screen.create_product_btn.click
  wait_for { @app.product_screen.has_create_product_unit? && !@app.product_screen.create_product_unit.text.nil? }
  @app.product_screen.fill_product_info(@product_detail)
end

Then('product should be successfully created') do
  wait_for { @app.product_detail_screen.has_details_tab? }
  @app.product_detail_screen.verify_details_product(@product_detail)
  @app.product_detail_screen.btn_back.click
end

When('user search product with {string}') do |keyword|
  wait_for { @app.product_screen.has_product_service_tab? }
  wait_for { @app.product_screen.has_create_product_btn? }
  @keyword = keyword
  @app.product_screen.search.send_keys keyword
  sleep 2
  wait_for { @app.product_screen.has_list_item_product_name? }
end

Then('product search result displayed on the list') do
  @app.product_screen.list_item_product_name.select { |prod| prod.text == @keyword }.first.click
  wait_for { @app.product_detail_screen.has_details_tab? }
  wait_for { @app.product_detail_screen.product_name.displayed? && !@app.product_detail_screen.product_name.text.nil? }
  expect(@app.product_detail_screen.product_name.text).to eql @keyword
  @app.product_detail_screen.btn_back.click
end

When('user edit products using {string}') do |product|
  wait_for { @app.product_screen.has_product_service_tab? }
  @product_detail = @app_requirement.products_requirement.load_product_details(product).with_indifferent_access
  sleep 3
  @app.product_screen.list_item_product_name.first.click
  @app.product_detail_screen.btn_more.click
  sleep 2
  @app.product_detail_screen.btn_edit.first.click
  wait_for { @app.product_screen.has_create_product_unit? && !@app.product_screen.create_product_unit.text.nil? }
  @app.product_screen.edit_product_info(@product_detail)
end

Then('product should be successfully edited') do
  sleep 3
  wait_for { @app.product_detail_screen.has_details_tab? }
  @app.product_detail_screen.verify_details_product(@product_detail)
  @app.product_detail_screen.btn_back.click
end
