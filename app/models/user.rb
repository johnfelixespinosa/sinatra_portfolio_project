class User < ActiveRecord::Base
  has_secure_password
  has_many :courses
  validates_uniqueness_of :username, {message: "Account exists"}

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

end