class Admin::RatingsController < AdminAreaController
  # GET /ratings
  # GET /ratings.xml
  def index
    @ratings = Rating.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ratings }
    end
  end

  # GET /ratings/1
  # GET /ratings/1.xml
  def show
    @rating = Rating.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rating }
    end
  end

  # GET /ratings/new
  # GET /ratings/new.xml
  def new
	if params[:site_id].nil?
	flash[:invalid] = "Must specify site."
	redirect_to "/admin/sites"
	return
	end

	@site = Site.find(params[:site_id].to_i)
    @rating = Rating.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rating }
    end
  end

  # GET /ratings/1/edit
  def edit
    @rating = Rating.find(params[:id])
  end

  # POST /ratings
  # POST /ratings.xml
  def create
    @rating = Rating.new(params[:rating])



    respond_to do |format|
      if @rating.save
        flash[:success] = 'Rating was successfully created.'
        format.html { redirect_to("/admin/sites/#{@rating.site_id}") }
        format.xml  { render :xml => @rating, :status => :created, :location => @rating }
      else
	@site = Site.find(params[:rating][:site_id].to_i)
        format.html { render :action => "new" }
        format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ratings/1
  # PUT /ratings/1.xml
  def update
    @rating = Rating.find(params[:id])

    respond_to do |format|
      if @rating.update_attributes(params[:rating])
        flash[:success] = 'Rating was successfully updated.'
        format.html { redirect_to("/admin/sites/#{@rating.site_id}") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.xml
  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to(ratings_url) }
      format.xml  { head :ok }
    end
  end
end
