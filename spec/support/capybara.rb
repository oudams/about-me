require "selenium/webdriver"

# Silent puma server http://bit.ly/2HNiv4R
Capybara.server = :puma, { Silent: true }

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test # set to :selenium(slower and witout chrome headless) or :rack_test(faster and with chrome headless)
  end

  config.before(:each, type: :system, selenium_chrome: true) do
    driven_by :selenium, using: :chrome
  end
end
