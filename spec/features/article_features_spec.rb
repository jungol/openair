require 'rails_helper'

feature "Article feature:", :type => :feature do

  let!(:user) { create_signed_in_user }


  scenario "user views article" do 
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
  	  expect(page).to have_selector('div.section p span.sentence')
    end
  end

  scenario "user has access to shelf from article page" do
    article = create(:article)
    user.articles << article
    visit article_path(article)
    expect(page).to have_selector('div#sidebar-wrapper')
  end

  # scenario "user sees previous highlights on article" do
  #   article = create(:article)
  #   section = create(:section)
  #   section.content = "Hey there. You, there. Yo."
  #   article.sections << section
  #   user.articles << article
  #   copy = user.copies.find_by(article_id: article.id)    
  #   Highlight.create(copy_id: 1, location: 0)
  #   visit article_path(article)
  #   # save_and_open_page
  #   expect(page).to have_selector('span.highlight', text: "Hey there.")
  # end

  

end




