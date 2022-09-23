FactoryBot.define do
  factory :user do
    name { "name" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    age { 20 }
    sex { "man" }
    height { 170 } 
    weight { 65 }
  end
end
