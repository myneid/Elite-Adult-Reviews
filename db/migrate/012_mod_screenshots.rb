class ModScreenshots < ActiveRecord::Migration
  def self.up
     add_column :screenshots, :parent_id,  :integer
     add_column :screenshots,  :content_type, :string
     add_column :screenshots,  :filename, :string    
     add_column :screenshots,  :thumbnail, :string 
     add_column :screenshots,  :size, :integer
     add_column :screenshots,  :width, :integer
     add_column :screenshots,  :height, :integer
  end

  def self.down
     remove_column :screenshots, :parent_id
     remove_column :screenshots,  :content_type
     remove_column :screenshots,  :filename
     remove_column :screenshots,  :thumbnail
     remove_column :screenshots,  :size
     remove_column :screenshots,  :width
     remove_column :screenshots,  :height
  end
end
