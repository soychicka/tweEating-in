class PantryItem < ActiveRecord::Base
  belongs_to :food_item
  belongs_to :inventory
  belongs_to :unit
  
  def food_item_name= food_item_name
    self.food_item = FoodItem.find_by_name(food_item_name)
    self.food_item_id = self.food_item.id if self.food_item
  end

  def food_item_name
    self.food_item.name if self.food_item
  end
end