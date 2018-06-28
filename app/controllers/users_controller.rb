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
       params[:password] == "" ||
       params[:usertype] == ""
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
    elsif
       params[:username].length < 8
       flash[:message] = "Username to short"
       redirect to '/signup'
    elsif
       params[:password].size < 8
       flash[:message] = "Password to short"
       redirect to '/signup'
    elsif
       params[:usertype] == "student" && !email_has_iocc_edu?(params[:email])
       flash[:message] = "IOCC students please use your @iocc.edu email"
       redirect to '/signup'
    elsif
       params[:usertype] == "instructor" && !email_has_iocc_staff_edu?(params[:email])
       flash[:message] = "IOCC instructors please use your @iocc.staff.edu email"
       redirect to '/signup'
    else
       @user = User.new(
        :username => params[:username],
        :email => params[:email],
        :password => params[:password],
        :usertype => params[:usertype]
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