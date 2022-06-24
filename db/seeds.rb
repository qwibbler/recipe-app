u1 = User.create(id: 1, name: 'John', email: 'john@example.com', password: 'password')
u2 = User.create(id: 2, name: 'Jane', email: 'jane@example.com', password: 'password')

f1 = Food.create(id: 1, name: 'Apple', measurement_unit: 'grams', price: 5, user: u1)
f2 = Food.create(id: 2, name: 'Pineapple', measurement_unit: 'grams', price: 1, user: u1)
f3 = Food.create(id: 3, name: 'Chicken', measurement_unit: 'unit', price: 2, user: u2)
f4 = Food.create(id: 4, name: 'Sugar', measurement_unit: 'cups', price: 7, user: u2)

r1 = Recipe.create(id: 1, name: 'Recipe 1', public: false, user: u1, preparation_time: "01:00:00",
                   description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua.')
r2 = Recipe.create(id: 2, name: 'Recipe 2', public: true, user: u1, preparation_time: "01:00:00",
                   cooking_time: "02:00:00", description: 'Lorem ipsum dolor sit amet, consectetur
                   adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
r3 = Recipe.create(id: 3, name: 'Recipe 3', public: true, user: u1, cooking_time: "02:00:00",
                   description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua.')

RecipeFood.create(id: 1, recipe: r1, food: f3, quantity: 3)
RecipeFood.create(id: 2, recipe: r1, food: f4, quantity: 3)

RecipeFood.create(id: 3, recipe: r2, food: f1, quantity: 3)
RecipeFood.create(id: 4, recipe: r2, food: f2, quantity: 3)

RecipeFood.create(id: 5, recipe: r3, food: f1, quantity: 3)
RecipeFood.create(id: 6, recipe: r3, food: f2, quantity: 3)
RecipeFood.create(id: 7, recipe: r3, food: f3, quantity: 3)
