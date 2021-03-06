u1 = User.create(name: 'John', email: 'john@example.com', password: 'password')
u2 = User.create(name: 'Jane', email: 'jane@example.com', password: 'password')

f1 = Food.create(name: 'Apple', measurement_unit: 'grams', price: 5, user: u1)
f2 = Food.create(name: 'Pineapple', measurement_unit: 'grams', price: 1, user: u1)
f3 = Food.create(name: 'Chicken', measurement_unit: 'unit', price: 2, user: u2)
f4 = Food.create(name: 'Sugar', measurement_unit: 'cups', price: 7, user: u2)

r1 = Recipe.create(name: 'Recipe 1', public: false, user: u1, preparation_time: "01:00:00",
                   description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua.')
r2 = Recipe.create(name: 'Recipe 2', public: true, user: u1, preparation_time: "01:00:00",
                   cooking_time: "02:00:00", description: 'Lorem ipsum dolor sit amet, consectetur
                   adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
r3 = Recipe.create(name: 'Recipe 3', public: true, user: u1, cooking_time: "02:00:00",
                   description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua.')

RecipeFood.create(recipe: r1, food: f3, quantity: 3)
RecipeFood.create(recipe: r1, food: f4, quantity: 3)

RecipeFood.create(recipe: r2, food: f1, quantity: 3)
RecipeFood.create(recipe: r2, food: f2, quantity: 3)

RecipeFood.create(recipe: r3, food: f1, quantity: 3)
RecipeFood.create(recipe: r3, food: f2, quantity: 3)
RecipeFood.create(recipe: r3, food: f3, quantity: 3)
