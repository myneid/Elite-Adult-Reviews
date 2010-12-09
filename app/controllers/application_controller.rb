class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all # include all helpers, all the time
#  protect_from_forgery  :secret => '26e4d6404e47434c4d4c4e4449424c3f'
  before_filter :setup_user
  after_filter :finish_user, :remember_location, :flash_to_json_header


  def setup_user
    if params['user_id'] and params['key']
      @user = User.find_by_token(params['user_id'], params['key'])
      @authenticated_by_token = true
      if @user
        # set the token to expire in no more than next 10 minutes
        @user.token_expiry = [@user.token_expiry, Time.at(Time.now.to_i + 600 * 1000)].min
        # activate the account
        @user.activated = 1
        @user.save
      end
    elsif session[:user_id]
      @user = User.find(session[:user_id])
    else
      session[:topic_reads] ||= Hash.new
      @user = Guest.new(session[:guest_name], session[:guest_email], session[:topic_reads]) if @user.nil?
    end

  end


  def finish_user
    # user can be nil if the request IP was blocked
    if not @user.nil?
      session[:user_id] = @user.id
      session[:guest_name] = @user.guest_name
      session[:guest_email] = @user.guest_email
    end
  end



  def flash_to_json_header
    if request.xhr?
      response.headers['X-JSON'] = flash.to_json
      #response.headers['Content-Type'] = 'application/json'
      #render_text flash.to_json
      flash.discard
    end
  end


  def remember_location
    if response.headers['Status'] == '200 OK'
      if !request.xhr?
        unless controller_name ==  'account'
          unless params[:id].nil?
            session[:return_to] = url_for :controller => controller_name, :action => action_name, :id => params[:id]
          else
            session[:return_to] = url_for :controller => controller_name
          end

        unless params[:page].nil?
          session[:return_to] = url_for :controller => controller_name, :action => action_name, :page => params[:page]
        end
        #search
        unless params[:query].nil?
          session[:return_to] = url_for :controller => controller_name, :action => action_name, :query => params[:query], :page => params[:page]
        end
        end
      end
    end
  end


  def return_to_last_remembered
    begin
      redirect_to(session[:return_to] || '/')
    rescue 
      redirect_to('/')
    end
  end


  protected
  def login_required
    if session[:user_id]
      yield
    else
      flash[:invalid] = 'Login Required.'
      redirect_to :controller => 'user', :action => 'login'
    end
  end

  def editor_login_required
    if session[:user_id]
      if @user.role == 'Admin' or @user.role == 'Editor'
        return true
      else
        flash[:invalid] = 'Access Denied.'
        redirect_to :controller => 'entries', :action => 'list'
      end
    else
      flash[:invalid] = 'Login Required.'
      redirect_to :controller => 'user', :action => 'login'
    end
  end
  
  def admin_login_required
    if session[:user_id]
      if @user.role != 'Admin'
        flash[:invalid] = 'Access Denied.'
        redirect_to :controller => 'entries', :action => 'list'
      end
    else
      flash[:invalid] = 'Login Required.'
      redirect_to :controller => '/account', :action => 'login'
    end
  end
end
