require 'yaml'

tool_path = File.join(File.dirname(__FILE__), 'tools.yml')
location_path = File.join(File.dirname(__FILE__), 'locations.yml')

tools = YAML.load_file(tool_path)
locations = YAML.load_file(location_path)
p tools

Exchange.destroy_all
Item.destroy_all
User.destroy_all

def exchange_setter(i_id)
  u_id = rand(1..30)
  if u_id == Item.find(i_id).user.id
    exchange_setter(i_id)
  else
    return u_id
  end
end


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


# j = 0
#
# new_photos = [
#   "https://source.unsplash.com/Q0mDOn9gWk8/525x375",
#   "https://source.unsplash.com/PtgLGdMzi-Y/525x375",
#   "https://source.unsplash.com/mQgVyUC0V-I/525x375",
#   "https://source.unsplash.com/BL6XQLZeXpg/525x375",
#   "https://source.unsplash.com/y5QFgRV9Mxs/525x375",
#   "https://source.unsplash.com/pVHz7BNe1nA/525x375",
#   "https://source.unsplash.com/PGrp_5aJLC0/525x375",
#   "https://source.unsplash.com/U4CHIP7oMIs/525x375",
#   "https://source.unsplash.com/NpIZhur97aA/525x375",
#   "https://source.unsplash.com/tSXL01Rueis/525x375",
#   "https://source.unsplash.com/Geh-r9A4RBg/525x375",
#   "https://source.unsplash.com/M0WbGFRTXqU/525x375"
# ]

100.times do |j|
  i = Item.new(
    user_id: rand(1..30),
    token_value: rand(1..10000),
    name: tools["tools"][j],
    description: Faker::Lorem.paragraph,
    remote_photo_url: `https://source.unsplash.com/525x375/?#{tools["tools"][j]}`
  )
  i.save
  puts i[:photo]
  p i
  puts i.valid?
  puts i.errors.full_messages
end

  #updating to nice photos
#   if j < 12
#     i.photo = new_photos[j]
#   end
#
#   i.save
#   p i
# end


# new_photos.each_with_index do |photo, index|
#   i = Item.find(index + 1)
#   i.photo = photo
#   i.save
#   p i
# end


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
  p e.valid?

end
