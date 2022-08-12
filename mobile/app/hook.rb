Before do |scenario|
  @app = InitializeScreens.new(ENV['PLATFORM'])
  @app_requirement = InitializeRequirements.new
  @step_list = []
  @count_step = 0
  scenario.test_steps.each { |x| @step_list << x.text unless x.text.include? 'hook' }
  $current_step = @step_list[@count_step]
end

AfterStep do
  @count_step += 1
  $current_step = @step_list[@count_step]
end

# reinstall app that have @reset_before tag
Before('@reset_before') do
  p 'reset before'
  reset_app
end

# close app and reopen app, like killing app
Before('@kill_app') do
  p 'kill apps'
  reopen_app
end

After do |scenario|
  scenario_id = if scenario.respond_to?('scenario_outline')
                  scenario.scenario_outline.cell_values.first
                else
                  scenario.name.split('-')[0].strip
                end
  if scenario.failed?
    p "FAILED in scenario #{scenario.name}"
    screenshot = take_screenshot_and_resize(scenario)
    base64_img = Base64.encode64(File.open(screenshot, 'r:UTF-8', &:read))
    embed(base64_img, 'image/png;base64')
    # if ENV['PLATFORM'] == 'ios'
    #   $driver.reset
    # else
    #   $driver.close_app # close the app first so the next scenario can run from start, not from the last error screen
    # end
    $driver.close_app # close the app first so the next scenario can run from start, not from the last error screen
  end
  puts scenario_id.tr('A', '').tr('I', '')
  puts scenario.status.to_s
  TestrailHelper.new.update_testrail_result(ENV['RUN_ID'], scenario_id, scenario.status.to_s) if ENV['TESTRAIL_UPDATE'].casecmp('true').zero?
end

# reinstall app that have @reset_after tag
After('@reset_after') do
  reset_app
end

private

def reset_app
  if ENV['PLATFORM'] == 'ios'
    $driver.remove_app($capabilities['bundleId'])
    dir = File.absolute_path('.')

    begin
      $driver.install_app(dir + '/' + $capabilities['app'])
    rescue Exception
      @error_message = $ERROR_INFO.to_s
    ensure
      $driver.install_app(dir + '/' + $capabilities['app'])
    end
    $driver.activate_app($capabilities['bundleId'])
    alert_action('accept')
    # accept_alert_by_text('Allow')
  else
    $driver.reset
  end
end

def driver_session_exists?
  $driver.device_time
  puts "Driver device time ==> #{$driver.device_time}"
  true
rescue Exception
  false
end
