class Discussion < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :messages

  validates :subject, :content, presence: true
end
