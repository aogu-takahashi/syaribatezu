FactoryBot.define do
  factory :memo do
    sequence(:date) { |n| "202#{n}-01-01" }
    sequence(:temperature) { |n| "#{n}" }
    description { "MyText" }
    done { 0 }
    association :user
    association :course
  end
end
