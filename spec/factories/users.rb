FactoryBot.define do
  factory :user do
    email { 'default@kpmg.com' }
    password { 'password' }

    trait :accountant do
      email { 'accountant1@kpmg.com' }
      password { 'password' }
      kpmg_company factory: :company
    end

    trait :manager do
      email { 'manager@kpgm.com' }
      password { 'password' }
      company { Company.first }
    end

    factory :accountant_user, traits: [:accountant]
  end
end


# accountant:
#   company: kpmg
#   email: accountant@kpmg.com
#   encrypted_password: <%= Devise::Encryptor.digest(User, 'password') %>

# manager:
#   company: kpmg
#   email: manager@kpmg.com
#   encrypted_password: <%= Devise::Encryptor.digest(User, 'password') %>

# eavesdropper:
#   company: pwc
#   email: eavesdropper@pwc.com
#   encrypted_password: <%= Devise::Encryptor.digest(User, 'password') %>
