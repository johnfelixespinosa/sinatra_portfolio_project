class EnrolledCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  validates_uniqueness_of :course_name, scope: :user_id

  def slug
    course_name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end


end