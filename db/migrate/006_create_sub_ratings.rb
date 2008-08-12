class CreateSubRatings < ActiveRecord::Migration
  def self.up
    create_table :sub_ratings do |t|
      t.integer :exclusivity
      t.integer :updates
      t.integer :originality
      t.integer :quality
      t.integer :speed
      t.integer :quantity
      t.integer :design
      t.integer :navigation_ease
      t.integer :features
      t.integer :price

      t.timestamps
    end
  end

  def self.down
    drop_table :sub_ratings
  end
end
