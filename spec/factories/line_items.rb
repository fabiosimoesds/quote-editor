FactoryBot.define do
  factory :line_item do
    line_item_date
    sequence(:name) { |n| "Line Item #{n}" }
    description { "Test Description" }
    quantity { 10 }
    unit_price { 250 }
  end
end
