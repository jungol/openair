class ArticlesController < ApplicationController
 
	before_action :authenticate_user!

  def show
    @article = Article.find_by_id(params[:id])
    @article.article_content_to_array
    if current_user && current_user.articles.include?(@article)
      @copy = current_user.copies.find_by(article_id: @article.id)
      @highlights = @copy.highlights.map(&:location)
      @notes = @copy.notes.map{ |note| [note.location, note.content]}
    end
  end

end
