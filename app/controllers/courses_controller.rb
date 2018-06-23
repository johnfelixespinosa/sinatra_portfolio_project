class CoursesController < ApplicationController

  get '/courses' do
    if logged_in?
      @courses = Course.all
      erb :'courses/courses'
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
      if params.any? == ""
        redirect to '/courses/new_course'
      else
        @course = current_user.courses.build(
          course_name: params[:course_name],
          course_instructor: params[:course_instructor],
          course_credits: params[:course_credits],
          user_id: session[:user_id]
          )
        if @course.save
          params.inspect
        else
          redirect to '/courses/new_course'
        end
      end
    else
      redirect to '/login'
    end
  end



end