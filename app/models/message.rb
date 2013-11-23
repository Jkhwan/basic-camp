class Message < ActiveRecord::Base
  belongs_to :Discussion
  belongs_to :User
end
