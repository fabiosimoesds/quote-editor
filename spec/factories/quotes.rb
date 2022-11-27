FactoryBot.define do
  factory :quote do
    sequence(:name) { |n| "Quote #{n}" }
    company
  end
end
