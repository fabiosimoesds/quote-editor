require "application_system_test_case"

class LineItemDateTest < ApplicationSystemTestCase
  setup do
    login_as user(:accountant) # Login as accountant first
    @quote = Quote.order(created_at: :desc).first # Reference to the first fixture quote
    visit quotes_path
    click_on @quote.name
  end

  test 'Check the page' do
    assert_selector 'h1', text: @quote.name
  end

  test 'New Date Creation' do
    # Click on New Date
    click_on "New date"

    # fill_in 'Date', with: Date.current + 1
    click_on 'Create date'
    assert_text I18n.l(Date.current + 1, format: :long)
  end
end
