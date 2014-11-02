require 'rails_helper'

RSpec.describe "Articles", :type => :feature do
  
  describe "dashboard" do

		let(:article_1) { FactoryGirl.create(:article)}
		let(:article_2) { FactoryGirl.create(:article)}

		it "displays the article title" do
			visit root_path
			expect(page).to have_content(article_1.title)
			expect(page).to have_content(article_2.title)
		end

		it "displays the article author" do
			pending
			visit root_path
			expect(page).to have_content(article_1.author)
		end

		it "links to the articles" do
			visit root_path
			expect(page).to have_link(article_1.title)
			click_link article_1.title
			expect(page).to have_selector('h1', text: article_1.title)
		end

  	it "has the right title" do
  		pending
      expect(page).to have_title("Dashboard")
  	end
  end

  describe "view" do

    let(:article_1) { FactoryGirl.create(:article)}
		let(:article_2) { FactoryGirl.create(:article)}
 
  end

end