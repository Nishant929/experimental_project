class FeedbackController < ApplicationController

  def new
    @feedback = Feedback.new
    @issue = Issue.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.name = @current_user.username
    @feedback.email = @current_user.email
    @feedback.phone_no = @current_user.phone_no
    if @feedback.save
      flash[:notice] = "THANK YOU FOR YOUR FEEDBACK"
      redirect_to(:action => 'home', :controller => 'sessions')
    else
      flash[:notice] = "ERROR"
      redirect_to(:action => 'home', :controller => 'sessions')
    end
  end

  def show
  end

  private
  def feedback_params
    params.require(:feedback).permit(:comment)
  end

end
