class SubRatingsController < ApplicationController
  # GET /sub_ratings
  # GET /sub_ratings.xml
  def index
    @sub_ratings = SubRating.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sub_ratings }
    end
  end

  # GET /sub_ratings/1
  # GET /sub_ratings/1.xml
  def show
    @sub_rating = SubRating.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sub_rating }
    end
  end

  # GET /sub_ratings/new
  # GET /sub_ratings/new.xml
  def new
    @sub_rating = SubRating.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sub_rating }
    end
  end

  # GET /sub_ratings/1/edit
  def edit
    @sub_rating = SubRating.find(params[:id])
  end

  # POST /sub_ratings
  # POST /sub_ratings.xml
  def create
    @sub_rating = SubRating.new(params[:sub_rating])

    respond_to do |format|
      if @sub_rating.save
        flash[:notice] = 'SubRating was successfully created.'
        format.html { redirect_to(@sub_rating) }
        format.xml  { render :xml => @sub_rating, :status => :created, :location => @sub_rating }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sub_rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sub_ratings/1
  # PUT /sub_ratings/1.xml
  def update
    @sub_rating = SubRating.find(params[:id])

    respond_to do |format|
      if @sub_rating.update_attributes(params[:sub_rating])
        flash[:notice] = 'SubRating was successfully updated.'
        format.html { redirect_to(@sub_rating) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sub_rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_ratings/1
  # DELETE /sub_ratings/1.xml
  def destroy
    @sub_rating = SubRating.find(params[:id])
    @sub_rating.destroy

    respond_to do |format|
      format.html { redirect_to(sub_ratings_url) }
      format.xml  { head :ok }
    end
  end
end
