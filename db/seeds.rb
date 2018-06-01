require 'yaml'

tool_path = File.join(File.dirname(__FILE__), 'tools.yml')
location_path = File.join(File.dirname(__FILE__), 'locations.yml')
user_photos_path = File.join(File.dirname(__FILE__), 'user_photos.yml')

tools = YAML.load_file(tool_path)
locations = YAML.load_file(location_path)
user_photos = YAML.load_file(user_photos_path)
p tools


Exchange.destroy_all
Item.destroy_all
User.destroy_all

def exchange_setter(i_id)
  u_id = rand(1..15)
  if u_id == Item.find(i_id).user.id
    exchange_setter(i_id)
  else
    return u_id
  end
end


15.times do |i|
  r = User.new(
    username: Faker::Internet.user_name,
    password: Faker::Lorem.characters(7),
    email: Faker::Internet.email,
    location: locations["locations"][i],
    remote_photo_url: user_photos["photos"][i]
  )
  puts "5 second wait..."
  sleep(5)
  r.save
  p r
  p r.valid?
  p r.password
  puts
end

j = 1

16.times do |j|

  puts "tools[j]"
  p tools[j]
  i = Item.new(
    user_id: rand(1..15),
    token_value: rand(1..10000),
    name: tools[j]["name"][0],
    description: tools[j]["description"][0],
    remote_photo_url: tools[j]["photo"][0]
  )
  puts "i valid?"
  puts i.valid?
  puts i.errors.messages
  i.save
  puts i[:photo]
  p i
  puts
  puts
end

25.times do |i|
  start_date = Faker::Date.between(Date.today, 60.years.from_now)
  i_id = rand(1..16)
  u_id = exchange_setter(i_id)
  e = Exchange.new(
    user_id: u_id,
    item_id: i_id,
    start_date: start_date,
    end_date: start_date + 7.days
  )
  e.save
  p e
  p e.valid?

end
