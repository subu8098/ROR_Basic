class CommentsController < ApplicationController
  # include FindsArticle is a concern file which is created in app/controllers/concerns/finds_article.rb
  # it is used to use the method set_article_from_params in this controller

    include FindsArticle
    before_action :set_article_from_params, only: [:create, :destroy]  #if we want to just include FindArticle and do this process the this before_action should give inside the include block on the concerns file.

  # def create
  #   @article = Article.find(params[:article_id])
  #   @comment = @article.comments.build(comment_params)

  #   if @comment.save
  #     flash[:notice] = "Comment added"
  #     redirect_to article_path(@article)
  #   else
  #     flash[:alert] = "Failed to add comment"
  #     redirect_to article_path(@article)
  #   end
  # end
  def create           
    #@article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)

    if @comment.save
      flash[:notice] = "Comment added"
      redirect_to article_path(@article)
    else
      flash[:alert] = "Failed to add comment"
      redirect_to article_path(@article)
    end
  end

    def destroy
    # @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted"
    redirect_to article_path(@article)
    end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
