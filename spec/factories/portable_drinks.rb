FactoryBot.define do
  factory :portable_drink do
    association :memo
    association :drink
  end
end
