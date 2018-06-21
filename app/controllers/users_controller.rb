class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.new(
      :username => params[:username],
      :email => params[:email],
      :password => params[:password]
      )
    @user.save
    session[:user_id] = @user.id

    redirect("/users/#{@user.slug}")
  end

  get '/login' do
    erb :'/users/login'
  end

end