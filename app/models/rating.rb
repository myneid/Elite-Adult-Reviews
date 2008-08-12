class Rating < ActiveRecord::Base
	belongs_to :category
	belongs_to :site
	validates_uniqueness_of :category_id, :scope => :site_id
end
