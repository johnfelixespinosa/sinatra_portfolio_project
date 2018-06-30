class AddEnrolledCoursesTable < ActiveRecord::Migration
  def change
    create_table :enrolled_course do |t|
      t.string  :course_name
      t.string  :course_instructor
      t.string  :course_credits
      t.integer :user_id
      t.string  :course_description
    end
  end
end
