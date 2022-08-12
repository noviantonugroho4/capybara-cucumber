# rubocop:disable Metrics/ModuleLength

module BaseHelper
  ## GESTURE LIB ##
  def wait_for(optional_element: false)
    Selenium::WebDriver::Wait.new(timeout: 20).until { yield }
  rescue Selenium::WebDriver::Error::TimeOutError => _e
    raise unless optional_element
  end

  def wait_short_for(optional_element: false)
    Selenium::WebDriver::Wait.new(timeout: 3).until { yield }
  rescue Selenium::WebDriver::Error::TimeOutError => _e
    raise unless optional_element
  end

  def wait_long_for(optional_element: false)
    Selenium::WebDriver::Wait.new(timeout: 30).until { yield }
  rescue Selenium::WebDriver::Error::TimeOutError => _e
    raise unless optional_element
  end

  # for ios only
  def double_tap(x_coordinate: nil, y_coordinate: nil, element: nil)
    return 'Set x, y or element' if (x_coordinate.nil? || y_coordinate.nil?) && element.nil?

    args = element.nil? ? { x_coordinate: x_coordinate, y_coordinate: y_coordinate } : { element: element.ref }
    $driver.execute_script 'mobile: doubleTap', args
  end

  def swipe_using_elements(access_type1, access_name1, access_type2, access_name2)
    # to get start x,y co-ordinates
    ele_from = wait_for { $driver.find_element("#{access_type1}": access_name1.to_s) }.location
    start_x = ele_from.x
    start_y = ele_from.y

    # to get end x,y co-ordinates
    ele_to = wait_for { $driver.find_element("#{access_type2}": access_name2.to_s) }.location
    end_x = ele_to.x
    end_y = ele_to.y

    swipe(start_x, start_y, end_x, end_y)
  end

  def swipe(start_x, start_y, end_x, end_y)
    action = Appium::TouchAction.new.press(x: start_x.to_s, y: start_y.to_s).wait(1000).move_to(x: end_x.to_s, y: end_y.to_s).release
    action.perform
  end

  def swipe_direction(direction)
    size = $driver.manage.window.size
    p size
    height = size.height.to_i - 10
    width = size.width.to_i - 10

    if direction == 'right'
      start_x = (width / 100) * 15 # 83
      start_y = height / 2 # 695
      end_x = (width / 100) * 90 # 900
      end_y = height / 2 # 630
    elsif direction == 'left'
      start_x = (width / 100) * 90
      start_y = height / 2
      end_x = (width / 100) * 15
      end_y = height / 2
    elsif direction == 'up'
      start_x = width / 2
      start_y = (height / 100) * 90
      end_x = width / 2
      end_y = (height / 100) * 15
    elsif direction == 'down'
      start_x = width / 2
      start_y = (height / 100) * 15
      end_x = width / 2
      end_y = (height / 100) * 90
    else
      raise 'invalid direction'
    end

    swipe(start_x, start_y, end_x, end_y)
  end

  def swipe_element_with_direction(access_type, access_name, direction)
    ele_from = wait_for { $driver.find_element("#{access_type}": access_name.to_s) }.location
    p ele_from
    x_start = ele_from.x
    y_start = ele_from.y

    ele_size = wait_for { $driver.find_element("#{access_type}": access_name.to_s) }
    ele_height = ele_size.size.height.to_i
    ele_width =  ele_size.size.width.to_i

    x_end = x_start + ele_width
    y_end = y_start + ele_height

    puts "[#{x_start},#{y_start}],[#{x_end},#{y_end}]"

    puts "ele_height : #{ele_height}" # 1776
    puts "ele_width :#{ele_width}" #

    size = $driver.manage.window.size
    height = size.height.to_i - 5
    puts "height : #{height}" # 1776
    width = size.width.to_i - 5
    puts "width :#{width}"

    if direction == 'right'
      start_x = x_start + (ele_width * 0.25)
      start_y = y_start + (ele_height / 2)
      end_x = width # 900
      end_y = y_start + (ele_height / 2)
    elsif direction == 'left'
      start_x = x_end - 5
      start_y = y_end - (ele_height / 2)
      end_x = 10
      end_y = y_end - (ele_height / 2)
    elsif direction == 'up'
      ele_height = height if ele_height > height

      y_end = y_start + ele_height if y_end > height

      puts "ele_height: #{ele_height}"
      puts "ele_height*).75: #{ele_height * 0.75}"
      puts y_end
      start_x = x_end - (ele_width / 2)

      start_y = y_end - (ele_height * 0.75)

      if start_y.negative?
        y_start = 0
        y_end = y_start + ele_height
        start_y = y_end - (ele_height * 0.75)
      end

      end_x = (x_end / 2)
      end_y = 10
    elsif direction == 'down'
      start_x = x_start + (ele_width / 2)
      ele_height = height if ele_height > height
      start_y = y_start + (ele_height * 0.25)
      if start_y.negative?
        y_start = 0
        ele_height = height if ele_height > height
        start_y = y_start + (ele_height * 0.25)
        puts "ele_height: #{ele_height}"
        puts "ele_height*0.25: #{ele_height * 0.25}"
      end
      end_x = x_start + (ele_width / 2)
      ele_height = height if ele_height > height
      end_y = ele_height
    else
      raise 'invalid direction'
    end

    puts "start_x: #{start_x}, start_y: #{start_y}"
    puts "end_x: #{end_x}, end_y: #{end_y}"

    swipe(start_x, start_y, end_x, end_y)
  end

  def swipe_coordinates_with_direction(start_x, start_y, direction)
    size = $driver.manage.window.size
    height = size.height.to_i - 5
    puts "height : #{height}"
    width = size.width.to_i - 5
    puts "width :#{width}"

    if direction == 'right'
      start_x = start_x
      start_y = start_y
      end_x = width
      end_y = start_y
    elsif direction == 'left'
      start_x = start_x
      start_y = start_y
      end_x = 10
      end_y = start_y
    elsif direction == 'up'
      start_x = start_x
      start_y = start_y
      end_x = start_x
      end_y = 10
    elsif direction == 'down'
      start_x = start_x
      start_y = start_y
      end_x = start_x
      end_y = height
    else
      raise 'invalid direction'
    end

    swipe(start_x, start_y, end_x, end_y)
  end

  def swipe_until_find(direction, elm)
    swipe_direction(direction) until element_displayed?(elm)
  end

  def element_displayed?(elm)
    $driver.find_element(elm[0], elm[1]).displayed?
  rescue Exception
    false
  end

  def swipe_until_find_directly_xpath(direction, elm)
    swipe_direction(direction) until $driver.find_element(:xpath, elm).displayed?
  end

  def long_press_on_element_default_duration(access_type, access_name)
    ele_from = wait_for { $driver.find_element("#{access_type}": access_name.to_s) }.location
    x = ele_from.x
    y = ele_from.y

    action = Appium::TouchAction.new.press(x: x.to_s, y: y.to_s).wait(2000).move_to(x: x.to_s, y: y.to_s).release
    action.perform
  rescue Exception => e
    return print '' if e.to_s == 'The swipe did not complete successfully'

    raise e
  end

  def long_press_on_element_with_duration(access_type, access_name, duration)
    ele_from = wait_for { $driver.find_element("#{access_type}": access_name.to_s) }.location
    x = ele_from.x
    y = ele_from.y

    duration = duration.to_i
    duration *= 1000
    action = Appium::TouchAction.new.press(x: x.to_s, y: y.to_s).wait(duration.to_s).move_to(x: x.to_s, y: y.to_s).release
    action.perform
  rescue Exception => e
    return print '' if e.to_s == 'The swipe did not complete successfully'

    raise e
  end

  def long_press_on_coordinates(xcord, ycord)
    action = Appium::TouchAction.new.press(x: xcord.to_s, y: ycord.to_s).wait(2000).move_to(x: xcord.to_s, y: ycord.to_s).release
    action.perform
  end

  def long_press_on_coordinates_with_duration(xcord, ycord, duration)
    duration = duration.to_i
    duration *= 1000
    puts duration
    action = Appium::TouchAction.new.press(x: xcord.to_s, y: ycord.to_s).wait(duration.to_s).move_to(x: xcord.to_s, y: ycord.to_s).release
    action.perform
  end

  def select_picker_wheel(element:, order:, offset: 0.1)
    return 'Set "next" or "previous" for :order' unless %w[next previous].include?(order)

    args = { element: element.ref, order: order }
    args[:offset] = offset if offset
    $driver.execute_script 'mobile: selectPickerWheelValue', args
  end

  def alert_action(action_type)
    tries ||= 3
    alert = $driver.switch_to.alert
  rescue Selenium::WebDriver::Error::NoSuchAlertError
    retry unless (tries -= 1).zero?
    puts 'no alert'
  else
    case action_type
    when 'accept'
      alert.accept
    when 'dismiss'
      alert.dismiss
    end
  end

  def alert_text
    tries ||= 3
    alert = $driver.switch_to.alert
  rescue Selenium::WebDriver::Error::NoSuchAlertError
    retry unless (tries -= 1).zero?
    nil
  else
    alert_text = alert.text
    alert_text
  end

  def find_element_by_text(text, element)
    if ENV['PLATFORM'] == 'android' && element == 'TextView'
      $driver.find_element('xpath': "//android.widget.TextView[@text='#{text}']")
    elsif ENV['PLATFORM'] == 'android' && element == 'View'
      $driver.find_element('xpath': "//android.view.View[@index='#{text}']")
    elsif ENV['PLATFORM'] == 'android' && element == 'Button'
      $driver.find_element('xpath': "//android.widget.Button[@text='#{text}']")
    elsif ENV['PLATFORM'] == 'ios'
      $driver.find_element("name": text.to_s)
    end
  end

  def find_text_on_scrollable(visible_text)
    $driver.find_element("uiautomator": 'new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(new UiSelector().textContains("' + visible_text + '").instance(0))')
  end
  ## GESTURE LIB ##

  ## APPIUM DRIVER LIB ##
  def switch_context(action_type)
    case action_type
    when 'webview'
      webview = $driver.available_contexts.last
      p webview
      $driver.set_context 'WEBVIEW'
    when 'native'
      native = $driver.available_contexts.first
      p native
      $driver.set_context 'NATIVE_APP'
    end
  end

  def open_app
    $driver.launch_app
  end

  def close_app
    $driver.close_app
  end

  def reopen_app
    close_app
    open_app
  end

  def terminate_app(bundle_id)
    $driver.terminate_app(bundle_id)
  end

  def activate_app(bundle_id)
    $driver.activate_app(bundle_id)
  end

  def background_app(time)
    $driver.background_app(time)
  end

  def relaunch_app
    close_app
    open_app
  end

  def reactivate_app
    if ENV['PLATFORM'] == 'ios'
      bundle_id = ENV['BUNDLE_ID']
    elsif ENV['PLATFORM'] == 'android'
      bundle_id = ENV['APP_PACKAGE']
    end
    terminate_app(bundle_id)
    activate_app(bundle_id)
  end

  def finger_print(number)
    $driver.finger_print number
  end

  def go_back
    $driver.back
  end

  def datetime_current
    $driver.device_time
  end

  # Android only
  # real device & emulators : Changing Airplane Mode state only works for Android 6 and older
  def toggle_fight_mode
    $driver.toggle_flight_mode
  end

  # Android only
  # real device & emulators : Changing Wi-Fi connection state should work for all Android versions
  def toggle_wifi
    $driver.toggle_wifi
  end

  # Android only
  # real device : Changing data connection state works for Android 4.4 and older
  # emulators : Changing data connection state should work for all Android versions
  def toggle_data
    $driver.toggle_data
  end

  # Android only
  def toggle_location_data
    $driver.toggle_location_services
  end

  # Android only
  def change_toggle_internet_connection
    toggle_wifi
    toggle_data
  end

  # Android only
  def change_toggle_location
    $driver.toggle_location_services
  end

  def push_file(path_device, path_local)
    $driver.push_file(path_device, File.read(path_local))
  end

  def select_datepicker(element, date)
    # element is the button / text / whatever that will open the datepicker
    split_date = date.split('/')
    current_date = Time.new.to_date.strftime('%d/%m/%Y').split('/')
    element.click

    if ENV['PLATFORM'].eql? 'android'
      wait_for { $driver.find_element(:id, 'android:id/datePicker').displayed? } # the main datepicker
      full_date = Time.parse(date).strftime('%d %B %Y')
      current_selected_date = $driver.find_elements(:xpath, "//android.view.View[@resource-id='android:id/month_view']/android.view.View").select { |x| x.selected.eql? 'true' }[0]
      return if full_date == current_selected_date

      year_picker_element = '//android.widget.ListView[@resource-id="android:id/date_picker_year_picker"]/android.widget.TextView'
      $driver.find_element(:id, 'android:id/date_picker_header_year').click # select year
      wait_for { $driver.find_element(:id, 'android:id/date_picker_year_picker').displayed? } # years list in datepicker
      year_picker = $driver.find_elements(:xpath, year_picker_element)
      top = year_picker.first.location
      bottom = year_picker.last.location

      loop do # loop to select the year
        if year_picker.none? { |year| year.text == split_date[2] } # handle condition if selected year is not exist in current screen
          if split_date[2] > current_date[2] # if selected year is more than current year, swipe up
            swipe(bottom[:x], bottom[:y], top[:x], top[:y] + 100)
          else # swipe down
            swipe(top[:x], top[:y], bottom[:x], bottom[:y] - 100)
          end

          year_picker = $driver.find_elements(:xpath, year_picker_element)
        else
          found = year_picker.select { |year| year.text == split_date[2] }.first
          found.click
          break
        end
      end

      while split_date[1].to_i != current_date[1].to_i # loop to select the month
        if split_date[1].to_i > current_date[1].to_i # if selected month is more than current month, go to the next month
          $driver.find_element(:xpath, '//android.widget.ImageButton[@content-desc="Next month"]').click
          current_date[1] = current_date[1].to_i + 1
        else # if selected month is less than current month, go to the previous month
          $driver.find_element(:xpath, '//android.widget.ImageButton[@content-desc="Previous month"]').click
          current_date[1] = current_date[1].to_i - 1
        end
      end

      # select the date
      $driver.find_element(:xpath, "//android.view.View[@resource-id='android:id/month_view']/android.view.View[@content-desc='#{full_date}']").click
      $driver.find_element(:id, 'android:id/button1').click
    else
      wait_for { $driver.find_element(:predicate, 'type == "XCUIElementTypeDatePicker"').displayed? } # the main datepicker
      year_picker_element = '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther[2]/XCUIElementTypeDatePicker/XCUIElementTypePicker/XCUIElementTypePickerWheel[3]'
      year_picker = $driver.find_element(:xpath, year_picker_element)
      starting_point = year_picker.location[:y] + (year_picker.size[:height] / 2)
      loop do
        break if year_picker.text.eql? split_date[2]

        if split_date[2] > current_date[2] # if selected year is more than current year, swipe up
          swipe(year_picker.location[:x], starting_point, year_picker.location[:x], starting_point + 50)
        else # swipe down
          swipe(year_picker.location[:x], starting_point, year_picker.location[:x], starting_point - 50)
        end
        sleep 1
      end

      month_picker_element = '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther[2]/XCUIElementTypeDatePicker/XCUIElementTypePicker/XCUIElementTypePickerWheel[1]'
      month_picker = $driver.find_element(:xpath, month_picker_element)
      starting_point = month_picker.location[:y] + (month_picker.size[:height] / 2)
      loop do
        break if month_picker.text.eql? Date::MONTHNAMES[split_date[1].to_i]

        if split_date[1] > current_date[1] # if selected year is more than current year, swipe up
          swipe(month_picker.location[:x], starting_point, month_picker.location[:x], starting_point + 50)
        else # swipe down
          swipe(month_picker.location[:x], starting_point, month_picker.location[:x], starting_point - 50)
        end
        sleep 1
      end

      date_picker_element = '//XCUIElementTypeApplication[@name="Jurnal Mobile"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[4]/XCUIElementTypeOther[2]/XCUIElementTypeDatePicker/XCUIElementTypePicker/XCUIElementTypePickerWheel[2]'
      date_picker = $driver.find_element(:xpath, date_picker_element)
      starting_point = date_picker.location[:y] + (date_picker.size[:height] / 2)
      loop do
        break if date_picker.text.to_i.eql? split_date[0].to_i

        if split_date[0] > current_date[0] # if selected year is more than current year, swipe up
          swipe(date_picker.location[:x], starting_point, date_picker.location[:x], starting_point - 50)
        else # swipe down
          swipe(date_picker.location[:x], starting_point, date_picker.location[:x], starting_point + 50)
        end
        sleep 1
      end

      $driver.find_element(:accessibility_id, 'Done').click
    end
  end

  def hide_keyboard_ios(key)
    btn = $driver.find_element(:class_chain, "**/XCUIElementTypeButton[`label == \"#{key}\"`]")
    btn.click
  end

  def take_screenshot_and_resize(scenario)
    # example output: purchase_invoice_feature_15.png, sales_invoice_feature_20.png. The number behind feature name represents the scenario line which is failed
    screenshot_dir = File.absolute_path("./report/screenshots/#{ENV['PLATFORM']}")
    filename = "#{scenario.feature.name.downcase.tr(' ', '_')}_#{scenario.location.line}.png"
    full_path = "#{screenshot_dir}/#{filename}"
    FileUtils.mkdir_p(screenshot_dir) unless File.directory?(screenshot_dir)
    $driver.screenshot(full_path)
    img = ChunkyPNG::Image.from_file(full_path)
    img = img.resize((img.width * 0.5).floor, (img.height * 0.5).floor) # the default screenshot size is too large
    img.save(full_path)

    full_path
  rescue Exception => e
    raise e.message
  end

  def select_dropdown(element, data)
    element.click
    list_element = '//android.widget.ListView//android.widget.TextView'
    wait_for { !$driver.find_elements(:xpath, list_element).empty? }
    $driver.find_elements(:xpath, list_element).select { |x| x.text == data }.first.click
    wait_for { $driver.find_elements(:xpath, list_element).empty? }
  end

  def accept_alert_by_text(text)
    locator = { name: text }

    location = $driver.find_element(locator).location
    size = $driver.find_element(locator).size

    x = (size['width'] / 2) + location['x']
    y = (size['height'] / 2) + location['y']

    Appium::TouchAction.new.press(x: x, y: y).perform
  end

  ## APPIUM DRIVER LIB ##
  module_function :swipe_element_with_direction, :wait_for, :swipe, :alert_action, :select_picker_wheel, :find_element_by_text, :swipe_direction, :find_text_on_scrollable, :hide_keyboard_ios
end

World(BaseHelper)
# rubocop:enable Metrics/ModuleLength
