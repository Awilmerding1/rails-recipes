class IngredientsController < ApplicationController

  def index
    if !params[:recipe_id]
      @ingredients = Ingredient.all
    else
      # we should check for existence of recipe first
      recipe = Recipe.find_by(id: params[:recipe_id])
      @ingredients = recipe.ingredients
    end
      # redirect_to edit_recipe_ingredients_path(1, 1)
  end

  def show
    # check to make sure that the ingredient is associated with the recipe
    # this means checking for the existence of both the ingredient AND the recipe, and checking that they are associated
      @ingredient = Ingredient.find_by(id: params[:id])

  end

  def edit
      if params[:recipe_id]
        @recipe = Recipe.find_by(id: params[:recipe_id])
        @ingredient = @recipe.ingredients.find_by(id: params[:id])
      else
        @ingredient = Ingredient.find_by(id: params[:id])
      end
  end

  def new
    if params[:recipe_id]
      @ingredient = Ingredient.new
      @recipe = Recipe.find_by(id: params[:recipe_id])
      @ingredient.recipes << @recipe

    else
        @ingredient = Ingredient.new
    end
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    if @ingredient.valid?
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def update

    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.update(ingredient_params)
    if @ingredient.valid?
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, recipe_ids: [])
  end


end
