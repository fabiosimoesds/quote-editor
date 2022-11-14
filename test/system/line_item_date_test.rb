require "application_system_test_case"

class LineItemDateTest < ApplicationSystemTestCase
  setup do
    login_as user(:accountant) # Login as accountant first
    @quote = Quote.order(created_at: :desc).first # Reference to the first fixture quote
    visit quotes_path
    click_on @quote.name
    @date = LineItemDate.order(created_at: :desc).first
  end

  test 'Check the page' do
    assert_selector 'h1', text: @quote.name
  end

  test 'New Date Creation' do
    # Click on New Date
    click_on "New date"

    fill_in "Date", with: Date.current + 1.day
    click_on 'Create date'
    assert_text I18n.l(Date.current + 1.day, format: :long)
  end

  test 'Edit and Update Date' do
    click_on 'Edit', match: :first

    fill_in 'Date', with: Date.current + 5
    click_on 'Update date'
    assert_text I18n.l(Date.current + 5, format: :long)
  end

  test 'Destroy Date' do
    accept_confirm do
      click_on 'Delete', match: :first
    end
    assert_no_text @date.date
  end
end
