class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :category_id
      t.integer :site_id
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
