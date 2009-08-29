class Ingredient < ActiveRecord::Base
  belongs_to :food_item
  belongs_to :recipe
end