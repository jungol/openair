class StaticPagesController < ApplicationController
  def home
  	if user_signed_in?
  		@articles = current_user.articles
    end
  end
end
