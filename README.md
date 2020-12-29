# Language Translator
Lang-translator allows to convert a single word or an array of words to the targeted language(s). Under the hood it uses the RapidAPI which uses the Google Translation API.

## Configurations
```
mv config/application-copy.yml config/application.yml
```
## How to get RapidAPI key?
- Create an account at [RapidAPI](https://rapidapi.com/googlecloud/api/google-translate1/endpoints)
- Click on `subscribe to Test`
- Select Plan (may be free ATM)
- Now copy `x-rapidapi-key` value from the code snipper and place it in the `application.yml` file
## How to use?
Fire up `rails console` in your terminal
```
source = "en"
target = "de"
api = RapidApi::Base.new(source, target)
query = "What is your name?" #String query format
query = ["January", "February", "March"] #Array query format
api.translate(query)
  => ["Januar", "Februar", "März"]
```

By default language source will be 'en' and target will be the languages mentioined below
```
['ar', 'bn', 'ca', 'cs', 'da', 'de', 'es', 'est', 'fa', 'fi', 'fr', 'hi', 'hr', 'hu', 'it', 'jp', 'ko', 'ma', 'ml', 'nl', 'no', 'pa', 'pl', 'pt', 'ru', 'sv', 'te', 'tr', 'uk', 'ur', 'vi', 'zh']
```
if you need the transalation for all the languages which are in the default target then you need to call
```
api = RapidApi::Base.new
api.translate_multiple_languages(query)
```
else if you want to translate more than one language but not all default targeted language then do something like
```
source = 'en'
target = ['ar', 'bn']
api = RapidApi::Base.new(source, target)
api.translate_multiple_languages(query)
```
If you get an error message or empty values against keys which are required to be translated, thats mean RapidAPI free usage (if free plan selected) is up and we need to update the RapidAPI key within our `application.yml` file.