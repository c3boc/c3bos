# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :username
  validates_uniqueness_of :username

  def admin?
    role >= 2
  end

  def user?
    role >= 1
  end
end
