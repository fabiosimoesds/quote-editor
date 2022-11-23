require 'rails_helper'

RSpec.feature "QuoteIndexPages", type: :feature do
  feature 'User see the quotes#index page' do
    setup do
      visit root_path
      click_on "Sign in", match: :first
      fill_in "Email", with: "accountant@kpmg.com"
      fill_in "Password", with: "password"
      click_on 'Log in'
      visit quotes_path
      @quote = Quote.first
    end

    scenario 'Checking if user is in the right page after Sign in' do
      assert_selector "h1", text: "Quotes"
    end

    scenario 'Create a new quote' do
      click_on "New quote"
      fill_in "Name", with: "Capybara Create"
      click_on "Create quote"

      assert_selector "h1", text: "Quotes"
      expect(page).to have_content "Capybara Create"
      expect(page).to have_content "Quote was successfully created."
    end

    scenario 'Editing an existing quote' do
      click_on "Edit", match: :first
      fill_in "Name", with: "Capybara Edit"
      click_on "Update quote"

      assert_selector "h1", text: "Quotes"
      expect(page).to have_content "Capybara Edit"
      expect(page).to have_content "Quote was successfully updated."
    end

    context "The form is invalid" do
      scenario 'User sees a useful error message while Creating a new quote' do
        click_on "New quote"
        click_on "Create quote"
        expect(page).to have_content "Name can't be blank"
      end

      scenario 'User sees a useful error message while Updating a new quote' do
        click_on "Edit", match: :first
        fill_in "Name", with: ""
        click_on "Update quote"
        expect(page).to have_content "Name can't be blank"
      end
    end

    scenario 'Deleting an existing quote' do
      click_on "Delete", match: :first

      assert_selector "h1", text: "Quotes"
      expect(page).not_to have_content @quote.name
      expect(page).to have_content "Quote was successfully destroyed"
    end

    scenario 'Visiting the show page' do
      click_on @quote.name

      assert_selector "h1", text: @quote.name
    end
  end
end
