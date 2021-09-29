FactoryBot.define do
  factory :quote_rating do

    trait :with_random_rating do
      rating { rand(1..5) }
    end
  end
end