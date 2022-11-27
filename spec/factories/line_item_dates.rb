FactoryBot.define do
  factory :line_item_date do
    quote
    sequence(:date) { |n| Date.current + n }
  end
end
