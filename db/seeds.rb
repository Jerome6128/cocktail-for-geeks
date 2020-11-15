# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'

puts 'Cleaning database...'
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Ingredients seeding'
puts 'Creating ingredients...'

Ingredient.create(name: "Ice")
Ingredient.create(name: "Mint leaves")
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)['drinks']
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

puts 'Cocktails seeding'
puts 'Creating cocktails...'
100.times do
  cocktail = Cocktail.create(name: Faker::ProgrammingLanguage.unique.name)
  file = URI.open('https://source.unsplash.com/500x400/?cocktail')
  filename = cocktail.name
  cocktail.photo.attach(io: file, filename: "#{filename}", content_type: 'image/jpg')
end

puts 'Reviews seeding'
puts 'Creating reviews...'
cocktails = Cocktail.all
cocktails.each do |cocktail|
  5.times do
    rating = rand(1..5)
    review = Review.new(rating: rating, content: Faker::Coffee.unique.notes)
    review.cocktail = cocktail
    review.save
  end
end

puts 'Doses seeding'
puts 'Creating doses..."-'
cocktails = Cocktail.all
ingredients = Ingredient.all
cocktails.each do |cocktail|
  5.times do
    description = rand(1..5)
    dose = Dose.new(description: description)
    dose.cocktail = cocktail
    ingredient = ingredients[rand(1..ingredients.length)]
    dose.ingredient = ingredient
    dose.save
  end
end

puts 'Finished!'
