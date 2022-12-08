module ApplicationHelper
  def form_title
    if @title.present?
      @title
    else
      @title = "New book"
    end
  end
end
