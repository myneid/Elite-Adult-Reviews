class Admin::UsersController < AdminAreaController

  # GET /users
  # GET /users.xml
  def index
    @users = User.find(:all)

     respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @user }
      end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @showuser = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @showuser }
    end
  end




  # GET /users/new
  # GET /users/new.xml
  def new
    @newuser = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @newuser }
    end
  end

  # GET /users/1/edit
  def edit
    @newuser = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @newuser = User.new(params[:user])

    respond_to do |format|
		  @newuser.encrypt_password(@newuser.password)
      if @newuser.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@newuser) }
        format.xml  { render :xml => @newuser, :status => :created, :location => @newuser }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @updateuser = User.find(params[:id])


    original_enc_password = @updateuser.password
    
    respond_to do |format|

      if @updateuser.update_attributes(params[:user])
        if params[:user][:password] != original_enc_password
          @updateuser.encrypt_password(params[:user][:password])
          @updateuser.save
        end
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@updateuser) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @updateuser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end