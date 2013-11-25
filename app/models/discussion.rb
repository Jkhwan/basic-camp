class Discussion < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :messages
  scope :order_by_date, lambda { order('created_at DESC') }

  validates :subject, :content, presence: true
end
