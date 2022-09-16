FactoryBot.define do
  factory :memo do
    sequence(:date) { |n| "#{n}" }
    sequence(:temperature) { |n| "#{n}" }
    description { "MyText" }
    done { 0 }
    association :user
    association :course
  end
end
