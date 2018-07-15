class RenameCourseDescriptionToDescription < ActiveRecord::Migration
  def change
    rename_column :courses, :course_description, :description
  end
end
