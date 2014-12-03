class CitationsController < ApplicationController
  def index
  	article = Article.find(params[:article_id])
  	@citations = article.bibliography
  end

  def show
  	article = Article.find(params[:id])
  	@citation = article.cite_me
  end

end