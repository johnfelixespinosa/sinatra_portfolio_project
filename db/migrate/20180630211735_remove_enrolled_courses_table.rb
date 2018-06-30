class RemoveEnrolledCoursesTable < ActiveRecord::Migration
  def change
    drop_table :enrolled_courses
  end
end
