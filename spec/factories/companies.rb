FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "default #{n}"  }
  end
end

# kpmg:
#   name: KPMG

# pwc:
#   name: PwC
