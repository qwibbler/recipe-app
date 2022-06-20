u1 = User.create(name: 'John', email: 'john@example.com', password: 'password')

f1 = Food.create(name: 'Apple', measurement_unit: 'grams', price: 5, user: u1)
f2 = Food.create(name: 'Pineapple', measurement_unit: 'grams', price: 1, user: u1)
f3 = Food.create(name: 'Chicken breasts', measurement_unit: 'unit', price: 2, user: u1)

r1 = Recipe.create(name: 'Recipe 1', public: false, user: u1,
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua.')
r2 = Recipe.create(name: 'Recipe 2', public: true, user: u1,
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua.')

r2f1 = RecipeFood.create(recipe: r2, food: f1, quantity: 3)
r2f2 = RecipeFood.create(recipe: r2, food: f2, quantity: 3)