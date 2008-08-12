module ApplicationHelper

    def js_extract_messages_from_flash
          if (flash.length > 0)
                  result = "<script type='text/javascript'>
                                    Messages.extractMessages( #{flash.to_json} );
                                  </script>"

                        flash.discard
                              result
                                  end
            end


    def list_categories
      @categories = Category.find(:all, :order => "name asc")
    end

	def list_sites
		@sites = Site.find(:all)
end

end
