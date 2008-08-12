class SearchController < ApplicationController


	def search

		if params[:query].nil?
			flash[:invalid] = "No search term entered"
			redirect_to "/"
			return
		end


		@query = params[:query]

		@niche = Category.find(:first, :conditions => ["name like ?", "%#{@query}%"])

		if @niche
			redirect_to "/niche/#{@niche.name}"
			return
		end

		#ok so what we are searching is not a niche, so lets search the sites
		 @sites = Site.search(@query, :order => 'id desc',
					      :page => {:size => 10, :current => params[:page]})


	end

end
