class ArticlesController < ApplicationController

 
  def show
    @articles = current_user.articles
    @article = Article.find_by_id(params[:id])
  end

  def design
  end
end
