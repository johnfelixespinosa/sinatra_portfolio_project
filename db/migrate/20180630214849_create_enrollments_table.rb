class CreateEnrollmentsTable < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :course_id
    end
  end
end
