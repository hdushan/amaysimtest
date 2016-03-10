require 'capybara/cucumber'
require 'selenium-webdriver'
require_relative 'data'

$test_data_folder = File.join(Dir.pwd, "environments")

unless ENV['ENVIRONMENT']
  ENV['ENVIRONMENT'] = "PROD"
end

$test_data = read_test_data_file(ENV["ENVIRONMENT"])



@browser = ENV['BROWSER'] || :phantomjs

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => @browser.to_sym)
end

Capybara.default_driver  = :selenium

Capybara.configure do |config|
  config.run_server = false
  config.app_host   = $test_data["SERVER_URL"]
end

Before do
  Capybara.page.driver.browser.manage.window.maximize
end

