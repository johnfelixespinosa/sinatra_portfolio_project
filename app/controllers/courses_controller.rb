require 'rack-flash'
class CoursesController < ApplicationController
  use Rack::Flash

  get '/courses/courses' do
    if logged_in?
      erb :'courses/courses'
    else
      redirect to '/login'
    end
  end

  get '/courses/new_course' do 
    if logged_in?
      erb :'courses/new_course'
    else
      redirect to '/login'
    end
  end

  post '/new_course' do
    if logged_in?
      if params[:course_name] == "" ||
         params[:course_instructor] == "" ||
         params[:course_credits] == "" 
         flash[:message] = "Unable to add course"
         redirect to '/courses/new_course'
      else
        @course = current_user.courses.build(
          course_name: params[:course_name],
          course_instructor: params[:course_instructor],
          course_credits: params[:course_credits],
          user_id: session[:user_id]
          )
        if @course.save
           flash[:message] = "Course Added"
           redirect to '/courses/courses'
        else
          flash[:message] = "You are already enrolled in #{@course.course_name} course"
          redirect to '/courses/new_course'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/courses/:id/delete' do
    if logged_in?
      @course = Course.find_by_id(params[:id])
        if @course && @course.user == current_user
          @course.delete
        end
        redirect to '/courses/courses'
      else
        redirect to '/login'
      end
    end



end