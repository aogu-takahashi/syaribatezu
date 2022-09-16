FactoryBot.define do
  factory :mountain_location do
    association :mountain
    association :prefecture
  end
end
