class ShoppingList < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
  accepts_nested_attributes_for :recipe

  def list_items
    recipe.ingredients.collect(&:food_item) -
      (user.inventory.pantry_items.collect(&:food_item) || [])
  end
end
