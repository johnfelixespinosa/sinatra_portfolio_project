class RenameCourseFieldsToNotBeRedundant < ActiveRecord::Migration
  def change
    rename_column :courses, :course_name, :name
    rename_column :courses, :course_instructor, :instructor
    rename_column :courses, :course_credits, :credits
  end
end
