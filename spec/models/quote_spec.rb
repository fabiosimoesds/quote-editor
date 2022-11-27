require 'rails_helper'

RSpec.describe Quote, type: :model do
  it "Should return the total value of all line items" do
    line_item_date = create(:line_item_date)
    create(:line_item, quantity: 10, unit_price: 250, line_item_date: line_item_date)
    create(:line_item, quantity: 8, unit_price: 130, line_item_date: line_item_date)
    result = line_item_date.quote.total_price
    expect(result).to eq(3540)
  end
end
