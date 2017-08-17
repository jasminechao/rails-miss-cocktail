# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts 'Cleaning the pantry'
Ingredient.destroy_all

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
body = open(url).read

JSON.parse(body)['drinks'].each do |something|
  Ingredient.create(name: something['strIngredient1'])
end

puts "All ingredients have been stocked up!"

cocktails = [
  {
    name:         "Mint Julep"
  },
  {
    name:         "Whiskey Sour"
  },
  {
    name:         "Mojito"
  }
]
Cocktail.create!(cocktails)
puts 'Bar open for business!'
