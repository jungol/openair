require 'rails_helper'

RSpec.describe Article, :type => :model do
  
  let(:article) { FactoryGirl.create(:article) }
  let(:other_article) { FactoryGirl.create(:article)}
  subject { article }
  
  it "responds to valid methods" do

		expect(article).to respond_to(:title) 
		expect(article).to respond_to(:abstract) 
		expect(article).to respond_to(:authors) 
		expect(article).to respond_to(:sections)
    expect(article).to respond_to(:citations)
    expect(article).to respond_to(:cited_articles)
    expect(article).to respond_to(:edits)
    expect(article).to respond_to(:cite!)
    expect(article).to respond_to(:citing?)
    expect(article).to respond_to(:citing_articles)
    expect(article).to respond_to(:reverse_citations)
    expect(article).to respond_to(:publication)
		expect(article).to be_valid
	
	end

  it "is invalid without title" do
    article.title = ""
    expect(article).not_to be_valid 
	end
    
  it "is invalid without publication_id" do
    article.publication_id = ""
    expect(article).not_to be_valid 
  end

  it "cites other articles" do
    article.cite!(other_article)
    expect(article.cited_articles).to include(other_article)
  end

  it "knows what articles cite it" do
    other_article.cite!(article)
    expect(article.citing_articles).to include(other_article)
  end
  
  it "builds a well-formatted citation of itself with single or multiple authors" do
    article.title = "Adam Smith and Laissez Faire"
    article.authors << FactoryGirl.create(:author, first_name: "Jacob", last_name: "Viner")
    publication = FactoryGirl.create(:publication, volume: 35, issue: 2, year: 1927)
    publication.articles << article
    publication.journal.name = "Journal of Political Economy"
    expect(article.build_citation).to eq("Viner, J. (1927). Adam Smith and Laissez Faire. Journal of Political Economy, 35(2), pp. 437-456.")
    article.authors << FactoryGirl.create(:author, first_name: "Ethan", last_name: "Barhydt")
    expect(article.build_citation).to eq("Viner, J., & Barhydt, E. (1927). Adam Smith and Laissez Faire. Journal of Political Economy, 35(2), pp. 437-456.")
  end
end








