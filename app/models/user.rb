class User < ActiveRecord::Base
  has_secure_password
  has_many :courses
  has_many :enrolled_courses

  enum usertype: [:student, :instructor]
  after_initialize :set_default_usertype, :if => :new_record?

  def set_default_usertype
    self.usertype ||= :student
  end

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

end