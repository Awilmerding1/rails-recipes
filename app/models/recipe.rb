class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :user

  accepts_nested_attributes_for :ingredients

  validates_presence_of :name
  # def initialize(name)
  #     self.name= name
  # end


end

# Recipe.new("Cookies")
#
# recipe = Recipe.new
#
# recipe.initialize("Cookies")
#
# recipe.name="Cookies"



# Recipe.instance_methods.select{|m| m.to_s.include?("ingredient")}

# autosave_associated_records_for_ingredients
# validate_associated_records_for_ingredients
# before_add_for_ingredients
# before_add_for_ingredients?
# before_add_for_ingredients=
# after_add_for_ingredients
# after_add_for_ingredients?
# after_add_for_ingredients=
# before_remove_for_ingredients
# before_remove_for_ingredients?
# before_remove_for_ingredients=
# after_remove_for_ingredients
# after_remove_for_ingredients?
# after_remove_for_ingredients=
# ingredients
# ingredient_ids
# ingredients=
# ingredient_ids=


# Ingredient.instance_methods.select{|m| m.to_s.include?("recipe")}

# autosave_associated_records_for_recipe
# create_recipe
# reload_recipe
# create_recipe!
# recipe=
# recipe
# build_recipe
