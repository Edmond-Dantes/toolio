

Exchange.destroy_all
Item.destroy_all
User.destroy_all

30.times do
  r = User.new(
    username: Faker::Lorem.characters(9),
    password: Faker::Lorem.characters(7),
    email: Faker::Internet.email,
    # phone_number: Faker::PhoneNumber.phone_number,
  )
  r.save
  p r
  p r.valid?
  p r.password
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
  start_date = Faker::Date.between(60.years.ago, Date.today)
  e = Exchange.new(
    user_id: rand(1..30),
    item_id: rand(1..100),
    start_date: start_date,
    end_date: start_date + 7.days
  )
  e.save
  p e
end
