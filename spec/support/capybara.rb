require 'capybara/rspec'

# SELENIUM-CHROME-HEADLESS
# Capybara.javascript_driver = :selenium_chrome_headless
# Capybara.default_max_wait_time = 10
# Capybara.default_driver = :selenium_chrome_headless
#   driven_by :selenium_chrome_headless, using: :chrome, screen_size: [1920, 1080]
# Selenium::WebDriver::Chrome.path = 'C:/Windows/chrome-headless-shell-win64'

# ---------

# RACK_TEST
# Capybara.javascript_driver = :rack_test
# Capybara.default_max_wait_time = 10
# Capybara.default_driver = :rack_test

# ---------
# Capybara.default_driver = :selenium_chrome

# JULIO'S CONFIG
# ==============

Capybara.default_driver = :selenium_chrome
Capybara.default_max_wait_time = 10
RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium, using: :chrome, screen_size: [1920, 1080]
  end
  # config.before(:each, type: :system) do
  #   driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
  # end
end
