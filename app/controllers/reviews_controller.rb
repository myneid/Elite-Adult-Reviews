class ReviewsController < ApplicationController

	def show

		if params[:name].nil?
			redirect_to "/"
			return
		end	
                name = params[:name].gsub(/-/, " ")
		@site = Site.find_by_name(name)

		if ! @site
                        flash[:invalid] = 'Review Not Found'
			redirect_to "/"
			return
		end




	end

end
