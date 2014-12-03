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
      @article.authors << FactoryGirl.create(:author, first_name: "Jacob", last_name: "Viner")
      publication = FactoryGirl.create(:publication, volume: 35, issue: 2, year: 1927)
      publication.articles << @article
      publication.journal.name = "Journal of Political Economy"
    end
    it "works with 1 author" do
      expect(Citation.build_citation(@article)).to eq("Viner, J. (1927). Adam Smith and Laissez Faire. Journal of Political Economy, 35(2), pp. 437-456.")
    end

    it "works with multiple authors" do
      @article.authors << FactoryGirl.create(:author, first_name: "Ethan", last_name: "Barhydt")
      expect(Citation.build_citation(@article)).to eq("Viner, J., & Barhydt, E. (1927). Adam Smith and Laissez Faire. Journal of Political Economy, 35(2), pp. 437-456.")
    end
  end
end

