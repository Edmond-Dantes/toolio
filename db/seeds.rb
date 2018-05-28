CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]

30.times do
  r = User.new(
    username: Faker::Hacker.adjective,
    password: Faker::String.random(3..12),
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
  )
  r.save
  p r
end

100.times do
  i = Item.new(
    user_id: rand(1..30),
    token_value: rand(1..10000),
    name: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    photo: "https://source.unsplash.com/random"
  )
  i.save
  p i
end

50.times do
  e = Exchange.new(
    user_id: rand(1..30),
    item_id: rand(1..100),
    start_date: Faker::Date.between(6.days.ago, Date.today),
    end_date: start_date + 7.days
  )
  e.save
  p e
end
