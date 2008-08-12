# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 12) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", :force => true do |t|
    t.integer  "site_id"
    t.string   "description"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "category_id"
    t.integer  "site_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "screenshots", :force => true do |t|
    t.integer  "site_id"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :default => "", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sites", :force => true do |t|
    t.text    "short_review"
    t.text    "content"
    t.text    "features_and_navigation"
    t.text    "conclusion"
    t.text    "pros_and_cons"
    t.string  "display_url"
    t.string  "track_url"
    t.string  "screenshot_location"
    t.date    "created_at"
    t.date    "updated_at"
    t.string  "name"
    t.integer "overall",                 :limit => 4
    t.string  "trial_price"
    t.string  "full_price"
  end

  add_index "sites", ["overall"], :name => "overall"

  create_table "sub_ratings", :force => true do |t|
    t.integer  "exclusivity"
    t.integer  "updates"
    t.integer  "originality"
    t.integer  "quality"
    t.integer  "speed"
    t.integer  "quantity"
    t.integer  "design"
    t.integer  "navigation_ease"
    t.integer  "features"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "role",                   :limit => 50, :default => "", :null => false
    t.string   "name",                   :limit => 20, :default => "", :null => false
    t.string   "email",                  :limit => 60, :default => "", :null => false
    t.string   "firstname",              :limit => 30
    t.string   "surname",                :limit => 30
    t.string   "password",               :limit => 60, :default => "", :null => false
    t.string   "security_token",         :limit => 32
    t.text     "additional_information"
    t.datetime "token_expiry"
    t.integer  "receives_email",                       :default => 0,  :null => false
    t.integer  "sends_email",                          :default => 0,  :null => false
    t.integer  "activated",                            :default => 0,  :null => false
  end

  add_index "users", ["name"], :name => "users_1uq", :unique => true
  add_index "users", ["role"], :name => "users_1ix"

end
