class ArticlesController < ApplicationController
 
	before_action :authenticate_user!

  def show
    @article = Article.find_by_id(params[:id])
  end

end
