class CreateScreenshots < ActiveRecord::Migration
  def self.up
    create_table :screenshots do |t|
      t.integer :site_id
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :screenshots
  end
end
