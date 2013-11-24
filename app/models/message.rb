class Message < ActiveRecord::Base
  belongs_to :Discussion
  belongs_to :User

  validates :subject, presence: true
  validates :content, presence: true
  
  scope :order_by_date, lambda { order('created_at DESC') }
end
