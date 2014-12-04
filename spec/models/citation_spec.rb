# == Schema Information
#
# Table name: citations
#
#  id         :integer          not null, primary key
#  citing_id  :integer
#  cited_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Citation, :type => :model do

  let(:article) { FactoryGirl.create(:article) }
  let(:other_article)  { FactoryGirl.create(:article)}
  let(:citation) { article.citations.build(cited_id: other_article.id)}

  subject { citation }
  
  it "responds to valid methods" do
  	expect(citation).to respond_to(:citing)
  	expect(citation).to respond_to(:cited)
  	expect(citation.citing).to eq(article)
  	expect(citation.cited).to eq(other_article)
  	expect(citation).to be_valid 
  end
  
  it "is invalid without a citing article" do
  	citation.citing = nil
  	expect(citation).not_to be_valid
  end

  it "is invalid without a cited article" do
    citation.cited = nil
    expect(citation).not_to be_valid
  end
  
  context "build_citation method" do
    before(:all) do 
      @article = FactoryGirl.create(:article)
      @article.title = "Adam Smith and Laissez Faire"
      publication = FactoryGirl.create(:publication, volume: 35, issue: 2, year: 1927)
      publication.articles << @article
      publication.journal.name = "Journal of Political Economy"
    end
    # it "works with 1 author" do
    #   @article.authors = []
    #   @article.authors << FactoryGirl.create(:author)
    #   expect(Citation.build_citation(@article)).to eq("Last_Name 1, F. (1927). Adam Smith and Laissez Faire. Journal of Political Economy, 35(2), pp. 437-456.")
    # end

    # it "works with multiple authors" do
    #   @article.authors = []
    #   2.times do
    #     @article.authors << FactoryGirl.create(:author)
    #   end
    #   expect(Citation.build_citation(@article)).to eq("Last_Name 2, F., & Last_Name 3, F. (1927). Adam Smith and Laissez Faire. Journal of Political Economy, 35(2), pp. 437-456.")
    # end
  end
end










