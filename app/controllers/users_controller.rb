require 'pry'
require 'sinatra'
require 'sinatra/flash'

class UsersController < ApplicationController
  register Sinatra::Flash

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    if params[:username] == "" || 
       params[:email] == "" || 
       params[:password] == ""
       flash[:message] = "Missing fields"
       redirect to '/signup'
    elsif
       username_exists?(params[:username])
       flash[:message] = "Username exists, try logging in."
       redirect to '/login'
    elsif
       email_exists?(params[:email])
       flash[:message] = "Email already in use, please try again."
       redirect to '/signup'
    else
       @user = User.new(
        :username => params[:username],
        :email => params[:email],
        :password => params[:password]
        )
       @user.save
       session[:user_id] = @user.id
       redirect to ("/users/#{@user.slug}")
     end
  end

  get '/login' do
    erb :'/users/login'
  end


  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      
      flash[:message] = "Successfully Logged In"
      redirect to ("/users/#{@user.slug}")
    else
      flash[:message] = "Account Not Found, Please Signup"

      redirect to '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/'
    end
  end

end