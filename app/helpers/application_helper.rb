module ApplicationHelper
  def bootstrap_alert(key)
    if key == :notice
      key = :success
    elsif key == :alert
      key = :danger
    else
      key
    end
  end
end
