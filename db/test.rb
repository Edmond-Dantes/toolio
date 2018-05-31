require 'yaml'

# tools = File.join(File.dirname(__FILE__, "/tools.yml"))

tool_path = File.join(File.dirname(__FILE__), 'tools.yml')

tools = YAML.load_file(tool_path)

p tools

# 5.times do |j|
#   puts tools["tools"][j]
# end

puts tools[2]["name"]
p tools[2]["name"]
puts tools[2]["name"][0]
# 5.times do |i|
#   puts tools[i.to_s]["name"]
#   puts tools[i.to_s]["description"]
#   puts tools[i.to_s]["photo"]
# end

# i = ""
#
# i = Item.new(
#   user_id: rand(1..30),
#   token_value: rand(1..10000),
#   name: "iron",
#   description: "test paragraph about an iron",
#   photo: "https://res.cloudinary.com/white-fox-communications-llc/image/upload/v1527729700/clothing-3208822_1920.jpg"
# )
# i.save
# p i
