class Recipe < ActiveRecord::Base
  belongs_to :user

  has_many :ingredients
  accepts_nested_attributes_for :ingredients, :allow_destroy => true,
    :reject_if => proc { |attributes| attributes['food_item_name'].blank? }

end
