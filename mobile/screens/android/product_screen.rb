module Android
  class ProductScreen < Appom::Page
    section :common_screen, CommonScreen, :id, 'android:id/content'
    element :product_service_tab, :accessibility_id, 'PRODUCT & SERVICE'
    element :search, :id, 'search_src_text'
    elements :list_item_product_name, :id, 'tv_name_product'
    element :create_product_btn, :id, 'fab_create_product'

    # create product form
    element :create_product_name, :id, 'et_create_product_name'
    element :create_product_code, :id, 'et_create_product_code'
    element :create_product_unit, :id, 'tv_create_product_unit'
    element :create_product_desc, :id, 'et_create_product_description'
    element :create_product_categories, :id, 'tv_add_categories'
    element :create_product_toggle_stack, :id, 's_create_product_track'
    element :create_product_inv_account, :id, 'tv_select_track_account'
    element :create_product_toggle_buy, :id, 's_create_product_buy'
    element :create_product_buy_price, :id, 'tiet_create_product_buy_price'
    element :create_product_buy_account, :id, 'tv_select_buy_account'
    element :create_product_buy_tax, :id, 'tv_select_buy_tax'
    element :create_product_toggle_sell, :id, 's_create_product_sell'
    element :create_product_sell_price, :id, 'tiet_create_product_sell_price'
    element :create_product_sell_account, :id, 'tv_select_sell_account'
    element :create_product_sell_tax, :id, 'tv_select_sell_tax'
    element :create_product_button_top, :id, 'btn_create'
    element :create_product_btn_create, :id, 'btn_create_product'
    # category
    element :add_new_category, :id, 'rl_product_add'
    element :input_category_name, :id, 'userInputDialog'
    element :remove_selected_category, :id, 'iv_remove'

    element :list_account_name, :id, 'rl_account_list'
    elements :list_item_account_name, :id, 'tv_account_list_name'
    element :popup_select_tax, :id, 'tv_bottom_sheet_title'
    elements :list_item_tax, :id, 'tv_create_invoice_term'
    # buythisitem
    element :buy_item_toggle, :id, 's_create_product_buy'
    element :input_buy_price, :id, 'tiet_create_product_buy_price'
    element :select_buy_account, :id, 'tv_select_buy_account'
    element :select_buy_tax, :id, 'tv_select_buy_tax'
    # sellthisitem
    element :sell_item_toggle, :id, 's_create_product_sell'
    element :input_sell_price, :id, 'tiet_create_product_sell_price'
    element :select_sell_account, :id, 'tv_select_sell_account'
    element :select_sell_tax, :id, 'tv_select_sell_tax'

    def fill_product_info(product_details)
      wait_for { has_create_product_button_top? }
      input_product_name(product_details[:name])
      input_product_code(product_details[:code])
      input_product_desc(product_details[:description])
      insert_product_category(product_details[:category])
      select_stock_option(product_details[:stock_option])
      select_buy_option(product_details[:stock_option])
      select_sell_option(product_details[:stock_option])
      swipe_direction('up')
      create_product_btn_create.click
    end

    def edit_product_info(product_updated)
      create_product_name.clear
      input_product_name(product_updated[:name])
      create_product_code.clear
      input_product_code(product_updated[:code])
      create_product_desc.clear
      input_product_desc(product_updated[:description])
      update_product_category(product_updated[:category])
      swipe_direction('up')
      buy_item_toggle.click
      input_buy_price.send_keys product_updated[:buy_price] if has_input_buy_price?
      select_product_account(select_buy_account, product_updated[:buy_account]) if has_select_buy_account?
      select_tax(select_buy_tax, product_updated[:buy_tax]) if has_select_buy_tax?
      swipe_direction('up')
      sell_item_toggle.click
      input_sell_price.send_keys product_updated[:sell_price] if has_input_sell_price?
      select_product_account(select_sell_account, product_updated[:sell_account]) if has_select_sell_account?
      select_tax(select_sell_tax, product_updated[:sell_tax]) if has_select_sell_tax?
      swipe_direction('up')
      create_product_btn_create.click
    end

    def input_product_name(name)
      create_product_name.send_keys name
    end

    def input_product_code(code)
      create_product_code.send_keys code
    end

    def input_product_desc(desc)
      create_product_desc.send_keys desc
    end

    def insert_product_category(category)
      # TODO: handle input category
    end

    def select_stock_option(stock)
      # TODO: handle stock option
    end

    def select_buy_option(buy)
      # TODO: handle buy option
    end

    def select_sell_option(sell)
      # TODO: handle sell option
    end

    def update_product_category(category)
      remove_selected_category.click if has_remove_selected_category?
      create_product_categories.click
      add_new_category.click
      input_category_name.send_keys category
      find_element_by_text('CREATE', 'Button').click
      sleep 3
      create_product_button_top.click
    end

    def select_product_account(element_name, account_name)
      element_name.click
      wait_for { list_account_name.displayed? }
      search.send_keys account_name
      wait_for { list_account_name.displayed? || txt_no_data.displayed? }
      list_item_account_name.select { |account| account.text == account_name }.first.click
    end

    def select_tax(element_name, tax_name)
      element_name.click
      wait_for { popup_select_tax.displayed? }
      list_item_tax.select { |tax| tax.text == tax_name }.first.click
    end
  end
end
