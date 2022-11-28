require "rails_helper"

RSpec.describe "line_item_date/_date_form.html.erb" do
  context "Check if the Partial is render" do
    it "Should render the partial with the form" do
      quote = create(:quote)
      line_item_date = create(:line_item_date, quote: quote)

      render partial: "line_item_dates/date_form", locals: { quote:, line_item_date: }

      expect(rendered).to have_selector "input[type=submit]"
    end
  end
end
