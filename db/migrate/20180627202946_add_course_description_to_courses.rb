class AddCourseDescriptionToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_descripton, :string
  end
end
