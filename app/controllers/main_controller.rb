class MainController < ApplicationController

  def index
    #get the last review created
    @today = Site.find(:first, :order => "id desc")

    #get up to 8 of the ones that are not the very last one
    if @today
      @latest = Site.find(:all, :order => "id desc", :conditions => ["id != ?", @today.id], :limit => 8)
    end

    #get top reviews
    @top = Site.find(:all, :order => "overall desc", :limit => "5")
  end

  def sdump
    render :text => session.inspect
  end

end
