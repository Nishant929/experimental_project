class RepositoriesController < ApplicationController


  before_filter :authenticate_user, :only => [:new, :create, :edit, :show]


  def new
    @repository = Repository.new
  end

  def create
    @repository = Repository.new(repo_params)
    if @repository.save
      @repository.user_id = @current_user.id
      flash[:notice] = "Successful !"
      #@current_user.profile.repos = @current_user.profile.repos + 1      this line show error
      redirect_to(:action=> 'profile', :controller=> 'sessions')
    else
      flash[:notice] = "Try Again !"
      redirect_to(:action=> 'home', :controller=> 'sessions')
    end
  end

  def show
    rep = Repository.find_by(id: params[self.id])
  end

  def edit
    @repository
  end


  private
  def repo_params
    params.require(:repository).permit(:rname, :repo)
  end

end
