class User < ActiveRecord::Base
  has_many :projects, through: :participants
  has_many :participants
end
