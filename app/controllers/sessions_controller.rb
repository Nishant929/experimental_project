class SessionsController < ApplicationController
  before_filter :authenticate_user, :only => [:home, :profile, :edit]
  before_filter :save_login_state, :only => [:login, :login_attempt]

  def login
    render "login"        #login form
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:password])   #check for login match. authorized_user from ApplicationController.rb calling function of User class(model)
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

  def home
    @repos = Repository.find_by(rid: params[@current_user.id])
    user = ApplicationController.instance_variable_get(:@current_user)    # not working !! trying to get the current user
  end

  def profile
  end

  def edit
    @profile = @current_user.profile
  end

  def update
      if @current_user.update(user_params)
        @profile = @current_user.profile
        @profile.update(profile_params)
        redirect_to(:action => 'profile')
      else
        flash[:notice] = "Some information is incorrect !!"
        redirect_to(:action => 'home')
    end
  end

  def download_file
    @repos = Repository.find_by(rid: params[@current_user.id])
    send_file(repos_path, filename: @repos.rname, type: @repo.repo_content_type)
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :photo)
  end

  def profile_params
    params.require(:profile).permit(:fname, :lname, :dob, :city, :state, :country, :zip_code ,:phone_no)
  end

end
