FactoryBot.define do
  factory :company do
    name { 'default' }

    factory :kpmg_company do
      name { 'KPMG' }
    end

    trait :pwc do
      name { 'PwC' }
    end

    # factory :kpmg_company, traits: [:kpmg]
  end
end

# kpmg:
#   name: KPMG

# pwc:
#   name: PwC
