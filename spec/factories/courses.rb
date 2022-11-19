FactoryBot.define do
  factory :course do
    name { "name" }
    days { 1 }
    walking_time { 0 }
    distance { 0 }
    denivele_plus { 0 }
    denivele_minus { 0 }
    association :mountain, factory: :mountain
    association :user, factory: :user
  end
end
