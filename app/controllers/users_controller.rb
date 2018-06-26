require 'rack-flash'
class UsersController < ApplicationController
  use Rack::Flash

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
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Successfull Account Creation"

      redirect to ("/users/#{@user.slug}")
    else
      flash[:message] = "Username exists, did you mean Login"
      redirect to '/login'
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
      puts "Account Not Found, Please Signup"

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