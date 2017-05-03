class HomeController < ApplicationController
  def index
    render "index"
  end

  def business
    render "business"
  end

  def login
    render "login"
  end

  def signup
    render "signup"
  end
end
