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

  scenario "user views citations for all articles on shelf" do
  	user = create_signed_in_user
  	3.times do |n|
  		article = create(:article)
  		article.authors << create(:author)
  		user.articles << article
  	end
  	other_users_article = create(:article)
  	visit root_path
  	click_link "Cite my articles"
  	user.articles.each do |article|
  		expect(page).to have_selector('ul', text: article.cite_me)
  	end
  	expect(page).not_to have_selector('li', text: other_users_article.cite_me)

  end

end





