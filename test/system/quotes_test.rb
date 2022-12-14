require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    login_as user(:accountant) # Login as accountant first
    @quote = Quote.order(created_at: :desc).first # Reference to the first fixture quote
    visit quotes_path
  end
  test "Create a new quote" do
    # When we visit the Quotes#index page we expecte to see a title with the text "Quotes"
    assert_selector "h1", text: "Quotes"

    # When we click on the link with the text "New Quote" we expect to land on a page with the title "New Quote"
    click_on "New quote"

    # When we fill in the name input with "Capybara quote" and we click on "Create Quote"

    fill_in "Name", with: "Capybara quote"
    assert_selector "h1", text: "Quotes"
    click_on "Create quote"

    # We expect to be back on the page with the title "Quotes" and to see our "Capybara Quote" added to the list
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    # When we click on the quote we expect to be redirect to the Quotes#show of that specific quote and see a
    # title with the quote.name
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    # Visit the index page
    assert_selector "h1", text: "Quotes"

    # Click on the Edit quote that matches the first quotes.yml
    click_on "Edit", match: :first

    # Change the quote name to Updated quote and click on Update Quote
    fill_in "Name", with: "Updated quote"
    assert_selector "h1", text: "Quotes"
    click_on "Update quote"

    # We should have the Updated quote, been updated.
    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    # Visit the index page and find the quote
    assert_text @quote.name

    # Click delete quote e check if the quote is there or not
    accept_confirm do
      click_on "Delete", match: :first
    end
    assert_no_text @quote.name
  end

  test "#total_price returns the total price of all line items of a quote" do
    assert_equal 2500, quotes(:first).total_price
  end
end
