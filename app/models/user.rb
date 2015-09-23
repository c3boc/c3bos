class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :username
  validates_uniqueness_of :username

  def admin?
    self.role >= 2
  end

  def user?
    self.role >= 1
  end
end
