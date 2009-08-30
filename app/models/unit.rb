class Unit < ActiveRecord::Base
  has_many :pantry_items
  has_many :ingredients
end
