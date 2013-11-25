module ProjectsHelper
  def trim_description(description)
    if description.length > 120
      description[0..120] + "..."
    else
      description
    end
  end
end
