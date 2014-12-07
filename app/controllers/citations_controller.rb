class CitationsController < ApplicationController
  
  before_action :authenticate_user!

  def index
  	@citations = current_user.shelf_citations
  end

  def show
  	article = Article.find(params[:id])
  	@citation = article.cite_me
  end

end