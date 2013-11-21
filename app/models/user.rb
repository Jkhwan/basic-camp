class User < ActiveRecord::Base
  has_many :projects, through: :participants
   has_many :participants

   has_secure_password
end
