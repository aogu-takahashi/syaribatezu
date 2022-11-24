FactoryBot.define do
  factory :mountain do
    sequence(:name) { |n| "mountain#{n}" }

    after(:create) do |mountain|
      create_list(:course, 3, mountain: mountain)
      create_list(:mountain_location, 3, mountain: mountain, prefecture: create(:prefecture))
    end
  end
end