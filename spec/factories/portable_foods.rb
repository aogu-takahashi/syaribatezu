FactoryBot.define do
  factory :portable_food do
    association :memo
    association :ration
  end
end
