class RecipesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :new, :edit, :update]

  def index
    @recipes = Recipe.all
  end
  def new
    @recipe = Recipe.new
  end
  def create
    new_recipe = params.require(:recipe).permit(:name, :course, :cooktime, :servingsize, :instructions, :image, :book_id, :ingredient_ids)
    recipe = Recipe.create(new_recipe)
    redirect_to(recipe)
  end
  def show
    @recipe = Recipe.find(params[:id])
  end
  def edit
    @recipe = Recipe.find(params[:id])
  end
  def update
    recipe = Recipe.find(params[:id])
    recipe.update_attributes(params[:recipe])
    redirect_to(recipe)
  end
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.delete
    redirect_to(recipes_path)
  end
end
