require 'rails_helper'

RSpec.describe "Citation feature:", :type => :feature do

  let(:article) { FactoryGirl.create(:article) }
  let(:other_article) { FactoryGirl.create(:article)}

  context "citation index on article" do
  	it "lists all of its citations" do
  		article.cite!(other_article)
  		visit article_citations_path(article)
  		expect(page).to have_content(other_article.cite_me)
  	end
  end

  context "citation for current article" do
  	it "lists the correct citation" do
  		visit citation_path(article)
  		expect(page).to have_content(article.cite_me)
  	end
  end


  context "cite article link" do
  	specify "prints citation" do
  		visit article_path(article)
  		click_link "Cite this paper"
  		expect(page).to have_content(Citation.build_citation(article))
  	end
  end
 end