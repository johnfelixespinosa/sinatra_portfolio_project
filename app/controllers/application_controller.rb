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

    def is_a_student?
      @current_user == current_user
      @current_user.student?
    end

    def email_has_iocc_edu?(email)
      email.downcase.include?('@iocc.edu')
    end

    def email_has_iocc_staff_edu?(email)
      email.downcase.include?('@iocc.staff.edu')
    end

    def find_student_enrollments
      @active_enrollments = Enrollment.where(user_id: @current_user.id)
    end

    # def match_enrollment_to_course
    #   Course.find_by(id: @active_enrollments.each.course_id)
    # end

    def already_enrolled?
      @course = Course.find_by_id(params[:id])
      Enrollment.find_by(user_id: current_user.id, course_id: @course.id)
    end


  end

end