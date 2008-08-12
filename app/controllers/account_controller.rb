class AccountController < ApplicationController

  def login
    if params['submit']
      user = User.find_by_login(params['name'], params['password'])
      if user
        if user.activated == 1
          # login successful
          flash[:success] = 'You have logged in successfully.'
          @user = user
          user.activated = 1
          user.save
          if user.role == 'Admin'
            redirect_to "/admin"
          else
            return_to_last_remembered
          end
        else
          flash[:invalid] = 'Your account is not activated, please check your email to activate.'
        end
      else
        flash[:invalid] = 'Login information invalid.'
      end
    end
  end

  #TODO
=begin
  def signup
    unless @member.is_guest?
      flash[:invalid] = 'Already registered'
      redirect_to :controller => 'account'
    end

    if params['new_member'].nil?
      @new_member = User.new
    else
      @new_member = User.new(params['new_member'])
      if @new_member.save
        Mailer.deliver_registration_mail(@new_member)
        render :action => 'registration_complete'
      else
        flash[:invalid] = @new_member.errors.full_messages
      end
    end
  end
=end

  def verify
    unless params[:user].nil?
      begin
        @user = User.find(params[:member_id].to_i)
      rescue
        redirect_to "/main"
        return
      end
      unless @user.nil?
        if params[:security_code] == @user.signup_validation
          @user.validated = 1
          @user.activated = 1
          if @user.save
            flash[:success] = "Your account is now activated!"
          end
        end
      end
    end
    redirect_to "/main"
  end

  def logout
    flash[:notice] = "You have logged out successfully."
    @user = Guest.new
    redirect_to "/main"
  end

  def forgotpassword
    if params['email']
      member = User.find_by_email_address(params['email'])
      if member
        key = member.generate_security_token
        reset_url = url_for({:controller=>'account', :action=>'resetpassword'}) + "?member_id=#{member.id}&key=#{key}"
        Mailer.deliver_reset_password(member, reset_url)
        flash[:success] = 'Mail sent.'
        redirect_to :controller => 'account', :action => 'login'
      else
        flash[:invalid] = 'Email address not found, please try again.'
      end
    end
  end
  def resetpassword
    if params[:member_id] and params[:key]
      if params[:newpass] and params[:newpasstwo]
        member = User.find(params[:member_id])
        if member 
          if params[:key] == member.security_token and Time.now < member.token_expiry
            if params[:newpass].to_s == params[:newpasstwo].to_s and params[:newpass].length > 4
              member.password = params[:newpass].to_s
              member.save
            else
              flash[:invalid] = 'Please try again, passwords must match and be at least 5 characters. '
              render :action => 'resetpassword'
              return
            end
          else
            flash[:invalid] = 'Expired.  Please try again.'
            redirect_to '/account/login'
            return
          end
        else
          flash[:invalid] = 'Please try again. '
          redirect_to '/account/login'
          return
        end
        render :action => 'password_reset_complete'
      else
        render
      end
    else
      flash[:invalid] = '  Please try again. '
      redirect_to '/account/login'
    end
  end
end
