class PantryItem < ActiveRecord::Base
  belongs_to :food_item
  belongs_to :inventory
  belongs_to :unit
end