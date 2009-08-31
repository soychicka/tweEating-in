class CreateShoppingLists < ActiveRecord::Migration
  def self.up
    create_table :shopping_lists do |t|
      t.string     :user_id
      t.string     :recipe_id
      t.timestamps
    end
  end

  def self.down
    drop_table :shopping_lists
  end
end
