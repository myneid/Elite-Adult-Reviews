class NicheController < ApplicationController


  def niche

    if params[:niche].nil?
      flash[:invalid] = "No niche entered"
      redirect_to "/"
      return
    end

#    @niche = Category.find(:first, :conditions => ["name = ?", params[:niche]])
    @niche = Category.where(:name => params[:niche]).first

    if !@niche 
      flash[:invalid] = "Niche not found"
      redirect_to "/"
      return
    end

=begin
    @sites = Site.find(:all,
                       :joins => "sites, ratings",
                       :conditions => ["sites.id = ratings.site_id and ratings.rating > 0 and ratings.category_id = ?", @niche.id],
                       :order => "ratings.rating desc",
                       :page => {:size => 10, :current => params[:page]})
=end

    @sites = Site.joins("sites, ratings")
    @sites.where(["sites.id = ratings.site_id and ratings.rating > 0 and ratings.category_id = ?", @niche.id])
    @sites = @sites.order("ratings.rating desc").paginate(:per_page => 10, :page => params[:page])

  end

end
