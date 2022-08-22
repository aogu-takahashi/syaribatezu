FactoryBot.define do
  factory :user do
    first_name { "Aaron" }
    last_name  { "Sumner" }
    email { "aaron@example.com" }
    password { "aaron" }
  end
end
