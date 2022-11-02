require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Warden::Test::Helpers # Warden test helpers included so we can use the helpers on our tests

  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
end
