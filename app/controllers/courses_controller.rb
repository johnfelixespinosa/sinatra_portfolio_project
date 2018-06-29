require 'rack-flash'
class CoursesController < ApplicationController
  use Rack::Flash

  get '/courses/courses' do
      @user = User.find_by_slug(params[:slug])
      erb :'courses/courses'
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
         params[:course_description] == "" ||
         params[:course_credits] == "" 
         flash[:message] = "Unable to add course"
         redirect to '/courses/new_course'
      else
        @course = current_user.courses.build(
          course_name: params[:course_name],
          course_instructor: current_user[:username],
          course_description: params[:course_description],
          course_credits: params[:course_credits],
          user_id: session[:user_id]
          )
        if @course.save
           flash[:message] = "Course Added"
           redirect to ("/users/#{@course.user.slug}")
        else
          flash[:message] = "You are already enrolled in #{@course.course_name}"
          redirect to '/courses/new_course'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/courses/:slug/:id/delete' do
    if logged_in?
      @course = Course.find_by_id(params[:id])
        if @course && @course.user == current_user
          @course.delete
        end
        redirect to ("/users/#{@course.user.slug}")
      else
        redirect to '/login'
      end
    end

  get '/courses/:slug/:id/edit' do
    if logged_in?
      @course = Course.find_by_id(params[:id])
        if @course && @course.user == current_user
        erb :'courses/edit_course'
      else
        redirect to '/login'
      end
    end
  end

  patch '/courses/:id' do #update post
    if logged_in?
      @course = Course.find_by_id(params[:id])
      if params[:course_name] == "" ||
         params[:course_description] == "" ||
         params[:course_credits] == "" 
         flash[:message] = "Please fill in all parts!"
         redirect to "/courses/#{@course.user.slug}/#{@course.id}/edit"
      else
        @course.update(
          course_name: params[:course_name],
          course_description: params[:course_description],
          course_credits: params[:course_credits]
          )
        @course.save
        redirect to ("/users/#{@course.user.slug}")
      end
    else
        redirect to '/login'
    end
  end


end