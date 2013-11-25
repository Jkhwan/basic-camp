class Todo < ActiveRecord::Base
  belongs_to :project

  scope :sort_by, lambda { order('due_date ASC')}

  validates :name, presence: true
end
