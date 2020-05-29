class RecipesController < ApplicationController

  layout "application"


  def index
      @recipes = Recipe.all
  end

  def show

    @recipe = Recipe.find_by(id: params[:id])
    # @ingredients = @recipe.ingredients
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
    @recipe.ingredients.build
  end

  def create
      @recipe = Recipe.new(recipe_params)
      if @recipe.save
        redirect_to recipe_path(@recipe)
      else
        render :new
      end
  end



  def update

    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(recipe_params)
    if @recipe.valid?
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])
    recipe.delete
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, ingredients_attributes: [:name, :id])
  end


end
