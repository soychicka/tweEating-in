class Inventory < ActiveRecord::Base
  belongs_to :user
  
  has_many :pantry_items
  accepts_nested_attributes_for :pantry_items, :allow_destroy => true,
    :reject_if => proc { |attributes| attributes['food_item_name'].blank? }
end
