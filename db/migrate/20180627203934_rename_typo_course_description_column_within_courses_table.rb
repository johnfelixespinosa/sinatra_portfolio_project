class RenameTypoCourseDescriptionColumnWithinCoursesTable < ActiveRecord::Migration
  def change
    rename_column :courses, :course_descripton, :course_description
  end
end
