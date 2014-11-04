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

    it "cites all articles" do
		  article = FactoryGirl.create(:article)
		  author = FactoryGirl.create(:author)
		  publication = FactoryGirl.create(:publication)
		  journal = FactoryGirl.create(:journal)
  		article.authors << author
  		publication.articles << article
  		publication.journal = journal
  		article.save
  		publication.save
      visit root_path
      click_link "Cite All"
			expect(page).to have_selector('li', article.make_citation)
    end
  end

  describe "display page" do

    it "shows the article contents" do
    	article = FactoryGirl.create(:article_with_sections)
    	article.authors << FactoryGirl.create(:author)
      visit article_path(article)
    	expect(page).to have_selector('h1', text: article.title)
    	expect(page).to have_selector('li#abstract', text: article.abstract)
    	article.authors.each do |author|
    		expect(page).to have_selector('li.author', text: author.first_name)
			end
      article.sections.each do |section|
      	expect(page).to have_selector('li.section', text: section.heading)
      	expect(page).to have_selector('li.section', text: section.content)
      end
    end
  end

  describe "cite link" do
  	let(:article) { FactoryGirl.create(:article)}
  	let(:author) { FactoryGirl.create(:author)}
  	let(:publication) { FactoryGirl.create(:publication)}
  	let(:journal) { FactoryGirl.create(:journal)}
  	
  	it "displays citation made by make_citation" do
  		article.authors << author
  		article.publication = publication
  		publication.journal = journal
  		visit article_path(article)
  		click_link "Cite"
  		expect(page).to have_content(make_citation(article))
  	end
  end
end


