# frozen_string_literal: true

class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :order_permissions, dependent: :destroy
  has_many :beverages, through: :order_permissions

  def admin?
    role >= 2
  end

  def user?
    role >= 1
  end

  def disabled?
    role.zero?
  end
end
