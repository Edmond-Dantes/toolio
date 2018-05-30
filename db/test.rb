require 'yaml'

# tools = File.join(File.dirname(__FILE__, "/tools.yml"))

tool_path = File.join(File.dirname(__FILE__), 'tools.yml')

tools = YAML.load_file(tool_path)

p tools
puts tools["tools"][0]

5.times do |j|
  puts tools["tools"][j]
end
