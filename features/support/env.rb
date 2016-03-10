require 'capybara/cucumber'
require 'selenium-webdriver'
require_relative 'data'

def is_linux?
  return File.exist? "/usr" if RUBY_PLATFORM == 'java'
  RUBY_PLATFORM =~ /linux/
end

def is_windows?
  (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
end

def is_mac?
  (/darwin/ =~ RUBY_PLATFORM) != nil
end

if is_linux?
  ENV['PATH'] = (File.join(Dir.pwd, 'tools', 'linux', ":") << ENV['PATH']).freeze
elsif is_mac?
  ENV['PATH'] = (File.join(Dir.pwd, 'tools', ":") << ENV['PATH']).freeze
else
  ENV['PATH'] = (File.join(Dir.pwd, 'tools', ";") << ENV['PATH']).freeze
end

puts "\n\nPATH: " + ENV[PATH] + "\n\n"

$test_data_folder = File.join(Dir.pwd, "environments")

unless ENV['ENVIRONMENT']
  ENV['ENVIRONMENT'] = "PROD"
end

$test_data = read_test_data_file(ENV["ENVIRONMENT"])



$browser = ENV['BROWSER'] || "chrome"

if $browser != 'phantomjs'
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => $browser.downcase.to_sym)
  end
  Capybara.default_driver  = :selenium
else
  require 'capybara/poltergeist'
  Capybara.javascript_driver = :poltergeist
  Capybara.default_driver = :poltergeist
  Capybara.current_driver = :poltergeist
end

Capybara.configure do |config|
  config.run_server = false
  config.app_host   = $test_data["SERVER_URL"]
  config.default_max_wait_time = 300
end



