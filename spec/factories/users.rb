FactoryBot.define do
  factory :user do
    name { "name" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    age { 32 }
    sex { "man" }
    height { 175 } 
    weight { 75 }
    rucksack_weight { 10 }
  end
end
