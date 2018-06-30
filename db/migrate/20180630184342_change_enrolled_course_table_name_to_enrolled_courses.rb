class ChangeEnrolledCourseTableNameToEnrolledCourses < ActiveRecord::Migration
  def change
    rename_table :enrolled_course, :enrolled_courses
  end
end
