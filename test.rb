cocktail = Cocktail.create(name: "GTV")
ingredient = Ingredient.create(name: 'Ice')
dose = Dose.create(description: "1", cocktail_id: 5,ingredient_id: 1)
dose.cocktail = cocktail
dose.ingredient = ingredient
dose.save
cocktail
ingredient
dose
