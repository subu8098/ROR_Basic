require 'open-uri'

class ArticlesController < ApplicationController
  # def index
  #   # For now, hardcoded data
  #   @articles = [
  #     { title: "First Article", body: "This is the first article body" },
  #     { title: "Second Article", body: "This is the second article body" }
  #   ]
  # end

  # def show
  #   # Just placeholder logic for now
  #   @article = { title: "Sample Article", body: "More detailed content..." }
  # end

  # def new
  #   render json: { message: "New article form" }
  # end

  # def edit
  # end



  def index
    @articles = Article.all
  end

 def show
  @article = Article.find(params[:id])

  # If special cloud flag is sent, fetch HTML from Firebase
  if params[:cloud] == 'true'
    firebase_url = "https://dev123-25ae5.web.app/articles/#{@article.id}/show.html"
    begin
      html = URI.open(firebase_url).read
      render html: html.html_safe, layout: false
    rescue
      render plain: "Cloud content not found", status: :not_found
    end
  end
end

# to manage the AJAX call for dynamic content loading
def cloud_html
  article_id = params[:id]
  firebase_url = "https://dev123-25ae5.web.app/articles/#{article_id}/show.html"
  begin
    html = URI.open(firebase_url).read
    render html: html.html_safe, layout: false
  rescue
    render plain: "Cloud content not found", status: :not_found
  end
end

  
#   to show the page dynamic directlu
#   def show
#   firebase_url = "https://dev123-25ae5.web.app/articles/#{params[:id]}/show.html"
#   begin
#     html = URI.open(firebase_url).read
#     render html: html.html_safe, layout: false
#   rescue OpenURI::HTTPError
#     render html: "<h1>Article Not Found</h1>".html_safe, status: :not_found
#   end
# end


  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article created successfully"     # flash logic is wrote in view/application.html.erb
      redirect_to @article
    else
      flash[:alert] = "Error creating article"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
   
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article updated successfully"
      redirect_to @article
    else
      flash[:alert] = "Error updating article"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "Article deleted"
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end


end
