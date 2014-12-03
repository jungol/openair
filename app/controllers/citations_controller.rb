class CitationsController < ApplicationController
  def show
  	article = Article.find(params[:id])
  	@citation = article.cite_me
  end

  def index
  	article = Article.find(params[:article_id])
  	@citations = []
  	article.cited_articles.each do |cited_article|
  	  @citations << Citation.build_citation(cited_article)
  	end
  end
end
