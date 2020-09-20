<h1>Language Translator</h1>

<p>
  Lang-translator allows to convert a single word or an array of words to the targeted language. Under the hood it uses the RapidAPI which uses the Google Translation API.
</p>

<h2>Configurations</h2>

```
mv config/application-copy.yml config/application.yml
```

<h2>How to use?</h2>

Fire up `rails console` in your terminal, mine is iTerm2.
```
source = "en"
target = "de"
api = RapidApi::Base.new(source, target)
query = ["January", "February", "March"]
api.translate(query)


=> ["Januar", "Februar", "März"]
```
If you get an error message while translation, thats mean RapidAPI free usage is up and we need to update the RapidAPI key within our ```application.yml``` file.