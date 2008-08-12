class Screenshot < ActiveRecord::Base
  belongs_to :site
#  validates_presence_of :site_id, :location
  has_attachment :content_type => :image,
    :storage => :file_system,
    :max_size => 1.megabyte,
    :resize_to => '500x500>',
    :thumbnails => {:thumbsmall => '95x120', :thumbmed => '120x200', :thumblatest => '150x160', :thumbreg => '200x200', :thumblarge => '300x300'},
    :processor => 'MiniMagick'
  validates_as_attachment
end
