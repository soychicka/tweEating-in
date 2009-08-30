class ShoppingList < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
  accepts_nested_attributes_for :recipe

  def list_items
    []
  end
end
