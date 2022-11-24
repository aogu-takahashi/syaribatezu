FactoryBot.define do
  factory :course do
    name { "name" }
    days { 1 }
    walking_time { 4.8 }
    distance { 6.4 }
    denivele_plus { 0.64 }
    denivele_minus { 0.81 }
    association :mountain, factory: :mountain
    association :user, factory: :user
  end
end
