class CreateFoodItems < ActiveRecord::Migration
  def self.up
    create_table :food_items do |t|
      t.string :name
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
    end
  end

  def self.down
    drop_table :food_items
  end
end
