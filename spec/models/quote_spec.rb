require 'rails_helper'

RSpec.describe Quote, type: :model do
  it "Should return the total value of all line items" do
    company = Company.create(name: 'Company test')
    quote = Quote.create(name: 'Quote 1', company: company)
    line_item_date = LineItemDate.create( date: Date.current, quote_id: quote.id)
    line_item_one = LineItem.create(name: 'line item one', quantity: 10, unit_price: 250, line_item_date: line_item_date)
    line_item_two = LineItem.create(name: 'line item two', quantity: 8, unit_price: 130, line_item_date: line_item_date)
    result = quote.total_price
    expect(result).to eq(3540)
  end
end
