require 'open-uri'
require 'json'

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
html = open(url).read
cocktail_json = JSON.parse(html)
cocktail_json["drinks"].each do |drink|
  Ingredient.create(name: drink["strIngredient1"])
end
