class AddSiteidAndName < ActiveRecord::Migration
  def self.up
    add_column :sub_ratings, :site_id, :integer, :null => true
	add_column :sites, :name, :string, :null => true
  end

  def self.down
    remove_column :sub_ratings, :site_id
    remove_column :sites, :name
  end
end
