FactoryBot.define do
  factory :prefecture do
    sequence(:name) { |n| "prefecture#{n}" }
  end
end
