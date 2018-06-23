class CoursesController < ApplicationController

  get '/courses' do
    if logged_in?
      @courses = Course.all
      erb :'courses/courses'
    end
  end

  get '/courses/new' do 
    if logged_in?
      erb :'courses/new_course'
    else
      redirect to '/login'
    end
  end

end