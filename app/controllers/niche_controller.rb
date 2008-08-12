class NicheController < ApplicationController


  def niche

    if params[:niche].nil?
      flash[:invalid] = "No niche entered"
      redirect_to "/"
      return
    end

    @niche = Category.find(:first, :conditions => ["name = ?", params[:niche]])

    if !@niche 
      flash[:invalid] = "Niche not found"
      redirect_to "/"
      return
    end

    @sites = Site.find(:all,
                       :joins => "sites, ratings",
                       :conditions => ["sites.id = ratings.site_id and ratings.rating > 0 and ratings.category_id = ?", @niche.id],
                       :order => "ratings.rating desc",
                       :page => {:size => 10, :current => params[:page]})


  end

end
