class Location < ActiveRecord::Base
  has_many :orders
end
