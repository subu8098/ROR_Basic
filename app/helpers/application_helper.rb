module ApplicationHelper
  # used in app/views/articles/show.html.erb
  # Format timestamps 
  def formatted_time(datetime)
    datetime.strftime("%B %d, %Y %I:%M %p")  # Example: "August 22, 2025 04:32 PM"
  end

  # truncating long text
  def truncate_text(text, length = 50)
    text.length > length ? "#{text[0...length]}..." : text
  end
end
