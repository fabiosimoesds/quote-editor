require 'rails_helper'

RSpec.feature "QuoteShowPages", type: :feature do
  feature 'User see the quotes#Show page' do
    setup do
      user = build(:user)
      visit root_path
      click_on "Sign in", match: :first
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on 'Log in'
      @quote = Quote.first
      @date = LineItemDate.last
      visit quote_path(@quote)
    end

    scenario 'Checking if user is in the right page after Sign in' do
      assert_selector "h1", text: @quote.name
    end

    scenario 'Create a new Date' do
      click_on "New date"
      fill_in "Date", with: Date.current + 1.day
      click_on "Create date"

      assert_selector "h1", text: @quote.name
      expect(page).to have_content I18n.l(Date.current + 1.day, format: :long)
      expect(page).to have_content "Date was successfully created."
    end

    scenario 'Editing an existing date' do
      click_on "Edit", match: :first
      fill_in "Date", with: Date.current + 2.day
      click_on "Update date"

      assert_selector "h1", text: @quote.name
      expect(page).to have_content I18n.l(Date.current + 2.day, format: :long)
      expect(page).to have_content "Date was successfully updated."
    end

    context "The form is invalid" do
      scenario 'User sees a useful error message while Creating a new quote' do
        click_on "New date"
        click_on "Create date"
        expect(page).to have_content "Date can't be blank"
      end

      scenario 'User sees a useful error message while Updating a new quote' do
        click_on "Edit", match: :first
        fill_in "Date", with: ""
        click_on "Update date"
        expect(page).to have_content "Date can't be blank"
      end
    end

    scenario 'Deleting an existing date' do
      click_on "Delete", match: :first

      assert_selector "h1", text: @quote.name
      expect(page).not_to have_content I18n.l(@date.date, format: :long)
      expect(page).to have_content "Date was successfully destroyed."
    end
  end
end
