require 'rails_helper'

feature "Citation feature:", :type => :feature do

  scenario "user views article citation" do 
    user = create_signed_in_user
    article = create(:article_with_sections)
    user.articles << article
    visit article_path(article)
    click_link "Cite this paper"
    expect(page).to have_content(article.cite_me)
  end

end





