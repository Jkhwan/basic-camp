module DiscussionsHelper
  def author_name(message)
    user = User.find(message.user_id)
    user.full_name
  end
  def pretty_date(date)
    date.strftime("%b %d, %Y")
  end
  def short_date(date)
    date.strftime("%b %d")
  end
end
