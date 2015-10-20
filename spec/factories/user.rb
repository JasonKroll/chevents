require 'faker'
FactoryGirl.define do
  password =  Faker::Internet.password(10)

  factory :user do |user|
    user.email { Faker::Internet.email }
    user.name { Faker::Name.name }
    user.address1 { Faker::Address.street_address }
    user.address2 { Faker::Address.secondary_address }
    user.post_code { Faker::Address.postcode }
    user.suburb { Faker::Address.city }
    user.password { password }
    user.password_confirmation { password }
  end
end

