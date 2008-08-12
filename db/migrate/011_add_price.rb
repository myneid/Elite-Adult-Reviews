class AddPrice < ActiveRecord::Migration
  def self.up
	add_column :sites, :trial_price, :string, :null => true
        add_column :sites, :full_price, :string, :null => true
  end

  def self.down
    remove_column :sites, :trial_price
    remove_column :sites, :full_price
  end
end
