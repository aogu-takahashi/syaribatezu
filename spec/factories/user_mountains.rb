FactoryBot.define do
  factory :user_mountain do
    association :user
    association :mountain
  end
end
