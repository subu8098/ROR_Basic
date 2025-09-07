module ArticlesHelper
  # used in app/views/articles/index.html.erb
  def highlight_long_title(article)
    if article.title.length > 20
      content_tag(:span, article.title, style: "color: red; font-weight: bold;")
    else
      article.title
    end
  end
end

