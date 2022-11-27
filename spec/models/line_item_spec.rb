require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it 'Should return the result of quantity * unit price' do
    line_item = create(:line_item, quantity: 10, unit_price: 25)
    result = line_item.total_price
    expect(result).to eq(250)
  end
end
