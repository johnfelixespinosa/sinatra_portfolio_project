class Course < ActiveRecord::Base
  belongs_to :user
  belongs_to :enrollment
  
  validates_uniqueness_of :name, scope: :user_id

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end


end