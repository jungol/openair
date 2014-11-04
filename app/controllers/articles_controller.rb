class ArticlesController < ApplicationController
  def index
  	@articles = Article.all
  end

  def show
    @article = Article.find_by_id(params[:id])
  end

  def cite
  	article = Article.find_by_id(params[:id])
    @citation = article.build_citation
  end

  def cite_all
    articles = Article.all
    @citations = []
    articles.each { |article| @citations << article.build_citation }
  end
end
