class AddUserActivated < ActiveRecord::Migration
  def self.up
    add_column :users, :activated, :integer, :default => 0, :null => false

    puts "activating already registered users..."
    User.update_all("activated=1")
    puts "done."
  end

  def self.down
    remove_column :users, :activated
  end
end
