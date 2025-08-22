module FindsArticle
  extend ActiveSupport::Concern

  included do
    private
    def set_article_from_params
      
      id = params[:article_id] || params[:id]
      @article = Article.find(id)
    end
  end
end
