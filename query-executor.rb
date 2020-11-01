source = 'en'
targets = %w[ar bn cs da de es est fa fi fr hi hr hu it jp ko ma ml nl no pa pl ru sv tr uk ur vi zh]
query = 'Status'
translated_data = {}

targets.each do |target|
  api = RapidApi::Base.new(source, target)
  translated_data[target] = api.translate(query)
end

puts translated_data