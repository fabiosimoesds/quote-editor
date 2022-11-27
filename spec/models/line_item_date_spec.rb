require 'rails_helper'

RSpec.describe LineItemDate, type: :model do
  it "Should return the date before the date of the new instance" do
    quote = create(:quote)
    older_line_item_date = create(:line_item_date, quote:)
    middle_line_item_date = create(:line_item_date, quote:)
    newer_line_item_date = create(:line_item_date, quote:)

    result = newer_line_item_date.previous_date

    expect(result).to eq(middle_line_item_date)
  end
end
