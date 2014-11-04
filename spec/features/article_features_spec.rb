require 'rails_helper'

RSpec.describe "Article feature:", :type => :feature do
  
  before(:all) { 10.times { FactoryGirl.create(:article) } }
  after(:all)  { Article.delete_all }
  before(:each) { visit root_path }

  context "-- Dashboard --" do 
	  it "lists every article" do
			visit root_path
			Article.all.each do |article|
				expect(page).to have_selector('li', text: article.title)
				expect(page).to have_link(article.title)
			end
		end
  	
  	it "has the right title" do
      expect(page).to have_title("Dashboard")
  	end
  end

  context "-- Dashboard Citations --" do
    specify "cite all button works" do
      click_link "Cite All"
			Article.all.each do |article| 
				expect(page).to have_selector('li', article.build_citation)
			end
		end
  end

  context "-- Article Citations --" do
  	specify "cite me button works" do
  		article = Article.all.sample
  		visit article_path(article)
  		click_link "Cite"
  		expect(page).to have_content(article.build_citation)
  	end
  end

	context "-- Article Display --" do

		it "displays content" do
		  article = Article.all.sample
		  visit article_path(article)
			expect(page).to have_content(article.title)
			expect(page).to have_content(article.abstract)
			article.authors.each do |author|
				expect(page).to have_content(author.first_name)
				expect(page).to have_content(author.last_name)
			end
			article.sections.each do |section|
				expect(page).to have_content(section.heading)  				
				expect(page).to have_content(section.content)
			end
		end

		it "displays table of contents" do
			article = Article.all.sample
		  visit article_path(article)
			expect(page).to have_content("Table of Contents")
			article.sections.each do |section|
    		expect(page).to have_link("#{section.heading}")
    		pending "TODO - Not matching, but does match on localhost:3000" do
    			uri = URI.parse(current_url)
    			expect(uri.path).to eq("#{article_path(article)}##{section.heading}")
    	  end
    	end
    end
  end
end



