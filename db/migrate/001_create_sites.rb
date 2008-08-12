class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.text :short_review
      t.text :content
      t.text :features_and_navigation
      t.text :conclusion
      t.text :pros_and_cons
      t.string :display_url
      t.string :track_url
      t.string :screenshot_location
      t.date :created_at
      t.date :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :sites
  end
end
