require 'yaml'

tool_path = File.join(File.dirname(__FILE__), 'tools.yml')
location_path = File.join(File.dirname(__FILE__), 'locations.yml')

tools = YAML.load_file(tool_path)
locations = YAML.load_file(location_path)
p tools

def exchange_setter(i_id)
  u_id = rand(1..30)
  if u_id == Item.find(i_id).user.id
    exchange_setter(i_id)
  else
    return u_id
  end
end

Exchange.destroy_all
Item.destroy_all
User.destroy_all

30.times do |i|
  r = User.new(
    username: Faker::Lorem.characters(9),
    password: Faker::Lorem.characters(7),
    email: Faker::Internet.email,
    location: locations["locations"][i]
  )
  r.save
  p r
  p r.valid?
  p r.password
end

j = 0

100.times do |j|
  i = Item.new(
    user_id: rand(1..30),
    token_value: rand(1..10000),
    name: tools["tools"][j],
    description: Faker::Lorem.paragraph,
    photo: "https://source.unsplash.com/525x375/?#{tools["tools"][j]}"
  )
  i.save
  p i
end

50.times do |i|
  start_date = Faker::Date.between(Date.today, 60.years.from_now)
  i_id = rand(1..100)
  u_id = exchange_setter(i_id)
  e = Exchange.new(
    user_id: u_id,
    item_id: i_id,
    start_date: start_date,
    end_date: start_date + 7.days
  )
  e.save
  p e
end
