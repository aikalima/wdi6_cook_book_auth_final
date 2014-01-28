class IngredientsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :new, :edit, :update]

  def index
    @ingredients = Ingredient.all
  end
  def new
    @ingredient = Ingredient.new
  end
  def create
    new_ingredient = params.require(:ingredient).permit(:name, :measurement, :cost, :image)
    @ingredient = Ingredient.create(new_ingredient)
    render :show
  end
  def show
    @ingredient = Ingredient.find(params[:id])
  end
  def edit
    @ingredient = Ingredient.find(params[:id])
  end
  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update_attributes(params[:ingredient])
    render :show
  end
  def destroy
    ingredient = Ingredient.find(params[:id])
    ingredient.delete
    redirect_to(ingredients_path)
  end
end
