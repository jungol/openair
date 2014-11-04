class ArticlesController < ApplicationController
  def index
  	@articles = Article.all
  end

  def show
    @article = Article.find_by_id(params[:id])
  end

  def cite
  	article = Article.find_by_id(params[:id])
    @citation = article.make_citation
  end

end
