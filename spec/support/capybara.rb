if ENV["LAUNCH_BROWSER"]
  Capybara.configure do |config|
    config.server_host = "web.com"
    config.javascript_driver = :selenium_chrome
  end

  Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        chromeOptions: {
          args: [
            "window-size=1024,768"
          ]
        }
      ),
      url: "http://chrome:4444/wd/hub"
    )
  end
else
  Capybara.server = :puma, { Silent: true }

  Capybara.register_driver :chrome_headless do |app|
    options = ::Selenium::WebDriver::Chrome::Options.new

    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--window-size=1400,1400')

    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  Capybara.javascript_driver = :chrome_headless
end
