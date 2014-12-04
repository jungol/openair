# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  abstract       :text
#  publication_id :integer
#

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
    # expect(article).to respond_to(:citing?)
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
  
  
end








