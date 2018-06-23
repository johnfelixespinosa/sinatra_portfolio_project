class RenameClassTableColumnsToCourses < ActiveRecord::Migration
  def change
    rename_column :courses, :class_name, :course_name
    rename_column :courses, :class_instructor, :course_instructor
    rename_column :courses, :class_credits, :course_credits
  end
end
