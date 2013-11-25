module TodosHelper
  def completed(condition)
    return condition ? "Yes" : "No"
  end
end
