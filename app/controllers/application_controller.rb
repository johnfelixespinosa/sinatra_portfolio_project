require './config/environment'

class ApplicationController <Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "scheduler_secret"
  end

  get '/' do 
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def username_exists?(username)
      User.find_by(username: username) != nil
    end

    def email_exists?(email)
      User.find_by(email: email) != nil
    end

    # def multiple_usertypes?(usertype)
    #   User.

  end

end