class Enrollment < ActiveRecord::Base
  has_one :user
  has_one :course

end