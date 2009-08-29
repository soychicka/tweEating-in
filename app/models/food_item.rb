class FoodItem < ActiveRecord::Base
  acts_as_nested_set
  has_many :pantry_items
  has_many :ingredients
end