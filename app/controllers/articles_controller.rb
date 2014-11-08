class ArticlesController < ApplicationController
  def index
  	@articles = Article.all
  end

  def design
    #FOR DESIGN PROTOTYPING
  end
  def article1
    @article1 = "pushdown"
  end
  def article2
    @article2 = "pushdown"
  end
  def article3
    @article3 = "pushdown"
  end
  def article4
    @article4 = "pushdown"
  end
  def article5
    @article5 = "pushdown"
  end
  def citearticles
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
