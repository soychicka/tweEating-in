class AddFoodItemTimestamps < ActiveRecord::Migration
  def self.up
    change_table :food_items do |t|
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end

  def self.down
    change_table :food_items do |t|
      t.remove :created_at
      t.remove :updated_at
    end
  end
end
