require 'rails_helper'

RSpec.describe LineItemDate, type: :model do
  it "Should return the date before the date of the new instance" do
    company = Company.create(name: 'Company test')
    quote = Quote.create(name: 'Quote 1', company: company)
    older_line_item_date = LineItemDate.create(date: Date.current - 5, quote_id: quote.id)
    middle_line_item_date = LineItemDate.create(date: Date.current - 3, quote_id: quote.id)
    newer_line_item_date = LineItemDate.create(date: Date.current, quote_id: quote.id)

    result = newer_line_item_date.previous_date

    expect(result).to eq(middle_line_item_date)
  end
end
