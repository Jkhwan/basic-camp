    class User < AR::Base
      has_many :projects, through: :participants
      has_many :messages
      has_many :discussions
    end
    
    class Project < AR::Base
      has_many :users, through: :participants
      has_many :todos
      has_many :discussions
    end
    
    class Participant < AR::Base
      belongs_to :user
      belongs_to :project
    end
    
    class Todo < AR::Base
      belongs_to :project
    end
    
    class Discussion < AR::Base
      belongs_to :project
      belongs_to :user
      has_many :messages
    end
    
    class Message < AR::Base
      belongs_to :discussion
      belongs_to :user
    end