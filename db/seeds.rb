require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
html = open(url).read
cocktail_json = JSON.parse(html)
cocktail_json["drinks"].each do |drink|
  Ingredient.create(name: drink["strIngredient1"])
end
