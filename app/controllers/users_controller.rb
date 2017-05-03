class UsersController < ApplicationController
  before_filter :authenticate_user, :only => [:update]
  before_filter :save_login_state, :only => [:new, :create]

  def new
    @user = User.new
    @profile = Profile.new
  end

  def create
    @user = User.new(user_params)
    @profile = @user.build_profile(profile_params)
    if @user.save
          @profile.save
          flash.now[:notice] = "Signed up successfully !!"
          @users = User.all                               # to get all users in @users
          @profiles = Profile.all                         # to get profile of all users in @profiles
          render "show"                                   # display show.html.erb while passing @users and @profiles ?
        else
          flash.now[:notice] = "Invalid form"
          flash.now[:color] = "Invalid"
          redirect_to :root

      end
  end

def show
  @users = User.all                     # same as above. not working if removed from above.
  @profiles = Profile.all               # same as above. not working if removed from above.
end

def update
    if @current_user.update(user_params)
      @profile = @current_user.profile
      @profile.update(profile_params)
      redirect_to(:action => 'profile', :controller => 'sessions')
    else
      flash[:notice] = "Some information is incorrect !!"
      redirect_to(:action => 'home', :controller => 'sessions')
  end
end

private
def user_params
  params.require(:user).permit(:username, :email, :password)
end

def profile_params
  params.require(:profile).permit(:fname, :lname, :dob, :city, :state, :country, :zip_code ,:phone_no)
end

end
