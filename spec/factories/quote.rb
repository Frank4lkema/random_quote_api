FactoryBot.define do
  factory :quote do
    quote { Faker::Quote.famous_last_words }
    author { Faker::Name.name }
  end
end
