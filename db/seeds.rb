require 'json'
require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
url_read = open(url).read
ingredients = JSON.parse(url_read)
ingredients['drinks'].each do |ing| Ingredient.create(name: ing["strIngredient1"]) end

Cocktail.create(name: 'Gin and tonic')
Cocktail.create(name: 'Whisky sour')
