class Site < ActiveRecord::Base
	has_many :ratings
	has_one :sub_rating
        has_many :screenshots

	validates_presence_of :name, :track_url, :display_url
	validates_uniqueness_of :name, :track_url

	searches_on :all


        def link
          l = self.name
          l = l.gsub(/ /, "-")
          "/#{l}"
        end

        def main_screenshot(sizer)
          s = screenshots.find(:first, :conditions => "location = 'main'")
          if s
            s.public_filename(sizer)
          else
            "/images/coming_soon.jpg"
          end
        end
        def memberone_screenshot(sizer)
          s = screenshots.find(:first, :conditions => "location = 'memberone'")
          if s
            s.public_filename(sizer)
          else
            "/images/coming_soon.jpg"
          end
        end
        def membertwo_screenshot(sizer)
          s = screenshots.find(:first, :conditions => "location = 'membertwo'")
          if s
            s.public_filename(sizer)
          else
            "/images/coming_soon.jpg"
          end
        end
        def memberthree_screenshot(sizer)
          s = screenshots.find(:first, :conditions => "location = 'memberthree'")
          if s
            s.public_filename(sizer)
          else
            "/images/coming_soon.jpg"
          end
        end
        def memberfour_screenshot(sizer)
          s = screenshots.find(:first, :conditions => "location = 'memberfour'")
          if s
            s.public_filename(sizer)
          else
            "/images/coming_soon.jpg"
          end
        end


        def read_more_link
          "/niche/#{self.ratings.find(:first, :order => "rating desc").category.name}"
        end

end
