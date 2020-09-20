source = 'en'
target = 'ma'
api = RapidApi::Base.new(source, target)

api.translate(query)