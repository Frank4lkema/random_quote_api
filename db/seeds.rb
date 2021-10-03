QuoteRating.delete_all
Quote.delete_all


100.times do
  Quote.create(
    quote: Faker::Quote.famous_last_words,
    author: Faker::Name.name
  )
end



300.times do
  QuoteRating.create(
    quote_id: Quote.order("random()").limit(1).first.id,
    rating: rand(1..5)
  )
end
