# rubocop:disable Style/MixinUsage
# require 'parallel'
require 'rspec/expectations'
require 'appium_lib'
require 'pry'
require 'dotenv'
require 'data_magic'
require 'appom'
require 'byebug'
require 'chunky_png'
require 'active_support'
require 'active_support/core_ext'
require 'active_support/core_ext/hash/indifferent_access'
require 'require_all'
require_rel '../screens/sections/android/common_screen'
require_relative 'helpers/base_helper'
require_relative 'helpers/global_helper'
require_relative 'platform_selector'
include GlobalHelper
include BaseHelper
include RSpec::Matchers

Dotenv.load
$root_directory = Dir.pwd
DataMagic.yml_directory = "#{$root_directory}/data"

$capabilities = PlatformSelector.new.select(ENV['PLATFORM'].downcase)
server_url_port = ENV['PLATFORM'].casecmp('android').zero? ? 'http://0.0.0.0:4723/wd/hub' : 'http://0.0.0.0:4724/wd/hub'

appium_lib_options = {
  server_url: server_url_port
}

Appom.register_driver do
  options = {
    appium_lib: appium_lib_options,
    caps: $capabilities
  }
  $driver = Appium::Driver.new(options, false)
end

if ENV['AUTOSTART_EMULATOR_AND_APPIUM'].casecmp('true').zero?
  begin
    ENV['APPIUM_PORT'] = ENV['PLATFORM'].casecmp('android').zero? ? '4723' : '4724'
    bp = ENV['APPIUM_PORT'].to_i + 1000
    log_filename = File.expand_path('appium_server.log')

    command = "appium -p #{ENV['APPIUM_PORT']} -bp #{bp} --log #{log_filename} --local-timezone 1>&2"
    puts "Starting Appium server (log: #{log_filename})"
    pid = Process.spawn(command)
    if pid.zero?
      puts 'Appium server did not start'
      exit(false)
    else
      puts "Appium has been started with PID: #{pid}"
    end
    sleep 3
  end

  at_exit do
    puts 'Exiting Driver'
    $driver.driver_quit
    port = ENV['APPIUM_PORT'].to_i
    `lsof -t -i tcp:#{port}`.each_line.map(&:to_i).map { |my_pid| `kill -9 #{my_pid}` }
    case ENV['PLATFORM'].downcase
    when 'android'
      `adb emu kill`
      puts 'Android Emulator has been killed'
    when 'ios'
      `killall "Simulator"`
      puts 'iOS Simulator has been killed'
    else
      raise 'Emulator/Simulator can not be killed due to invalid syntax'
    end
  end
end
# rubocop:enable Style/MixinUsage
