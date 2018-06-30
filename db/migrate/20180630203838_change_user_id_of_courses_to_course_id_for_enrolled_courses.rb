class ChangeUserIdOfCoursesToCourseIdForEnrolledCourses < ActiveRecord::Migration
  def change
    rename_column :enrolled_courses, :user_id, :course_id
  end
end
