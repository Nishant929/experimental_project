
Rails.application.routes.draw do
  #---------------------------------ROOT----------------------------------------
  root 'home#index'
  #---------------------------------SESSIONS------------------------------------
  get 'sessions/login'
  get 'sessions/home'
  get 'sessions/profile'
  get 'sessions/setting'
  get 'sessions/login_attempt'
  get 'sessions/logout'
  get 'sessions/edit'
  get 'sessions/download_file'
#----POST----
  post 'sessions/login_attempt'
  post 'sessions/home'
  post 'sessions/profile'
  post 'sessions/edit'
#---------------------------------REPOSITORIES----------------------------------

  get 'repositories/new'
  get 'repositories/show'
  get 'repositories/edit'
  get 'repositories/create'
  get 'repositories/show'
  #----POST----
  post 'repositories/new'
  post 'repositories/create'
  #---------------------------------HOME----------------------------------------
  resource :home, :only => [:index]
  get 'home/business'
  get 'home/login'
  get 'home/pricing'
#----POST----
  post'home/login'
#---------------------------------USERS-----------------------------------------
  resource :users
    get 'users/show', to: 'users#show'

#----POST----
  post 'users/new'
#---------------------------------FEEDBACKS-------------------------------------
  get 'feedback/new'
end
