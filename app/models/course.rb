class Course < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :course_name, scope: :user_id



end