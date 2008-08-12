class Admin::SitesController < AdminAreaController
  # GET /sites
  # GET /sites.xml
  def index
    @sites = Site.find(:all, :limit => 10, :order => "id desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sites }
    end
  end


  def home
  end

  # GET /sites/1
  # GET /sites/1.xml
  def show
    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.xml
  def new
    @site = Site.new
    @site.sub_rating = SubRating.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # POST /sites
  # POST /sites.xml
  def create
    @site = Site.new(params[:site])

    respond_to do |format|
      if @site.save
	#update ratings
	params[:rating].each do |cid,v|
		@rating = Rating.new
		@rating.site_id = @site.id
		@rating.category_id = cid
		@rating.rating = v
		@rating.save
	end

	#update subratings
	@subrating = SubRating.new(params[:sub_rating])
	@subrating.site_id = @site.id
	@subrating.save


        #update overall score
        overall = 0
        params[:sub_rating].each do |sr,h|
              overall = overall + h.to_i
        end
        overall = overall/10
        @site.overall = overall
        @site.save

        self.process_images(@site.id)


        if params[:images]
          if params[:images][:main]
            @screenshot = Screenshot.new(params[:images][:main])
            @screenshot.site_id = @site.id
            @screenshot.location = 'main'
            @screenshot.save
          end
        end
        flash[:success] = 'Site was successfully created.'
        format.html { redirect_to(@site) }
        format.xml  { render :xml => @site, :status => :created, :location => @site }
      else
	@site.sub_rating = SubRating.new(params[:sub_rating])
        format.html { render :action => "new" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.xml
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])

	#update ratings
	Rating.delete_all "site_id = #{@site.id}"

	params[:rating].each do |cid,v|
		@rating = Rating.new
		@rating.site_id = @site.id
		@rating.category_id = cid
		@rating.rating = v
		@rating.save
	end


	#update subratings

	@subrating = SubRating.find(:first, :conditions => ["site_id = ?", @site.id])
	if @subrating
		@subrating.update_attributes(params[:sub_rating])
	else
		@subrating = SubRating.new(params[:sub_rating])
		@subrating.site_id = @site.id
		@subrating.save
	end

        #update overall score
        overall = 0
        params[:sub_rating].each do |sr,h|
              overall = overall + h.to_i
        end
        overall = overall/10
        @site.overall = overall
        @site.save

        self.process_images(@site.id)

        flash[:success] = 'Site was successfully updated.'
        format.html { redirect_to(@site) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end


  def process_images(site_id)

        if params[:images]
          if params[:images][:main]
            @screenshot = Screenshot.new(params[:images][:main])
            @screenshot.site_id = site_id
            @screenshot.location = 'main'
            @xme = Screenshot.find(:first, :conditions => ["site_id = ? and location = 'main'", site_id])
            if @screenshot.save 
              #delete the one we are replacing
              if @xme
                Screenshot.delete_all "parent_id = #{@xme.id} OR (site_id = #{@site.id} and location = 'main' and id != #{@screenshot.id})"
              else
                Screenshot.delete_all "site_id = #{site_id} AND location = 'main' AND id != #{@screenshot.id}"
              end
            end
          end
          if params[:images][:memberone]
            @screenshot = Screenshot.new(params[:images][:memberone])
            @screenshot.site_id = site_id
            @screenshot.location = 'memberone'
            @xme = Screenshot.find(:first, :conditions => ["site_id = ? and location = 'memberone'", site_id])
            if @screenshot.save 
              #delete the one we are replacing
              if @xme
                Screenshot.delete_all "parent_id = #{@xme.id} OR (site_id = #{@site.id} and location = 'memberone' and id != #{@screenshot.id})"
              else
                Screenshot.delete_all "site_id = #{site_id} AND location = 'memberone' AND id != #{@screenshot.id}"
              end
            end
          end
          if params[:images][:membertwo]
            @screenshot = Screenshot.new(params[:images][:membertwo])
            @screenshot.site_id = site_id
            @screenshot.location = 'membertwo'
            @xme = Screenshot.find(:first, :conditions => ["site_id = ? and location = 'membertwo'", site_id])
            if @screenshot.save 
              #delete the one we are replacing
              if @xme
                Screenshot.delete_all "parent_id = #{@xme.id} OR (site_id = #{@site.id} and location = 'membertwo' and id != #{@screenshot.id})"
              else
                Screenshot.delete_all "site_id = #{site_id} AND location = 'membertwo' AND id != #{@screenshot.id}"
              end
            end
          end
          if params[:images][:memberthree]
            @screenshot = Screenshot.new(params[:images][:memberthree])
            @screenshot.site_id = site_id
            @screenshot.location = 'memberthree'
            @xme = Screenshot.find(:first, :conditions => ["site_id = ? and location = 'memberthree'", site_id])
            if @screenshot.save 
              #delete the one we are replacing
              if @xme
                Screenshot.delete_all "parent_id = #{@xme.id} OR (site_id = #{@site.id} and location = 'memberthree' and id != #{@screenshot.id})"
              else
                Screenshot.delete_all "site_id = #{site_id} AND location = 'memberthree' AND id != #{@screenshot.id}"
              end
            end
          end
          if params[:images][:memberfour]
            @screenshot = Screenshot.new(params[:images][:memberfour])
            @screenshot.site_id = site_id
            @screenshot.location = 'memberfour'
            @xme = Screenshot.find(:first, :conditions => ["site_id = ? and location = 'memberfour'", site_id])
            if @screenshot.save 
              #delete the one we are replacing
              if @xme
                Screenshot.delete_all "parent_id = #{@xme.id} OR (site_id = #{@site.id} and location = 'memberfour' and id != #{@screenshot.id})"
              else
                Screenshot.delete_all "site_id = #{site_id} AND location = 'memberfour' AND id != #{@screenshot.id}"
              end
            end
          end

        end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to(sites_url) }
      format.xml  { head :ok }
    end
  end
end
