class CreateClasses < ActiveRecord::Migration
  def change
    create_table :classes do |t|
      t.string :class_name
      t.string :class_instructor
      t.string :class_credits
      t.integer :user_id
    end
  end
end
