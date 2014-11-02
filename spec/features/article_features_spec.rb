require 'rails_helper'

RSpec.describe "Article", :type => :feature do
  
  describe "dashboard" do

	  before(:all) { 30.times { FactoryGirl.create(:article) } }
    after(:all)  { Article.delete_all }

		it "should list each article with links" do
			visit root_path
			Article.all.each do |article|
				expect(page).to have_selector('li', text: article.title)
				expect(page).to have_link(article.title)
			end
		end

		it "displays the article author" do
			pending
			visit root_path
			expect(page).to have_content(article_1.author)
		end

  	it "has the right title" do
  		pending
      expect(page).to have_title("Dashboard")
  	end
  end

  describe "display page" do

    it "shows the article contents" do
    	article = FactoryGirl.create(:article_with_sections)
    	article.authors << FactoryGirl.create(:author)
      visit article_path(article)
    	expect(page).to have_selector('h1', text: article.title)
    	expect(page).to have_selector('li#abstract', text: article.abstract)
    	expect(page).to have_selector('li.author', text: article.authors.first.first_name)
      article.sections.each do |section|
        expect(page).to have_selector('li.section', text: section.heading)
        expect(page).to have_selector('li.section', text: section.content)

      end
    end
  end
  
end


