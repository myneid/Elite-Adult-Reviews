class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column "created_at", :datetime, :null => false
      t.column "updated_at", :datetime, :null => false
      t.column "role", :string, :limit => 50, :null => false
      t.column "name", :string, :limit => 20, :null => false
      t.column "email", :string, :limit => 60, :null => false
      t.column "firstname", :string, :limit => 30
      t.column "surname", :string, :limit => 30
      t.column "password", :string, :limit => 60, :null => false
      t.column "security_token", :string, :limit => 32
      t.column "additional_information", :text
      t.column "token_expiry", :datetime
      t.column "receives_email", :integer, :default => 0, :null => false
      t.column "sends_email", :integer, :default => 0, :null => false
    end

    add_index "users", ["role"], :name => "users_1ix"
    add_index "users", ["name"], :name => "users_1uq", :unique => true
  end

  def self.down
    drop_table :users
  end
end
