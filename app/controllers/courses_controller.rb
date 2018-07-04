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

  get '/courses/:id/show' do
    if logged_in?
      @course = Course.find_by_id(params[:id])
      @course_description = @course.course_description
      @course_instructor = @course.course_instructor
      @course_name = @course.course_name
      @course_credits = @course.course_credits
      erb :'courses/show_course'
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
          course_instructor: "#{[current_user.first_name, current_user.last_name].join(' ')}",
          course_description: params[:course_description],
          course_credits: params[:course_credits]
          )
        @course.save
        if @course.save
           flash[:message] = "Course Added"
           redirect to ("/users/#{current_user.slug}")
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
        redirect to ("/users/#{current_user.slug}")
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
         redirect to "/courses/#{current_user.slug}/#{@course.id}/edit"
      else
        @course.update(
          course_name: params[:course_name],
          course_description: params[:course_description],
          course_credits: params[:course_credits]
          )
        @course.save
        redirect to ("/users/#{current_user.slug}")
      end
    else
        redirect to '/login'
    end
  end

  get '/courses/:id/enroll_course' do
    if logged_in?
      @course = Course.find_by_id(params[:id])
      @course_description = @course.course_description
      @course_instructor = @course.course_instructor
      @course_name = @course.course_name
      @course_credits = @course.course_credits
      erb :'courses/enroll_course'
    else
      redirect to '/login'
    end
  end

  get '/courses/:id/enroll' do 
    if logged_in?
      if is_a_student?
          current_course
          @enroll = Enrollment.new(
            :user_id => session[:user_id],
            :course_id => current_course.id
            )
         @enroll.save
         #flash[:message] = "Enrolled in Course"
         redirect to ("/users/#{current_user.slug}")
      end
    end
  end

  delete '/courses/:slug/:id/withdraw' do
    if logged_in?
      current_course
      find_student_enrollments.each do |x| 
      if Course.find_by_id(x.course_id == current_course.id)
      x.delete
      flash[:message] = "Withdrew from Course" 
      end
      end
       
        redirect to ("/users/#{current_user.slug}")
      else
        redirect to '/login'
      end
    end
end