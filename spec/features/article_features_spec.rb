require 'rails_helper'

feature "Article feature:", :type => :feature do

  scenario "user views article" do 
  	user = create_signed_in_user
  	article = create(:article_with_sections)
  	user.articles << article
  	visit root_path
  	click_link article.title
  	expect(page).to have_title(full_title(article.title))
  	expect(page).to have_selector('h1', text: article.title)
  	article.authors.each do |author|
  	  expect(page).to have_selector('div.author', text: author.full_name)
  	end
  	article.sections.each do |section|
  		expect(page).to have_selector('div.section h3', text: section.heading)
  	end
  end
end




