class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  normalizes :username, with: ->(username) {username.downcase.strip}

  enum role:{
    guest: 0,
    bar: 1,
    supervisor: 2,
    admin: 3
  } 
  
end
