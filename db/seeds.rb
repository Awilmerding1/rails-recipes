# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1 = User.create(username: "Annabel", password: "password")
u2 = User.create(username: "Billy", password: "password")

r = Recipe.create(user: u1, name: 'Apple Pie', description: 'Delicious apple pie with buttery crust', instructions: 'Preheat oven to 350 degrees. Mix ingredients and fill in pie crust', prep_time: 20, cook_time: 45)

Recipe.create(user: u1, name: 'Chocolate Chip Cookies', description: 'Gooey, chocolatey cookies', instructions: 'Preheat oven to 400 degrees. Mix all ingredients in bowl. Roll dough into balls and put on cookie sheet', prep_time: 15, cook_time: 15)

Recipe.create(user: u2, name: 'Mac and Cheese', description: 'Very cheesey with crispy topping', instructions: 'Preheat oven to 350 degrees. Cook pasta with cheeses. Mix topping ingredients. Put pasta then in pan then add topping', prep_time: 30, cook_time: 40)

i = Ingredient.create(name: "Apples")
i2 = Ingredient.create(name: "Butter")

i.recipes << r
i2.recipes << r
